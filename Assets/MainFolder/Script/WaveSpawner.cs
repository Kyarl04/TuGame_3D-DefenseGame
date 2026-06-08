using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using TMPro;

[System.Serializable]
public class EnemyGroup
{
    public GameObject enemyPrefab; 
    public int count;              
    public float rate;             
}

[System.Serializable]
public class Wave
{
    public string waveName;        
    public EnemyGroup[] enemyGroups; 
}

public class WaveSpawner : MonoBehaviour
{
    public static int EnemiesAlive = 0;

    [Header("Wave Settings")]
    public Wave[] waves; 

    public Transform spawnPoint;
    public float timeBetweenWaves = 5f;
    private float countdown = 2f;

    [Header("UI")]
    public TMP_Text waveCountdownText;
    public GameObject nextWaveButton; // ★ [추가] 다음 웨이브 건너뛰기 버튼 오브젝트

    private int waveIndex = 0;

    void Start()
    {
        EnemiesAlive = 0; 

        // 게임 시작 시 버튼은 잠시 꺼둡니다.
        if (nextWaveButton != null)
        {
            nextWaveButton.SetActive(false);
        }
    }

    void Update()
    {
        if (EnemiesAlive > 0)
        {
            if (nextWaveButton != null && nextWaveButton.activeSelf)
            {
                nextWaveButton.SetActive(false);
            }
            return;
        }

        if (nextWaveButton != null && !nextWaveButton.activeSelf && waveIndex < waves.Length)
        {
            nextWaveButton.SetActive(true);
        }

        if (countdown <= 0f)
        {
            StartCoroutine(SpawnWave());
            countdown = timeBetweenWaves; 

            // ★ [수정 1] 소수점을 떼고 정수(올림)로 표시합니다.
            if (waveCountdownText != null)
            {
                waveCountdownText.text = Mathf.CeilToInt(countdown).ToString();
            }
            
            return;
        }

        countdown -= Time.deltaTime;
        countdown = Mathf.Clamp(countdown, 0f, Mathf.Infinity);

        // ★ [수정 2] 소수점을 떼고 정수(올림)로 표시합니다.
        if (waveCountdownText != null)
        {
            waveCountdownText.text = Mathf.CeilToInt(countdown).ToString();
        }
    }

    IEnumerator SpawnWave()
    {
        // 웨이브가 시작되면 즉시 버튼을 숨깁니다.
        if (nextWaveButton != null)
        {
            nextWaveButton.SetActive(false);
        }

        Wave wave = waves[waveIndex];

        int totalEnemiesThisWave = 0;
        foreach (EnemyGroup group in wave.enemyGroups)
        {
            totalEnemiesThisWave += group.count;
        }
        EnemiesAlive = totalEnemiesThisWave;

        foreach (EnemyGroup group in wave.enemyGroups)
        {
            for (int i = 0; i < group.count; i++)
            {
                SpawnEnemy(group.enemyPrefab); 
                yield return new WaitForSeconds(1f / group.rate);
            }
        }

        waveIndex++;

        if (waveIndex == waves.Length)
        {
            Debug.Log("모든 웨이브 클리어! 게임 승리!");
            // 게임이 끝났으므로 버튼을 완전히 숨깁니다.
            if (nextWaveButton != null) nextWaveButton.SetActive(false);
            this.enabled = false; 
        }
    }

    void SpawnEnemy(GameObject enemyPrefab)
    {
        Instantiate(enemyPrefab, spawnPoint.position, spawnPoint.rotation);
    }

    // ★ [추가] UI 버튼이 눌렸을 때 호출할 함수
    public void SkipCountdown()
    {
        // 혹시라도 몬스터가 아직 살아있다면 작동하지 않도록 방어막을 칩니다.
        if (EnemiesAlive > 0) return;

        // 남은 대기 시간을 즉시 0으로 만들어서 다음 프레임에 Update문이 웨이브를 시작하게 만듭니다.
        countdown = 0f;
    }
}