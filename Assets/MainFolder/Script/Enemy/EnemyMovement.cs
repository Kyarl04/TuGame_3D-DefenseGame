using UnityEngine;

[RequireComponent(typeof(Enemy))]
public class EnemyMovement : MonoBehaviour
{
    public float turnSpeed = 10f;
    private Transform target;
    private int wavePointIndex = 0;
    
    private Enemy enemy;

    void Start()
    {
        enemy = GetComponent<Enemy>();
        // 첫 번째 웨이포인트를 타겟으로 설정
        target = Waypoints.points[0];
    }

    void Update()
    {
        Vector3 dir = target.position - transform.position;
        transform.Translate(dir.normalized * enemy.speed * Time.deltaTime, Space.World);

        if (dir != Vector3.zero)
        {
            // 목표 방향을 바라보는 각도를 계산합니다.
            Quaternion lookRotation = Quaternion.LookRotation(dir);
            
            // 확 돌지 않고 부드럽게(Lerp) 회전하도록 만듭니다.
            Vector3 rotation = Quaternion.Lerp(transform.rotation, lookRotation, Time.deltaTime * turnSpeed).eulerAngles;
            
            // y축(좌우 고개 돌리기)으로만 회전하게 해서 몬스터가 바닥을 보거나 고개를 들지 않게 고정합니다.
            transform.rotation = Quaternion.Euler(0f, rotation.y, 0f); 
        }

        // ★ [추가된 핵심 코드] 내 위치와 목표 지점 사이의 거리가 0.2f 이하라면 (거의 도착했다면) 다음 목표를 찾습니다!
        if (Vector3.Distance(transform.position, target.position) <= 0.2f)
        {
            GetNextWaypoint();
        }

        enemy.speed = enemy.startSpeed;
    }

    void GetNextWaypoint()
    {
        // 마지막 웨이포인트에 도달했는지 확인
        if (wavePointIndex >= Waypoints.points.Length - 1)
        {
            // 루프 로직: 인덱스를 0으로 초기화하여 처음으로 되돌림
            wavePointIndex = 0;
            target = Waypoints.points[wavePointIndex];
            return;
        }

        wavePointIndex++;
        target = Waypoints.points[wavePointIndex];
    }
}