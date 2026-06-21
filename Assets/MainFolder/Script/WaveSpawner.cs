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

    [Header("Difficulty Settings")]
    [Tooltip("웨이브마다 증가할 적 체력 퍼센트 (0.1 = 10%)")]
    public float healthIncreasePerWave = 0.1f;

    void Start()
    {
        EnemiesAlive = 0; 
        if (nextWaveButton != null) nextWaveButton.SetActive(false);
    }

    void Update()
    {
        if (waveIndex == waves.Length && EnemiesAlive <= 0)
        {
            GameManager.Instance.WinLevel();
            this.enabled = false; // 승리했으니 스포너 스크립트는 기능을 멈춥니다.
            return;
        }

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

        // 웨이브에 들어있는 모든 몬스터 그룹의 소환 작업을 '동시에' 시작시킵니다!
        foreach (EnemyGroup group in wave.enemyGroups)
        {
            StartCoroutine(SpawnGroup(group));
        }

        waveIndex++;
        yield break; // 메인 웨이브 함수는 즉시 종료 (몬스터 소환은 각 코루틴이 알아서 진행)
    }

    // ★ [새로 추가됨] 각 몬스터 그룹마다 개별적으로 돌아가는 소환 전담 일꾼
    IEnumerator SpawnGroup(EnemyGroup group)
    {
        for (int i = 0; i < group.count; i++)
        {
            // 소환 전 체크: 이미 몬스터가 한계치를 넘었는가?
            if (EnemiesAlive >= maxEnemiesAllowed)
            {
                GameOver();
                yield break; // 이 그룹의 소환 중단
            }

            SpawnEnemy(group.enemyPrefab);
            
            // 각 그룹에 설정된 rate(속도)에 맞춰 다음 몬스터 소환까지 대기
            yield return new WaitForSeconds(1f / group.rate);
        }
    }

    void SpawnEnemy(GameObject enemyPrefab)
    {
        EnemiesAlive++; // 몬스터가 새로 태어날 때마다 카운트 증가
        
        // 1. 몬스터 소환
        GameObject enemyGO = Instantiate(enemyPrefab, spawnPoint.position, spawnPoint.rotation);
        
        // 2. 몬스터의 Enemy 컴포넌트 가져오기
        Enemy enemyComponent = enemyGO.GetComponent<Enemy>();
        
        if (enemyComponent != null)
        {
            // 3. 프리팹에 원래 설정된 기본 체력을 가져옵니다.
            float baseHealth = enemyComponent.startHealth;
            
            // 4. 새로운 체력 계산 (기본 체력 * (1 + (0.1 * 웨이브 횟수)))
            // 예: 0웨이브(시작) = 100%, 1웨이브 = 110%, 2웨이브 = 120%...
            float calculatedHealth = baseHealth * (1f + (healthIncreasePerWave * waveIndex));
            
            // 5. 계산된 체력을 몬스터에게 덮어씌웁니다!
            enemyComponent.SetHealth(calculatedHealth);
        }
    }

    // ★ 몬스터가 죽을 때 호출해야 할 메서드 (Enemy.cs에서 호출 필요)
    public static void EnemyDied()
    {
        EnemiesAlive--;
    }

    void GameOver()
    {
        Debug.Log("몬스터가 너무 많습니다! 게임 오버!");
        GameManager.Instance.EndGame();
    }

    public void SkipCountdown()
    {
        countdown = 0f;
        // ★ [수정] 사운드 매니저가 있는지 확인하는 안전장치!
        if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayWaveSkip();
        }
    }
}