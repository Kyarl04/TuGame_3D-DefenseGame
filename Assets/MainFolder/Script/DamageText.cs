using UnityEngine;
using TMPro; // TextMeshPro 사용

public class DamageText : MonoBehaviour
{
    public float moveSpeed = 2.0f;  // 위로 올라가는 속도
    public float fadeSpeed = 2.0f;  // 투명해지는 속도
    public float destroyTime = 1.5f; // 몇 초 뒤에 삭제할 것인지
    
    private TextMeshPro textMesh; // UI가 아닌 3D TextMeshPro입니다.
    private Color textColor;
    private Camera mainCam;

    void Awake()
    {
        textMesh = GetComponent<TextMeshPro>();
        if (textMesh != null) textColor = textMesh.color;
        
        mainCam = Camera.main; // 메인 카메라 찾기
        
        // 생성되고 일정 시간이 지나면 자동으로 파괴됩니다.
        Destroy(gameObject, destroyTime);
    }

    void Update()
    {
        // 1. 글자가 항상 카메라(화면)를 바라보게 만듭니다. (빌보드 효과)
        if (mainCam != null)
        {
            transform.rotation = mainCam.transform.rotation;
        }

        // 2. 글자를 위로 이동시킵니다.
        transform.Translate(Vector3.up * moveSpeed * Time.deltaTime, Space.World);
        
        // 3. 서서히 투명하게 만듭니다.
        if (textMesh != null)
        {
            textColor.a -= fadeSpeed * Time.deltaTime;
            textMesh.color = textColor;
        }
    }

    // Enemy.cs에서 데미지를 전달해 줄 함수
    public void SetDamage(float damage)
    {
        if (textMesh == null) textMesh = GetComponent<TextMeshPro>();
        
        // 소수점은 빼고 정수로만 표시 ("F0")
        textMesh.text = damage.ToString("F0"); 
    }
}