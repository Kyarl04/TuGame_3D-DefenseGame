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

    public TMP_Text waveCountdownText; // 에디터에서 꼭 할당해야 함!
    public GameManager gameManager;
    private int waveIndex = 0;

    void Update ()
    {
        // [수정] 랜타디는 몬스터가 살아있어도 다음 웨이브가 나와야 하므로 
        // 기존의 'if (EnemiesAlive > 0) return;' 로직을 삭제하거나 주석 처리합니다.

        if (waveIndex == waves.Length)
        {
            // 모든 웨이브가 스폰된 후, 남아있는 적이 없을 때 승리 처리 (선택 사항)
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

        // [방어 코드] 텍스트가 할당되어 있을 때만 실행하여 Null 에러 방지
        if (waveCountdownText != null)
        {
            waveCountdownText.text = string.Format("{0:00.00}", countdown);
        }
    }

    IEnumerator SpawnWave ()
	{
		PlayerStats.Rounds++;

		// [수정] 현재 waveIndex가 배열 크기 안에 있는지 확인
		if (waveIndex >= waves.Length)
		{
			Debug.Log("모든 웨이브가 끝났습니다.");
			yield break; 
		}

		Wave wave = waves[waveIndex];
		// EnemiesAlive = wave.count; // 이 부분은 몬스터가 누적되길 원한다면 += wave.count로 수정하거나 관리 방식을 바꿔야 합니다.

		for (int i = 0; i < wave.count; i++)
		{
			SpawnEnemy(wave.enemy);
			yield return new WaitForSeconds(1f / wave.rate);
		}

		waveIndex++; // 여기서 증가된 index가 다음 호출 때 배열 길이를 넘지 않아야 함
	}

    void SpawnEnemy (GameObject enemy)
    {
        Instantiate(enemy, spawnPoint.position, spawnPoint.rotation);
        EnemiesAlive++; // 적이 생성될 때마다 카운트 증가
    }
}