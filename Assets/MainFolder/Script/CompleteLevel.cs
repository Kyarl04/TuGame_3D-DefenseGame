using UnityEngine;
using UnityEngine.SceneManagement; // 현재 씬 이름을 가져오기 위해 추가

public class CompleteLevel : MonoBehaviour {

    [Header("Scene Routing")]
    public string menuSceneName = "MainMenu";
    public SceneFader sceneFader;

    // (선택) 클리어 후 다시 도전하고 싶을 때
    public void Retry ()
    {
        // 현재 활성화된 씬(메인 게임)을 다시 로드합니다.
        sceneFader.FadeTo(SceneManager.GetActiveScene().name);
    }

    // 메인 메뉴로 돌아가기
    public void Menu ()
    {
        sceneFader.FadeTo(menuSceneName);
    }
}