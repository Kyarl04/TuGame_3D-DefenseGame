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
    public int maxEnemiesAllowed = 50;

    [Header("Wave Settings")]
    public Wave[] waves; 
    public Transform spawnPoint;
    public float timeBetweenWaves = 30f; // 웨이브 간격
    private float countdown = 5f;        // 시작 대기 시간
    private int waveIndex = 0;

    [Header("UI")]
    public TMP_Text waveCountdownText;
    public TMP_Text enemyCountText;     // 1. 몬스터 수 표시용 텍스트 추가
    public GameObject nextWaveButton;
    public TMP_Text currentWaveText;

    void Start()
    {
        EnemiesAlive = 0; 
        if (nextWaveButton != null) nextWaveButton.SetActive(false);
    }

    void Update()
    {
        if (enemyCountText != null)
            enemyCountText.text = EnemiesAlive.ToString() + " / " + maxEnemiesAllowed.ToString();

        if (currentWaveText != null)
        {
            int displayWave = Mathf.Clamp(waveIndex + 1, 1, waves.Length);
            currentWaveText.text = displayWave.ToString() + " / " + waves.Length.ToString();
        }

        if (countdown <= 0f)
        {
            if (waveIndex < waves.Length)
            {
                StartCoroutine(SpawnWave());
                countdown = timeBetweenWaves;
            }
        }
        else
        {
            countdown -= Time.deltaTime;
        }

        // 3. 타이머 UI 갱신
        if (waveCountdownText != null)
            waveCountdownText.text = Mathf.CeilToInt(countdown).ToString();

        // 4. 스킵 버튼 제어
        if (nextWaveButton != null)
        {
            bool isWaitingForNext = (countdown > 0f && countdown < (timeBetweenWaves - 5f));
            nextWaveButton.SetActive(isWaitingForNext && waveIndex < waves.Length);
        }
    }

    IEnumerator SpawnWave()
    {
        Wave wave = waves[waveIndex];

        foreach (EnemyGroup group in wave.enemyGroups)
        {
            for (int i = 0; i < group.count; i++)
            {
                // ★ [중요] 소환 전 체크: 이미 몬스터가 50마리 이상인가?
                if (EnemiesAlive >= maxEnemiesAllowed)
                {
                    GameOver();
                    yield break; // 소환 중단
                }

                SpawnEnemy(group.enemyPrefab);
                yield return new WaitForSeconds(1f / group.rate);
            }
        }
        waveIndex++;
    }

    void SpawnEnemy(GameObject enemyPrefab)
    {
        EnemiesAlive++; // 몬스터가 새로 태어날 때마다 카운트 증가
        Instantiate(enemyPrefab, spawnPoint.position, spawnPoint.rotation);
    }

    // ★ 몬스터가 죽을 때 호출해야 할 메서드 (Enemy.cs에서 호출 필요)
    public static void EnemyDied()
    {
        EnemiesAlive--;
    }

    void GameOver()
    {
        Debug.Log("몬스터가 너무 많습니다! 게임 오버!");
        // 여기에 게임 오버 로직(예: GameManager.EndGame())을 연결하세요.
    }

    public void SkipCountdown()
    {
        countdown = 0f;
        SoundManager.Instance.PlayWaveSkip();
    }
}