using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using TMPro;

public class WaveSpawner : MonoBehaviour {
    
    public static int EnemiesAlive = 0;
    public Wave[] waves;
    public Transform spawnPoint;
    public float timeBetweenWaves = 5f;
    private float countdown = 2f;

    [Header("UI & Game Settings")]
    public TMP_Text waveCountdownText; 
    public TMP_Text currentWaveText;   
    public TMP_Text enemyCountText;    
    public Image enemyCountGauge;      
    
    public int maxEnemiesAllowed = 50; 
    public GameManager gameManager;
    
    private int waveIndex = 0;
    private bool isGameOver = false;

    void Start()
    {
        EnemiesAlive = 0; 
    }

    void Update ()
    {
        if (isGameOver) return;

        if (EnemiesAlive > maxEnemiesAllowed)
        {
            isGameOver = true;
            Debug.Log("한계치 돌파! 게임 오버!");
            return;
        }

        UpdateUI();

        if (waveIndex == waves.Length)
        {
            if (EnemiesAlive <= 0) 
            {
                gameManager.WinLevel();
                this.enabled = false;
            }
            return;
        }

        if (countdown <= 0f)
        {
            StartCoroutine(SpawnWave());
            countdown = timeBetweenWaves;
            return;
        }

        countdown -= Time.deltaTime;
        countdown = Mathf.Clamp(countdown, 0f, Mathf.Infinity);
    }

    IEnumerator SpawnWave ()
    {
        PlayerStats.Rounds++;

        if (waveIndex >= waves.Length)
        {
            yield break; 
        }

        Wave wave = waves[waveIndex];

        for (int i = 0; i < wave.count; i++)
        {
            SpawnEnemy(wave.enemy, wave.enemyHP);
            yield return new WaitForSeconds(1f / wave.rate);
        }

        waveIndex++; 
    }

    void SpawnEnemy (GameObject enemy, float hp)
    {
        GameObject e = Instantiate(enemy, spawnPoint.position, spawnPoint.rotation);
        
        Enemy enemyScript = e.GetComponent<Enemy>();
        if (enemyScript != null)
        {
            enemyScript.SetHealth(hp);
        }

        EnemiesAlive++; 
    }

    void UpdateUI()
    {
        // ★ 1. 카운트다운을 소수점 없이 정수로 표시합니다. (Mathf.CeilToInt 사용)
        if (waveCountdownText != null)
            waveCountdownText.text = Mathf.CeilToInt(countdown).ToString();

        if (currentWaveText != null)
            currentWaveText.text = waveIndex + " / " + waves.Length;

        if (enemyCountText != null)
        {
            enemyCountText.text = EnemiesAlive + " / " + maxEnemiesAllowed;
            
            if (EnemiesAlive >= maxEnemiesAllowed * 0.8f)
                enemyCountText.color = Color.red;
            else
                enemyCountText.color = Color.white;
        }

        if (enemyCountGauge != null)
        {
            enemyCountGauge.fillAmount = (float)EnemiesAlive / maxEnemiesAllowed;

            // ★ 2. Color.orange 에러 수정 (RGB 값을 직접 입력하여 주황색 생성)
            if (EnemiesAlive >= maxEnemiesAllowed * 0.8f)
                enemyCountGauge.color = Color.red;
            else
                enemyCountGauge.color = new Color(1f, 0.5f, 0f); // 1, 0.5, 0 = 주황색
        }
    }
}