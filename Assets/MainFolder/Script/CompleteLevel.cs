using UnityEngine;
using UnityEngine.SceneManagement;

public class CompleteLevel : MonoBehaviour
{
    public string menuSceneName = "MainMenu";

    public void Menu()
    {
        if (SoundManager.Instance != null) SoundManager.Instance.PlayButtonClick();
        
        Time.timeScale = 1f; // 일시정지 해제

        // ★ [수정] 디졸브 매니저 안전장치 추가
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