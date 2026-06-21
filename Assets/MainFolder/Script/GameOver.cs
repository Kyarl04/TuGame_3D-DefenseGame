using UnityEngine;
using UnityEngine.SceneManagement;

public class GameOver : MonoBehaviour
{
    public string menuSceneName = "MainMenu"; // 메뉴 씬 이름

    public void Retry()
    {
        if (SoundManager.Instance != null) SoundManager.Instance.PlayButtonClick();
        // 1. 씬을 다시 로드하기 전에 혹시 멈춰있을지 모를 시간을 다시 흐르게 합니다!
        Time.timeScale = 1f; 

        // 2. 디졸브 매니저가 있는지 확인하는 안전장치!
        if (SceneTransitionManager.Instance != null)
        {
            // 매니저가 있으면 멋지게 디졸브 효과로 현재 씬 다시 시작
            SceneTransitionManager.Instance.TransitionToScene(SceneManager.GetActiveScene().name);
        }
        else
        {
            // 매니저가 없으면(게임 씬에서 바로 시작한 경우) 쌩얼로(?) 그냥 씬 이동!
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        }
    }

    public void Menu()
    {
        if (SoundManager.Instance != null) SoundManager.Instance.PlayButtonClick();
        // 1. 시간을 다시 흐르게 합니다.
        Time.timeScale = 1f; 

        // 2. 안전장치 적용
        if (SceneTransitionManager.Instance != null)
        {
            SceneTransitionManager.Instance.TransitionToScene(menuSceneName);
        }
        else
        {
            SceneManager.LoadScene(menuSceneName);
        }
    }
}