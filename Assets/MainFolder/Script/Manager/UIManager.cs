using UnityEngine;

public class UIManager : MonoBehaviour {

    [Header("UI Panels")]
    public GameObject optionsPanel; // 옵션 창 패널

    // 옵션 열기 버튼에 연결할 함수
    public void OpenOptions()
    {
        if (optionsPanel != null)
        {
            optionsPanel.SetActive(true);
            Time.timeScale = 0f; // 옵션 창을 열면 게임 일시정지
        }
    }

    // 옵션 닫기 버튼에 연결할 함수
    public void CloseOptions()
    {
        if (optionsPanel != null)
        {
            optionsPanel.SetActive(false);
            Time.timeScale = 1f; // 게임 다시 진행
        }
    }
}