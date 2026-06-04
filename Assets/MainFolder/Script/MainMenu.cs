using UnityEngine;

public class MainMenu : MonoBehaviour 
{
    // 이동할 본 게임 씬의 이름
    public string levelToLoad = "MainLevel"; 

    // 기존에 있던 SceneFader 변수는 이제 필요 없으니 지워줍니다.

    public void Play()
    {
        // ★ [수정됨] 싱글톤(Instance)으로 등록된 매니저를 불러와 씬 전환 연출을 시작합니다!
        if (SceneTransitionManager.Instance != null)
        {
            SceneTransitionManager.Instance.TransitionToScene(levelToLoad);
        }
        else
        {
            Debug.LogError("SceneTransitionManager를 찾을 수 없습니다!");
        }
    }

    public void Quit()
    {
        Debug.Log("Exiting...");
        Application.Quit();
    }
}