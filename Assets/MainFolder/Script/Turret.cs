using UnityEngine;
using System.Collections;

public class Turret : MonoBehaviour {

    private Transform target;
    private Enemy targetEnemy;

    [Header("General")]
    public float range = 15f;

    [Header("Use Bullets (default)")]
    public GameObject bulletPrefab;
    
    public float baseFireRate = 1f;
    public int baseBulletDamage = 50; 
    
    [HideInInspector] public float currentFireRate;
    [HideInInspector] public int currentBulletDamage;
    
    private float fireCountdown = 0f;

    [Header("Use Laser")]
    public bool useLaser = false;
    public int damageOverTime = 30;
    public float slowAmount = .5f;

    public LineRenderer lineRenderer;
    public ParticleSystem impactEffect;
    public Light impactLight;

    [Header("Unity Setup Fields")]
    public string enemyTag = "Enemy";
    public Transform partToRotate;
    public float turnSpeed = 10f;

    public Transform[] firePoints; 
    private int firePointIndex = 0;

    private Quaternion idleRotation; // 대기 상태 각도 저장용

    void Start () 
    {
        InvokeRepeating("UpdateTarget", 0f, 0.5f);
        ApplyUpgrades(); 

        if (partToRotate != null)
        {
            idleRotation = partToRotate.rotation;
        }
    }
    
    public void ApplyUpgrades()
    {
        if (UpgradeManager.instance != null)
        {
            currentBulletDamage = baseBulletDamage + (UpgradeManager.instance.atkLevel * UpgradeManager.instance.bonusDamagePerLevel);
            currentFireRate = baseFireRate + (UpgradeManager.instance.spdLevel * UpgradeManager.instance.bonusSpeedPerLevel);
        }
        else
        {
            currentBulletDamage = baseBulletDamage;
            currentFireRate = baseFireRate;
        }
    }

    void UpdateTarget ()
    {
        GameObject[] enemies = GameObject.FindGameObjectsWithTag(enemyTag);
        float shortestDistance = Mathf.Infinity;
        
        GameObject nearestEnemy = null;
        Enemy nearestEnemyComponent = null;

        foreach (GameObject enemy in enemies)
        {
            // ★ [핵심] 자식 오브젝트가 잡혔을 경우를 대비해 부모의 Enemy 컴포넌트를 가져옵니다.
            Enemy e = enemy.GetComponentInParent<Enemy>();
            
            // ★ 스크립트가 아예 없거나, 이미 디졸브 중(죽음)이라면 무조건 무시합니다!
            if (e == null || e.isDead) 
                continue;

            float distanceToEnemy = Vector3.Distance(transform.position, enemy.transform.position);
            if (distanceToEnemy < shortestDistance)
            {
                shortestDistance = distanceToEnemy;
                nearestEnemy = enemy;
                nearestEnemyComponent = e;
            }
        }

        if (nearestEnemy != null && shortestDistance <= range)
        {
            target = nearestEnemy.transform;
            targetEnemy = nearestEnemyComponent;
        } 
        else
        {
            target = null;
            targetEnemy = null;
        }
    }

    void Update () {
        // ★ 조준 중인 타겟이 오류가 생겼거나 죽었다면 즉시 타겟팅 해제
        if (target != null)
        {
            if (targetEnemy == null || targetEnemy.isDead)
            {
                target = null; 
                targetEnemy = null;
            }
        }

        // 조준할 타겟이 없는 경우 (대기 상태)
        if (target == null)
        {
            if (useLaser)
            {
                if (lineRenderer.enabled)
                {
                    lineRenderer.enabled = false;
                    impactEffect.Stop();
                    impactLight.enabled = false;
                }
            }

            // 고개를 부드럽게 정면으로 되돌립니다.
            if (partToRotate != null)
            {
                partToRotate.rotation = Quaternion.Lerp(partToRotate.rotation, idleRotation, Time.deltaTime * turnSpeed * 0.5f);
            }

            return; 
        }

        LockOnTarget();

        if (useLaser)
        {
            Laser();
        } 
        else
        {
            if (fireCountdown <= 0f)
            {
                Shoot();
                fireCountdown = 1f / currentFireRate;
            }

            fireCountdown -= Time.deltaTime;
        }
    }

    void LockOnTarget ()
    {
        Vector3 dir = target.position - transform.position;
        Quaternion lookRotation = Quaternion.LookRotation(dir);
        Vector3 rotation = Quaternion.Lerp(partToRotate.rotation, lookRotation, Time.deltaTime * turnSpeed).eulerAngles;

        partToRotate.rotation = Quaternion.Euler(-90f, 0f, rotation.y);
    }

    void Laser ()
    {
        if (firePoints.Length == 0) return;
        Transform fPoint = firePoints[0];

        targetEnemy.TakeDamage(damageOverTime * Time.deltaTime);
        targetEnemy.Slow(slowAmount);

        if (!lineRenderer.enabled)
        {
            lineRenderer.enabled = true;
            impactEffect.Play();
            impactLight.enabled = true;
        }

        lineRenderer.SetPosition(0, fPoint.position);
        lineRenderer.SetPosition(1, target.position);

        Vector3 dir = fPoint.position - target.position;
        impactEffect.transform.position = target.position + dir.normalized;
        impactEffect.transform.rotation = Quaternion.LookRotation(dir);
    }

    void Shoot ()
    {
        if (firePoints.Length == 0) return;

        Transform fPoint = firePoints[firePointIndex];

        GameObject bulletGO = Instantiate(bulletPrefab, fPoint.position, fPoint.rotation);
        Bullet bullet = bulletGO.GetComponent<Bullet>();
        SoundManager.Instance.PlayTowerShoot();

        if (bullet != null)
        {
            bullet.Seek(target);
            bullet.damage = currentBulletDamage; 
        }

        firePointIndex++;
        if (firePointIndex >= firePoints.Length)
        {
            firePointIndex = 0;
        }
    }

    void OnDrawGizmosSelected ()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, range);
    }
}