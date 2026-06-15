using UnityEngine;
using TMPro; // 텍스트를 제어하기 위해 꼭 필요합니다!

public class GameSpeedManager : MonoBehaviour
{
    [Header("UI Settings")]
    [Tooltip("배속 버튼 안에 있는 TextMeshPro 텍스트 컴포넌트를 넣으세요")]
    public TMP_Text speedText; 

    private int currentSpeed = 1;

    void Start()
    {
        // 씬이 시작될 때는 항상 1배속으로 초기화합니다.
        SetSpeed(1);
    }

    // UI 버튼을 클릭할 때마다 이 함수가 실행됩니다.
    public void OnSpeedButtonClicked()
    {
        currentSpeed++;
        
        // 3배속을 넘어가면 다시 1배속으로 돌아옵니다.
        if (currentSpeed > 3)
        {
            currentSpeed = 1;
        }

        SetSpeed(currentSpeed);

        // 버튼 누를 때 찰칵! 소리
        if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayButtonClick();
        }
    }

    private void SetSpeed(int speed)
    {
        currentSpeed = speed;
        
        // 유니티 게임 전체의 흐름(시간)을 배속합니다.
        Time.timeScale = currentSpeed;

        // 속도에 맞춰 버튼 안의 텍스트 글자를 교체합니다.
        if (speedText != null)
        {
            speedText.text = "X" + currentSpeed.ToString(); // "X1", "X2", "X3" 로 출력됨
        }
    }

    void OnDestroy()
    {
        // 게임 씬이 종료되거나 메뉴로 나갈 때, 시간이 3배속으로 굳어버리는 것을 방지합니다.
        Time.timeScale = 1f;
    }
}