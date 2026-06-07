using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class Enemy : MonoBehaviour {

    public float startSpeed = 10f;

    [Header("Animation")]
    private Animator anim; 

    [HideInInspector]
    public float speed;

    public float startHealth = 100;
    private float health;

    public int worth = 50;

    public GameObject deathEffect;
	
	[Header("Floating Text")]
    public GameObject damageTextPrefab;

    [Header("Unity Stuff")]
    public Image healthBar;

    [Header("Dissolve Effect")]
    public float dissolveDuration = 1.5f; // 디졸브가 진행될 시간 (초)
    private Renderer[] renderers;

    private bool isDead = false;

    void Start ()
    {
        speed = startSpeed;
        health = startHealth; // SetHealth가 호출되지 않았을 때를 대비한 기본값

        renderers = GetComponentsInChildren<Renderer>();
        anim = GetComponentInChildren<Animator>();
    }

    // ★ [추가된 부분] WaveSpawner에서 몬스터를 스폰할 때 호출하여 체력을 정해줍니다.
    public void SetHealth(float newHealth)
    {
        startHealth = newHealth;
        health = newHealth;
        if (healthBar != null) healthBar.fillAmount = 1f;
    }

    public void TakeDamage (float amount)
    {
        health -= amount;
		
		if (healthBar != null)
            healthBar.fillAmount = health / startHealth;

		if (damageTextPrefab != null)
        {
            // 몬스터 머리 위(Vector3.up * 1.5f)쯤에 생성합니다. 높이는 입맛에 맞게 조절하세요!
            Vector3 textSpawnPos = transform.position + (Vector3.up * 1.5f);
            
            // X, Z축으로 살짝 랜덤하게 퍼져서 나오게 하면 숫자가 겹치지 않아 예쁩니다.
            textSpawnPos += new Vector3(Random.Range(-0.5f, 0.5f), 0, Random.Range(-0.5f, 0.5f));

            GameObject textObj = Instantiate(damageTextPrefab, textSpawnPos, Quaternion.identity);
            
            DamageText dmgText = textObj.GetComponent<DamageText>();
            if (dmgText != null)
            {
                dmgText.SetDamage(amount); // 데미지 수치 전달
            }
        }

        if (health <= 0 && !isDead)
        {
            Die();
        }
    }

    public void Slow (float pct)
    {
        speed = startSpeed * (1f - pct);
    }

    void Die ()
    {
        isDead = true;

        PlayerStats.Money += worth;
        WaveSpawner.EnemiesAlive--; // 죽은 즉시 카운트에서 뺍니다.

        // ★ [추가] 죽었으므로 타워가 더 이상 때리지 못하게 콜라이더를 끕니다.
        Collider col = GetComponent<Collider>();
        if (col != null) col.enabled = false;

        GetComponent<EnemyMovement>().enabled = false;
        if (anim != null)
        {
            anim.SetTrigger("Die");
        }

        speed = 0f;

        StartCoroutine(DissolveRoutine());
    }

    IEnumerator DissolveRoutine()
    {
        float timer = 0f;

        while (timer < dissolveDuration)
        {
            timer += Time.deltaTime;
            
            // 0에서 1까지 서서히 증가하는 값을 계산합니다.
            float dissolveValue = Mathf.Lerp(0f, 1f, timer / dissolveDuration);

            // 몬스터의 모든 재질(Material)에 접근해 파라미터 값을 바꿔줍니다.
            foreach (Renderer rend in renderers)
            {
                if (rend != null && rend.material.HasProperty("_DIntensity2"))
                {
                    rend.material.SetFloat("_DIntensity2", dissolveValue);
                }
            }

            yield return null; // 다음 프레임까지 대기
        }

        // 디졸브가 완전히 끝나서 1이 되면, 기존의 사망 이펙트를 띄우고 삭제합니다.
        if (deathEffect != null)
        {
            GameObject effect = Instantiate(deathEffect, transform.position, Quaternion.identity);
            Destroy(effect, 5f);
        }

        Destroy(gameObject);
    }
}