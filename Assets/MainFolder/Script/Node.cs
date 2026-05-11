using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class Node : MonoBehaviour {

    public Color hoverColor;
    public Vector3 positionOffset;

    [HideInInspector]
    public GameObject turret;
    [HideInInspector]
    public TurretBlueprint turretBlueprint;
    [HideInInspector]
    public int towerTier = 1; // 현재 타워의 등급 (1~5)

    private Renderer rend;
    private Color startColor;
    private BuildManager buildManager;
    private GameObject currentMergeEffect;

    void Start ()
    {
        rend = GetComponent<Renderer>();
        // URP 및 빌트인 쉐이더 호환
        if (rend.material.HasProperty("_BaseColor"))
            startColor = rend.material.GetColor("_BaseColor");
        else
            startColor = rend.material.color;

        buildManager = BuildManager.instance;
    }

    public Vector3 GetBuildPosition ()
    {
        return transform.position + positionOffset;
    }

    void OnMouseDown ()
    {
        if (EventSystem.current.IsPointerOverGameObject()) return;

        // 타워가 지어진 칸을 클릭했을 때
        if (turret != null)
        {
            if (towerTier < 5) // 최고 등급이 아닐 때만 조합 시도
            {
                List<Node> identicalNodes = buildManager.GetIdenticalNodes(turretBlueprint, towerTier);
                
                if (identicalNodes.Count >= 3)
                {
                    buildManager.ExecuteMerge(this, identicalNodes);
                }
                else
                {
                    Debug.Log("조합 불가: 동일한 종류/등급의 타워가 3개 필요합니다.");
                }
            }
            else
            {
                Debug.Log("이 타워는 이미 최고 등급(5단계)입니다!");
            }
            return;
        }
    }

    // 진화 (살아남는 타워)
    public void UpgradeToNextTier()
    {
        Destroy(turret); // 이전 단계 모델 삭제
        towerTier++;     // 등급 +1

        // 다음 등급 모델 생성 (배열 인덱스는 0부터 시작하므로 towerTier - 1)
        GameObject _turret = Instantiate(turretBlueprint.prefabs[towerTier - 1], GetBuildPosition(), Quaternion.identity);
        turret = _turret;

        if (buildManager.buildEffect != null)
        {
            GameObject effect = Instantiate(buildManager.buildEffect, GetBuildPosition(), Quaternion.identity);
            Destroy(effect, 5f);
        }
    }

    // 제물 파괴 (사라지는 타워)
    public void DestroyTurretForMerge()
    {
        Destroy(turret);
        turret = null;
        turretBlueprint = null;
        towerTier = 1;
        SetMergeEffect(false); // 사라지면서 붉은빛 이펙트도 완전히 제거

        if (buildManager.sellEffect != null)
        {
            // 조합 시 파괴되는 느낌을 위해 sellEffect(파편 등) 활용
            GameObject effect = Instantiate(buildManager.sellEffect, GetBuildPosition(), Quaternion.identity);
            Destroy(effect, 5f);
        }
    }

    // 붉은빛 파티클 제어 (버그 방지 구조 적용)
    public void SetMergeEffect(bool active)
    {
        if (active && currentMergeEffect == null)
        {
            if (buildManager.mergeReadyEffectPrefab != null)
            {
                currentMergeEffect = Instantiate(buildManager.mergeReadyEffectPrefab, GetBuildPosition(), Quaternion.Euler(-90, 0, 0), transform);
            }
        }
        else if (!active && currentMergeEffect != null)
        {
            Destroy(currentMergeEffect);
            currentMergeEffect = null; // 반드시 null로 만들어 중복 오류 방지
        }
    }

    void OnMouseEnter ()
    {
        if (EventSystem.current.IsPointerOverGameObject()) return;

        if (rend.material.HasProperty("_BaseColor"))
            rend.material.SetColor("_BaseColor", hoverColor);
        else
            rend.material.color = hoverColor;
    }

    void OnMouseExit ()
    {
        if (rend.material.HasProperty("_BaseColor"))
            rend.material.SetColor("_BaseColor", startColor);
        else
            rend.material.color = startColor;
    }
}