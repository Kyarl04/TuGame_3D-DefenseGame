using UnityEngine;
using System.Collections.Generic;

public class BuildManager : MonoBehaviour {

    public static BuildManager instance;

    void Awake ()
    {
        if (instance != null) return;
        instance = this;
    }

    public GameObject buildEffect;
    public GameObject sellEffect;
    
    [Header("Merge Settings")]
    public GameObject mergeReadyEffectPrefab; // 붉게 빛나는 파티클 (Looping 설정 필수)
    public TurretBlueprint[] randomTurrets; // 뽑기 상점에 있는 타워 종류들

    // 랜덤 소환 (Create 버튼과 연결)
    public void BuildRandomTurretOn(Node node)
    {
        if (PlayerStats.Money < 100) // 소환 비용 (필요에 따라 수정)
        {
            Debug.Log("돈이 부족합니다!");
            return;
        }

        PlayerStats.Money -= 100;

        int randomIndex = Random.Range(0, randomTurrets.Length);
        TurretBlueprint blueprint = randomTurrets[randomIndex];

        // 1단계(인덱스 0) 타워 소환 (Z축 0도 회전 적용)
        GameObject turret = Instantiate(blueprint.prefabs[0], node.GetBuildPosition(), Quaternion.identity);
        
        node.turret = turret;
        node.turretBlueprint = blueprint;
        node.towerTier = 1; // 1단계로 세팅

        // 건설 이펙트
        if (buildEffect != null)
        {
            GameObject effect = Instantiate(buildEffect, node.GetBuildPosition(), Quaternion.identity);
            Destroy(effect, 5f);
        }

        // 새 타워가 생겼으니 조합 가능한지 전체 맵 검사
        UpdateMergeEffects(); 
    }

    // 동일한 종류, 동일한 등급의 타워 리스트를 반환
    public List<Node> GetIdenticalNodes(TurretBlueprint blueprint, int tier)
    {
        List<Node> result = new List<Node>();
        Node[] allNodes = FindObjectsOfType<Node>();

        foreach (Node n in allNodes)
        {
            if (n.turret != null && n.turretBlueprint == blueprint && n.towerTier == tier)
            {
                result.Add(n);
            }
        }
        return result;
    }

    // 조합(Merge) 실행 로직
    public void ExecuteMerge(Node targetNode, List<Node> identicalNodes)
    {
        // 1. 클릭한 '살아남을 타워'는 파괴 명단에서 제외
        identicalNodes.Remove(targetNode);

        // 2. 남은 타워들 중 랜덤하게 2개를 골라 제물로 바침(파괴)
        Node sacrifice1 = identicalNodes[Random.Range(0, identicalNodes.Count)];
        identicalNodes.Remove(sacrifice1);
        
        Node sacrifice2 = identicalNodes[Random.Range(0, identicalNodes.Count)];
        identicalNodes.Remove(sacrifice2);

        sacrifice1.DestroyTurretForMerge();
        sacrifice2.DestroyTurretForMerge();

        // 3. 클릭했던 타워를 다음 단계로 진화
        targetNode.UpgradeToNextTier();

        // 4. 합성이 끝났으니 맵 전체의 붉은빛 이펙트 상태 갱신
        UpdateMergeEffects();
    }

    // 3개 이상 모인 타워에만 이펙트를 켜주는 함수
    public void UpdateMergeEffects()
    {
        Node[] allNodes = FindObjectsOfType<Node>();
        
        // 우선 맵에 있는 모든 이펙트를 끕니다. (초기화)
        foreach (Node n in allNodes)
        {
            n.SetMergeEffect(false);
        }

        // 다시 검사하여 3개 이상인 그룹에만 이펙트를 켭니다.
        foreach (Node n in allNodes)
        {
            if (n.turret == null || n.towerTier >= 5) continue; // 최고 레벨이거나 빈칸은 무시

            List<Node> identicals = GetIdenticalNodes(n.turretBlueprint, n.towerTier);
            if (identicals.Count >= 3)
            {
                foreach (Node idNode in identicals)
                {
                    idNode.SetMergeEffect(true);
                }
            }
        }
    }
}