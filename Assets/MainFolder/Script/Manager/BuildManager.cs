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
    
    [Header("Merge Settings (Tier 1~4 Effects)")]
    [Tooltip("1단계~4단계별로 합성이 가능할 때 띄울 파티클 (Size를 4로 하세요)")]
    public GameObject[] mergeReadyEffects = new GameObject[4]; 

    [Header("Merge Settings (Upgrade Effects)")]
    [Tooltip("진화하는 순간 펑! 터질 파티클 (1->2, 2->3, 3->4, 4->5)")]
    public GameObject[] upgradeEffects = new GameObject[4];
    
    [Header("Tower Setting")]
    [Tooltip("사용할 유일한 타워 블루프린트")]
    public TurretBlueprint baseTower; // 종류를 1개로 줄였으므로 배열이 아닌 단일 변수 사용

    [Header("Gacha Probabilities")]
    [Tooltip("1단계~5단계 스폰 확률 (총합 100)")]
    public float[] tierProbabilities = new float[5] { 70f, 20f, 6f, 3f, 1f }; 

    // 랜덤 소환
    public void BuildRandomTurretOn(Node node)
    {
        if (PlayerStats.Money < 100)
        {
            Debug.Log("돈이 부족합니다!");
            return;
        }

        PlayerStats.Money -= 100;

        // 타워 등급(1~5단계) 확률 기반 선택
        int spawnedTier = 1;
        float randomVal = Random.Range(0f, 100f);
        float cumulativeProb = 0f;

        for (int i = 0; i < tierProbabilities.Length; i++)
        {
            cumulativeProb += tierProbabilities[i];
            if (randomVal <= cumulativeProb)
            {
                spawnedTier = i + 1; 
                break;
            }
        }

        // 결정된 등급의 모델 소환 (배열 인덱스는 0부터이므로 spawnedTier - 1)
        GameObject turret = Instantiate(baseTower.prefabs[spawnedTier - 1], node.GetBuildPosition(), Quaternion.identity);
        
        node.turret = turret;
        node.turretBlueprint = baseTower;
        node.towerTier = spawnedTier; 

        if (buildEffect != null)
        {
            GameObject effect = Instantiate(buildEffect, node.GetBuildPosition(), Quaternion.identity);
            Destroy(effect, 5f);
        }
        if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayTowerBuild();
        }
        UpdateMergeEffects(); 
    }

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

    public void ExecuteMerge(Node targetNode, List<Node> identicalNodes)
    {
        identicalNodes.Remove(targetNode);

        Node sacrifice1 = identicalNodes[Random.Range(0, identicalNodes.Count)];
        identicalNodes.Remove(sacrifice1);
        
        Node sacrifice2 = identicalNodes[Random.Range(0, identicalNodes.Count)];
        identicalNodes.Remove(sacrifice2);

        sacrifice1.DestroyTurretForMerge();
        sacrifice2.DestroyTurretForMerge();

        targetNode.UpgradeToNextTier();
        UpdateMergeEffects();

        if (SoundManager.Instance != null)
        {
            SoundManager.Instance.PlayTowerUpgrade();
        }
    }

    public void UpdateMergeEffects()
    {
        Node[] allNodes = FindObjectsOfType<Node>();
        
        // 일단 모든 이펙트를 끔
        foreach (Node n in allNodes)
        {
            n.SetMergeEffect(false, null);
        }

        // 다시 검사
        foreach (Node n in allNodes)
        {
            // 빈칸이거나 5단계(최고레벨)면 무시하고 넘어갑니다!
            if (n.turret == null || n.towerTier >= 5) continue; 

            List<Node> identicals = GetIdenticalNodes(n.turretBlueprint, n.towerTier);
            if (identicals.Count >= 3)
            {
                // 타워 단계에 맞는 이펙트 할당 (1단계는 index 0, 4단계는 index 3)
                GameObject effectToPlay = mergeReadyEffects[n.towerTier - 1]; 
                
                foreach (Node idNode in identicals)
                {
                    idNode.SetMergeEffect(true, effectToPlay);
                }
            }
        }
    }
}