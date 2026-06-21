using UnityEngine;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour {

    [Header("UI Panels")]
    public GameObject optionsPanel; 
    
    [Header("Scene Settings")]
    public string menuSceneName = "MainMenu"; 

    public void OpenOptions()
    {
        // ★ [추가] 코드로 직접 버튼 소리 재생!
        if (SoundManager.Instance != null) SoundManager.Instance.PlayButtonClick();

        if (optionsPanel != null)
        {
            optionsPanel.SetActive(true);
            Time.timeScale = 0f; 
        }
    }

    public void CloseOptions()
    {
        // ★ [추가] 코드로 직접 버튼 소리 재생!
        if (SoundManager.Instance != null) SoundManager.Instance.PlayButtonClick();

        if (optionsPanel != null)
        {
            optionsPanel.SetActive(false);
            Time.timeScale = 1f; 
        }
    }

    public void QuitToMenu()
    {
        // ★ [추가] 코드로 직접 버튼 소리 재생!
        if (SoundManager.Instance != null) SoundManager.Instance.PlayButtonClick();

        Time.timeScale = 1f; 

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