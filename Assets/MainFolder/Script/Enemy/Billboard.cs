using UnityEngine;

public class Billboard : MonoBehaviour {
    void LateUpdate () {
        // HP 바가 항상 메인 카메라를 정면으로 바라보게 함
        transform.LookAt(transform.position + Camera.main.transform.forward);
    }
}