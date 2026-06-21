using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {

	public static GameManager Instance;
	public static bool GameIsOver;

	public GameObject gameOverUI;
	public GameObject completeLevelUI;

    // ★ Instance 등록을 Awake로 이동하여 가장 먼저 준비되게 합니다.
    void Awake()
    {
        Instance = this;
    }

	void Start ()
	{
		GameIsOver = false;
		
		if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayGameBGM();
        }
	}

	void Update () {
		if (GameIsOver)
			return;

		if (PlayerStats.Lives <= 0)
		{
			EndGame();
		}
	}

    // ★ public을 붙여서 WaveSpawner가 이 함수를 부를 수 있게 열어줍니다!
	public void EndGame ()
	{
		GameIsOver = true;
		gameOverUI.SetActive(true);
	}

	public void WinLevel ()
	{
		GameIsOver = true;
		completeLevelUI.SetActive(true);
	}
}