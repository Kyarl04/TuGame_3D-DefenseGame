using UnityEngine;
using System.Collections.Generic;
using UnityEngine.UI;
using TMPro;

public class TowerShuffler : MonoBehaviour
{
    [Header("Shuffle Settings")]
    public int shuffleCost = 100;     // 위치를 섞는 데 필요한 골드
    public GameObject shuffleEffect;  // (선택) 텔레포트/마법진 이펙트

    [Header("UI Elements")]
    public Button shuffleButton;      // 셔플 버튼
    public TMP_Text costText;         // 비용 표시 텍스트

    void Start()
    {
        if (costText != null)
        {
            costText.text = shuffleCost + " G";
        }
    }

    void Update()
    {
        // 1. 돈이 부족하면 버튼을 누를 수 없게 비활성화합니다.
        if (shuffleButton != null)
        {
            shuffleButton.interactable = PlayerStats.Money >= shuffleCost;
        }
    }

    public void ShuffleTowers()
    {
        // 2. 돈이 부족하거나 안전장치
        if (PlayerStats.Money < shuffleCost) return;

        // 3. 맵에 있는 모든 노드(타워 칸)를 찾습니다.
        Node[] allNodes = FindObjectsOfType<Node>();
        List<Node> occupiedNodes = new List<Node>();

        // 타워가 설치된 노드만 걸러냅니다.
        foreach (Node node in allNodes)
        {
            if (node.turret != null)
            {
                occupiedNodes.Add(node);
            }
        }

        // 타워가 2개 미만이면 섞을 의미가 없으므로 종료 (돈도 안 깎임)
        if (occupiedNodes.Count < 2)
        {
            Debug.Log("섞을 타워가 최소 2개 이상 필요합니다!");
            return;
        }

        // 4. 비용 차감
        PlayerStats.Money -= shuffleCost;

        // 5. 타워 정보만 따로 빼서 리스트에 담습니다.
        List<TowerData> tempTowers = new List<TowerData>();
        foreach (Node node in occupiedNodes)
        {
            tempTowers.Add(new TowerData(node.turret, node.turretBlueprint, node.towerTier));
        }

        // 6. 타워 정보를 무작위로 섞습니다. (피셔-예이츠 셔플 알고리즘)
        for (int i = 0; i < tempTowers.Count; i++)
        {
            int randomIndex = Random.Range(i, tempTowers.Count);
            TowerData temp = tempTowers[i];
            tempTowers[i] = tempTowers[randomIndex];
            tempTowers[randomIndex] = temp;
        }

        // 7. 섞인 타워 정보를 다시 노드들에 분배하고 위치를 텔레포트시킵니다.
        for (int i = 0; i < occupiedNodes.Count; i++)
        {
            Node node = occupiedNodes[i];
            TowerData data = tempTowers[i];

            // 노드의 데이터 덮어씌우기
            node.turret = data.turret;
            node.turretBlueprint = data.blueprint;
            node.towerTier = data.tier;

            // 실제 게임 오브젝트 위치 이동
            node.turret.transform.position = node.GetBuildPosition();

            // (선택) 이동한 자리에 이펙트 펑!
            if (shuffleEffect != null)
            {
                GameObject effect = Instantiate(shuffleEffect, node.GetBuildPosition(), Quaternion.identity);
                Destroy(effect, 2f);
            }
        }
    }

    // 타워의 핵심 정보(합성에 필요한 데이터들)를 묶어둘 임시 구조체
    private struct TowerData
    {
        public GameObject turret;
        public TurretBlueprint blueprint;
        public int tier;

        public TowerData(GameObject turret, TurretBlueprint blueprint, int tier)
        {
            this.turret = turret;
            this.blueprint = blueprint;
            this.tier = tier;
        }
    }
}