using UnityEngine;

public class Bullet : MonoBehaviour {

	private Transform target;

	public float speed = 70f;

	public int damage = 50;

	public float explosionRadius = 0f;
	public GameObject impactEffect;
	
	public void Seek (Transform _target)
	{
		target = _target;
	}

	// Update is called once per frame
	void Update () {

		if (target == null)
		{
			Destroy(gameObject);
			return;
		}

		Vector3 dir = target.position - transform.position;
		float distanceThisFrame = speed * Time.deltaTime;

		if (dir.magnitude <= distanceThisFrame)
		{
			HitTarget();
			return;
		}

		transform.Translate(dir.normalized * distanceThisFrame, Space.World);
		transform.LookAt(target);

	}

	void HitTarget()
    {
        // 1. 이펙트 생성 (이펙트 프리팹이 안 비어있을 때만!)
        if (impactEffect != null)
        {
            GameObject effectIns = Instantiate(impactEffect, transform.position, transform.rotation);
            Destroy(effectIns, 5f); // 이펙트 찌꺼기 정리
        }

        // 2. 사운드 재생 (★ 이 부분에 안전장치가 없어서 무한루프가 돌았을 겁니다!)
        if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayBulletHit();
        }

        // 3. 데미지 주기 로직 (폭발 범위가 있다면 OverlapSphere 사용, 없다면 그냥 타겟 타격)
        if (explosionRadius > 0f)
        {
            Explode();
        }
        else
        {
            Damage(target);
        }

        // 4. 무슨 일이 있어도 총알은 무조건 파괴되도록 맨 마지막에 배치!
        Destroy(gameObject);
    }
	void Explode ()
    {
        Collider[] colliders = Physics.OverlapSphere(transform.position, explosionRadius);
        foreach (Collider collider in colliders)
        {
            if (collider.tag == "Enemy")
            {
                Damage(collider.transform);
            }
        }
    }

    void Damage (Transform enemy)
    {
        // ★ [핵심 수정] 타워때와 마찬가지로 부모 오브젝트의 Enemy 컴포넌트를 가져옵니다!
        Enemy e = enemy.GetComponentInParent<Enemy>();

        if (e != null)
        {
            e.TakeDamage(damage);
        }
    }

    void OnDrawGizmosSelected ()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, explosionRadius);
    }
}
