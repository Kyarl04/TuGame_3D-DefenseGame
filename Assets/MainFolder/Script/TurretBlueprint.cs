using UnityEngine;

[System.Serializable]
public class TurretBlueprint {

    // 1단계부터 5단계까지의 터렛 모델을 넣을 배열 (에디터에서 Size를 5로 설정하세요)
    public GameObject[] prefabs = new GameObject[5]; 
    public int cost; // 1단계 소환 비용/기본 가치

    // 타워를 판매하는 기능이 필요할 경우를 대비한 함수
    public int GetSellAmount(int tier)
    {
        return (cost / 2) * tier; 
    }
}