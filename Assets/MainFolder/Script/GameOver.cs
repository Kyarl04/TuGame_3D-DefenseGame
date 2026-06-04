using UnityEngine;
using UnityEngine.SceneManagement;

public class GameOver : MonoBehaviour {

    [Header("Scene Routing")]
    public string menuSceneName = "MainMenu";
    public SceneFader sceneFader;

    // 게임 오버 후 다시 도전
    public void Retry ()
    {
        // 현재 씬(메인 게임)을 다시 로드합니다.
        sceneFader.FadeTo(SceneManager.GetActiveScene().name);
    }

    // 메인 메뉴로 돌아가기
    public void Menu ()
    {
        sceneFader.FadeTo(menuSceneName);
    }
}