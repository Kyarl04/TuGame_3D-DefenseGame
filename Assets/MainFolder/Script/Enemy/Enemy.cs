using UnityEngine;
using UnityEngine.UI;

public class Enemy : MonoBehaviour {

    public float startSpeed = 10f;

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

    private bool isDead = false;

    void Start ()
    {
        speed = startSpeed;
        health = startHealth; // SetHealth가 호출되지 않았을 때를 대비한 기본값
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

        GameObject effect = (GameObject)Instantiate(deathEffect, transform.position, Quaternion.identity);
        Destroy(effect, 5f);

        WaveSpawner.EnemiesAlive--;

        Destroy(gameObject);
    }
}