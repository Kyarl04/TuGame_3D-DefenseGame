using UnityEngine;

public class CameraController : MonoBehaviour {

    [Header("Movement")]
    public float panSpeed = 30f;
    public float panBorderThickness = 10f;

    [Header("Zoom")]
    public float scrollSpeed = 5f;
    public float minY = 10f;
    public float maxY = 80f;

    [Header("Rotation")]
    public Transform centerPoint; // 1. 중앙 포인트 오브젝트
    public float rotationSpeed = 100f;

    [Header("Limits")]
    public float zoomThresholdForEdgePan = 60f; // 3. 이 높이보다 낮게 확대되어야만 마우스 가장자리 이동 가능
    public Vector2 limitX = new Vector2(-50f, 50f); // 3. X축 이동 제한 영역 (최소, 최대)
    public Vector2 limitZ = new Vector2(-50f, 50f); // 3. Z축 이동 제한 영역 (최소, 최대)

    void Update () {

        // 기존의 게임 오버 체크 유지
        // if (GameManager.GameIsOver)
        // {
        //     this.enabled = false;
        //     return;
        // }

        // ================= 1. 회전 (Rotation) =================
        if (centerPoint != null)
        {
            // 중앙 오브젝트를 기준으로 Q는 왼쪽, E는 오른쪽으로 회전합니다.
            if (Input.GetKey(KeyCode.Q))
            {
                transform.RotateAround(centerPoint.position, Vector3.up, rotationSpeed * Time.deltaTime);
            }
            if (Input.GetKey(KeyCode.E))
            {
                transform.RotateAround(centerPoint.position, Vector3.up, -rotationSpeed * Time.deltaTime);
            }
        }

        // 카메라가 회전해도 키보드 이동이 '현재 화면의 상하좌우'로 자연스럽게 작동하도록 방향 계산
        Vector3 forward = transform.forward;
        forward.y = 0;
        forward.Normalize();
        Vector3 right = transform.right;
        right.y = 0;
        right.Normalize();

        // ================= 2. 이동 (Pan) =================
        Vector3 moveDir = Vector3.zero;

        // 현재 카메라 높이(y)가 설정한 임계값보다 낮을 때(확대되었을 때)만 true가 됩니다.
        bool canEdgePan = transform.position.y < zoomThresholdForEdgePan;

        // 키보드(WASD)는 항상 작동하게 하되, 마우스 가장자리 이동은 canEdgePan이 true일 때만 작동합니다.
        if (Input.GetKey("w") || (canEdgePan && Input.mousePosition.y >= Screen.height - panBorderThickness))
        {
            moveDir += forward;
        }
        if (Input.GetKey("s") || (canEdgePan && Input.mousePosition.y <= panBorderThickness))
        {
            moveDir -= forward;
        }
        if (Input.GetKey("d") || (canEdgePan && Input.mousePosition.x >= Screen.width - panBorderThickness))
        {
            moveDir += right;
        }
        if (Input.GetKey("a") || (canEdgePan && Input.mousePosition.x <= panBorderThickness))
        {
            moveDir -= right;
        }

        // 계산된 방향으로 이동 (Space.World를 쓰되, 방향 자체를 카메라 기준으로 맞춰두었습니다)
        transform.Translate(moveDir.normalized * panSpeed * Time.deltaTime, Space.World);

        // ================= 3. 확대/축소 (Zoom) - 기존 코드 완벽 유지 =================
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        Vector3 pos = transform.position;

        pos.y -= scroll * 1000 * scrollSpeed * Time.deltaTime;
        pos.y = Mathf.Clamp(pos.y, minY, maxY);

        // ================= 4. 이동 영역 제한 (Clamp) =================
        // 계산된 최종 위치가 특정한 X, Z 영역을 벗어나지 못하도록 가둬둡니다.
        pos.x = Mathf.Clamp(pos.x, limitX.x, limitX.y);
        pos.z = Mathf.Clamp(pos.z, limitZ.x, limitZ.y);

        // 최종 위치를 카메라에 적용
        transform.position = pos;
    }
}