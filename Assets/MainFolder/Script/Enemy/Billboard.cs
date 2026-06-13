using UnityEngine;

public class Billboard : MonoBehaviour
{
    private Camera cam;

    void Start()
    {
        // 메인 카메라를 캐싱해둡니다.
        cam = Camera.main;
    }

    void LateUpdate()
    {
        // 캔버스가 항상 카메라를 바라보게 만듭니다.
        transform.LookAt(transform.position + cam.transform.forward);
    }
}