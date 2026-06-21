using UnityEngine;

public class MenuBGMStarter : MonoBehaviour
{
    void Start()
    {
        // 메뉴 씬이 열릴 때마다 메뉴 BGM을 틀어줍니다.
        // (SoundManager 내부에 같은 음악일 경우 무시하는 방어 코드가 있으므로 중복 재생되지 않습니다!)
        if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayMenuBGM();
        }
    }
}