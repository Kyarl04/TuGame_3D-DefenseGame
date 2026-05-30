using UnityEngine;
using System.Collections;

public class Turret : MonoBehaviour {

    private Transform target;
    private Enemy targetEnemy;

    [Header("General")]
    public float range = 15f;

    [Header("Use Bullets (default)")]
    public GameObject bulletPrefab;
    
    // 업그레이드 적용 전 기본 스탯
    public float baseFireRate = 1f;
    public int baseBulletDamage = 50; 
    
    // 업그레이드가 적용된 최종 스탯
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

    void Start () {
        InvokeRepeating("UpdateTarget", 0f, 0.5f);
        ApplyUpgrades(); // 시작할 때 업그레이드 수치 적용
    }
    
    // ★ [추가] UpgradeManager에서 보너스를 가져와서 내 스탯을 강화하는 함수
    public void ApplyUpgrades()
    {
        if (UpgradeManager.instance != null)
        {
            // 최종 공격력 = 기본 공격력 + (업그레이드 레벨 * 레벨당 증가량)
            currentBulletDamage = baseBulletDamage + (UpgradeManager.instance.atkLevel * UpgradeManager.instance.bonusDamagePerLevel);
            
            // 최종 공속 = 기본 공속 + (업그레이드 레벨 * 레벨당 증가량)
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

        foreach (GameObject enemy in enemies)
        {
            float distanceToEnemy = Vector3.Distance(transform.position, enemy.transform.position);
            if (distanceToEnemy < shortestDistance)
            {
                shortestDistance = distanceToEnemy;
                nearestEnemy = enemy;
            }
        }

        if (nearestEnemy != null && shortestDistance <= range)
        {
            target = nearestEnemy.transform;
            targetEnemy = nearestEnemy.GetComponent<Enemy>();
        } 
        else
        {
            target = null;
        }
    }

    void Update () {
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
                // [수정] currentFireRate 사용
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

        if (bullet != null)
        {
            bullet.Seek(target);
            
            // [수정] currentBulletDamage 사용
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