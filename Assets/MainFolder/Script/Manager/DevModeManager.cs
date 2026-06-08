using UnityEngine;

public class DevModeManager : MonoBehaviour
{
    [Header("UI Elements")]
    public GameObject devPanel; // 개발자 패널 UI 오브젝트

    private bool isDevModeActive = false;

    void Start()
    {
        // 게임 시작 시 개발자 패널은 자동으로 숨깁니다.
        if (devPanel != null)
        {
            devPanel.SetActive(false);
        }
    }

    void Update()
    {
        // 1. 게임 중 언제든 F1 키를 누르면 개발자 모드를 토글합니다.
        if (Input.GetKeyDown(KeyCode.F1))
        {
            ToggleDevMode();
        }
    }

    private void ToggleDevMode()
    {
        isDevModeActive = !isDevModeActive;

        // 패널 켜고 끄기
        if (devPanel != null)
        {
            devPanel.SetActive(isDevModeActive);
        }

        // 2. 일시정지 처리 (Time.timeScale을 0으로 만들면 게임 내 모든 물리/시간이 멈춥니다)
        Time.timeScale = isDevModeActive ? 0f : 1f;

        Debug.Log(isDevModeActive ? "개발자 모드 ON (게임 일시정지)" : "개발자 모드 OFF (게임 재개)");
    }

    // 3. 골드 추가 버튼에 연결할 치트 함수
    public void AddCheatGold()
    {
        // 기존에 사용 중인 PlayerStats.Money 구조에 10000G를 더합니다.
        PlayerStats.Money += 10000;
        
        Debug.Log("치트 활동: 10,000 골드 획득! 현재 자산: " + PlayerStats.Money + "G");
    }
}