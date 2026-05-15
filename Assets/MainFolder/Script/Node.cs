using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class Node : MonoBehaviour {

    public Color hoverColor;
    public Vector3 positionOffset;

    [HideInInspector] public GameObject turret;
    [HideInInspector] public TurretBlueprint turretBlueprint;
    [HideInInspector] public int towerTier = 1; 

    private Renderer rend;
    private Color startColor;
    private BuildManager buildManager;
    private GameObject currentMergeEffect;

    void Start ()
    {
        rend = GetComponent<Renderer>();
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

        if (turret != null)
        {
            if (towerTier < 5) 
            {
                List<Node> identicalNodes = buildManager.GetIdenticalNodes(turretBlueprint, towerTier);
                
                if (identicalNodes.Count >= 3)
                {
                    buildManager.ExecuteMerge(this, identicalNodes);
                }
                else
                {
                    Debug.Log("조합 불가: 동일한 등급의 타워가 3개 필요합니다.");
                }
            }
            else
            {
                Debug.Log("이 타워는 이미 최고 등급(5단계)입니다!");
            }
            return;
        }
    }

    public void UpgradeToNextTier()
    {
        Destroy(turret); 
        towerTier++;     

        GameObject _turret = Instantiate(turretBlueprint.prefabs[towerTier - 1], GetBuildPosition(), Quaternion.identity);
        turret = _turret;

        if (buildManager.buildEffect != null)
        {
            GameObject effect = Instantiate(buildManager.buildEffect, GetBuildPosition(), Quaternion.identity);
            Destroy(effect, 5f);
        }
    }

    public void DestroyTurretForMerge()
    {
        Destroy(turret);
        turret = null;
        turretBlueprint = null;
        towerTier = 1;
        SetMergeEffect(false, null); 

        if (buildManager.sellEffect != null)
        {
            GameObject effect = Instantiate(buildManager.sellEffect, GetBuildPosition(), Quaternion.identity);
            Destroy(effect, 5f);
        }
    }

    // 이펙트 생성 함수가 어떤 파티클(effectPrefab)을 틀지 전달받습니다.
    public void SetMergeEffect(bool active, GameObject effectPrefab)
    {
        if (active && currentMergeEffect == null)
        {
            if (effectPrefab != null)
            {
                currentMergeEffect = Instantiate(effectPrefab, GetBuildPosition(), Quaternion.Euler(-90, 0, 0), transform);
            }
        }
        else if (!active && currentMergeEffect != null)
        {
            Destroy(currentMergeEffect);
            currentMergeEffect = null; 
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