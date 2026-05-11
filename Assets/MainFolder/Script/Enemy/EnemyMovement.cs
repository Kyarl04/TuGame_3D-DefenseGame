using UnityEngine;

[RequireComponent(typeof(Enemy))]
public class EnemyMovement : MonoBehaviour
{
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

        if (Vector3.Distance(transform.position, target.position) <= 0.4f)
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