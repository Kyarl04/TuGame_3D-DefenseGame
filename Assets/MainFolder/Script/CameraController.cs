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
    public Transform centerPoint;
    public float rotationSpeed = 100f;

    [Header("Limits")]
    public float zoomThresholdForEdgePan = 60f; 
    public Vector2 limitX = new Vector2(-50f, 50f); 
    public Vector2 limitZ = new Vector2(-50f, 50f); 

    void Update () {

        // ================= 1. 회전 (Rotation) =================
        if (centerPoint != null)
        {
            // ★ [수정됨] Time.deltaTime 대신 Time.unscaledDeltaTime을 사용하여 일시정지를 무시합니다!
            if (Input.GetKey(KeyCode.Q))
            {
                transform.RotateAround(centerPoint.position, Vector3.up, rotationSpeed * Time.unscaledDeltaTime);
            }
            if (Input.GetKey(KeyCode.E))
            {
                transform.RotateAround(centerPoint.position, Vector3.up, -rotationSpeed * Time.unscaledDeltaTime);
            }
        }

        Vector3 forward = transform.forward;
        forward.y = 0;
        forward.Normalize();
        Vector3 right = transform.right;
        right.y = 0;
        right.Normalize();

        // ================= 2. 이동 (Pan) =================
        Vector3 moveDir = Vector3.zero;
        bool canEdgePan = transform.position.y < zoomThresholdForEdgePan;

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

        // ★ [수정됨] 이동 역시 unscaledDeltaTime을 적용합니다.
        transform.Translate(moveDir.normalized * panSpeed * Time.unscaledDeltaTime, Space.World);

        // ================= 3. 확대/축소 (Zoom) =================
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        Vector3 pos = transform.position;

        // ★ [수정됨] 줌인/줌아웃도 unscaledDeltaTime을 적용하여 일시정지 중에도 부드럽게 작동합니다.
        pos.y -= scroll * 1000 * scrollSpeed * Time.unscaledDeltaTime;
        pos.y = Mathf.Clamp(pos.y, minY, maxY);

        // ================= 4. 이동 영역 제한 (Clamp) =================
        pos.x = Mathf.Clamp(pos.x, limitX.x, limitX.y); 
        pos.z = Mathf.Clamp(pos.z, limitZ.x, limitZ.y);

        transform.position = pos;
    }
}