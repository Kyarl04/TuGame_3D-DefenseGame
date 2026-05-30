using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UpgradeManager : MonoBehaviour
{
    public static UpgradeManager instance;

    void Awake()
    {
        if (instance != null) return;
        instance = this;
    }

    // 어떤 업그레이드를 선택했는지 기억하기 위한 열거형(Enum)
    public enum UpgradeType { None, Attack, Speed }
    private UpgradeType currentSelectedUpgrade = UpgradeType.None;

    [Header("Attack Upgrade (공격력)")]
    public int atkLevel = 0;
    public int atkBaseCost = 100;           
    public float atkCostMultiplier = 1.5f;  
    public int bonusDamagePerLevel = 10;    
    public TMP_Text atkLevelText; // 버튼 한켠에 띄울 현재 레벨 텍스트

    [Header("Speed Upgrade (공격 속도)")]
    public int spdLevel = 0;
    public int spdBaseCost = 100;
    public float spdCostMultiplier = 1.5f;
    public float bonusSpeedPerLevel = 0.2f; 
    public TMP_Text spdLevelText;

    [Header("Confirm Panel UI (확인 창)")]
    public GameObject confirmPanel;       // 창 전체 패널
    public TMP_Text confirmLevelText;     // [현재 레벨] -> [다음 레벨]
    public TMP_Text confirmStatText;      // [현재 스탯] -> [다음 스탯]
    public TMP_Text confirmCostText;      // [필요 골드]
    public Button confirmBuyBtn;          // 실제 구매 버튼

    [Header("Ability Unlock (특수 능력)")]
    public GameObject abilityPanel;         
    
    [Space]
    public int skill1Cost = 500;
    public bool isSkill1Unlocked = false;
    public TMP_Text skill1CostText;
    public Button skill1UnlockBtn;
    public GameObject skill1UI;             

    [Space]
    public int skill2Cost = 1000;
    public bool isSkill2Unlocked = false;
    public TMP_Text skill2CostText;
    public Button skill2UnlockBtn;
    public GameObject skill2UI;             

    void Start()
    {
        if (skill1UI != null) skill1UI.SetActive(false);
        if (skill2UI != null) skill2UI.SetActive(false);
        if (confirmPanel != null) confirmPanel.SetActive(false); // 시작 시 확인 창 숨김

        UpdateAllUI();
    }

    // ================= [ 비용 계산 함수 ] =================
    public int GetAtkCost() { return Mathf.RoundToInt(atkBaseCost * Mathf.Pow(atkCostMultiplier, atkLevel)); }
    public int GetSpdCost() { return Mathf.RoundToInt(spdBaseCost * Mathf.Pow(spdCostMultiplier, spdLevel)); }

    // ================= [ 확인 창(Confirm Panel) 열기 함수 ] =================
    
    // 공격력 업그레이드 버튼을 눌렀을 때 호출
    public void OpenAttackConfirm()
    {
        if (confirmPanel != null && confirmPanel.activeSelf && currentSelectedUpgrade == UpgradeType.Attack)
        {
            CloseConfirmPanel();
            return;
        }

        currentSelectedUpgrade = UpgradeType.Attack;
        
        int cost = GetAtkCost();
        int currentBonus = atkLevel * bonusDamagePerLevel;
        int nextBonus = (atkLevel + 1) * bonusDamagePerLevel;

        if (confirmLevelText != null) confirmLevelText.text = "Lv." + atkLevel + " -> " + (atkLevel + 1);
        if (confirmStatText != null) confirmStatText.text = "Damage: +" + currentBonus + " -> +" + nextBonus;
        if (confirmCostText != null) confirmCostText.text = cost + " G";

        if (confirmBuyBtn != null) confirmBuyBtn.interactable = PlayerStats.Money >= cost;
        
        if (confirmPanel != null) confirmPanel.SetActive(true);
    }
    // 공격 속도 업그레이드 버튼을 눌렀을 때 호출
    public void OpenSpeedConfirm()
    {
        if (confirmPanel != null && confirmPanel.activeSelf && currentSelectedUpgrade == UpgradeType.Speed)
        {
            CloseConfirmPanel();
            return;
        }
        
        currentSelectedUpgrade = UpgradeType.Speed;
        
        int cost = GetSpdCost();
        float currentBonus = spdLevel * bonusSpeedPerLevel;
        float nextBonus = (spdLevel + 1) * bonusSpeedPerLevel;

        if (confirmLevelText != null) confirmLevelText.text = "Lv." + spdLevel + " -> " + (spdLevel + 1);
        if (confirmStatText != null) confirmStatText.text = "Speed: +" + currentBonus.ToString("F1") + " -> +" + nextBonus.ToString("F1");
        if (confirmCostText != null) confirmCostText.text = cost + " G";

        if (confirmBuyBtn != null) confirmBuyBtn.interactable = PlayerStats.Money >= cost;

        if (confirmPanel != null) confirmPanel.SetActive(true);
    }

    // ================= [ 실제 구매 처리 함수 ] =================
    
    // 확인 창 안에 있는 '구매' 버튼을 눌렀을 때 호출
    public void ConfirmPurchase()
    {
        if (currentSelectedUpgrade == UpgradeType.Attack)
        {
            int cost = GetAtkCost();
            if (PlayerStats.Money >= cost)
            {
                PlayerStats.Money -= cost;
                atkLevel++;
            }
        }
        else if (currentSelectedUpgrade == UpgradeType.Speed)
        {
            int cost = GetSpdCost();
            if (PlayerStats.Money >= cost)
            {
                PlayerStats.Money -= cost;
                spdLevel++;
                ApplySpeedToAllTurrets();
            }
        }

        UpdateAllUI();
        CloseConfirmPanel();
    }

    public void CloseConfirmPanel()
    {
        currentSelectedUpgrade = UpgradeType.None;
        confirmPanel.SetActive(false);
    }

    // ================= [ 유틸리티 및 어빌리티 함수 ] =================
    private void UpdateAllUI()
    {
        if (atkLevelText != null) atkLevelText.text = atkLevel.ToString();
        if (spdLevelText != null) spdLevelText.text = spdLevel.ToString();  

        if (!isSkill1Unlocked && skill1CostText != null) skill1CostText.text = skill1Cost + "G";
        if (!isSkill2Unlocked && skill2CostText != null) skill2CostText.text = skill2Cost + "G";
    }

    private void ApplySpeedToAllTurrets()
    {
        Turret[] turrets = FindObjectsOfType<Turret>();
        foreach (Turret t in turrets) t.ApplyUpgrades(); 
    }

    public void ToggleAbilityPanel()
    {
        if (abilityPanel != null) abilityPanel.SetActive(!abilityPanel.activeSelf);
    }

    public void UnlockSkill1()
    {
        if (PlayerStats.Money >= skill1Cost && !isSkill1Unlocked)
        {
            PlayerStats.Money -= skill1Cost;
            isSkill1Unlocked = true;
            skill1UnlockBtn.interactable = false; 
            skill1CostText.text = "Unlocked!";
            if (skill1UI != null) skill1UI.SetActive(true); 
        }
    }

    public void UnlockSkill2()
    {
        if (PlayerStats.Money >= skill2Cost && !isSkill2Unlocked)
        {
            PlayerStats.Money -= skill2Cost;
            isSkill2Unlocked = true;
            skill2UnlockBtn.interactable = false;
            skill2CostText.text = "Unlocked!";
            if (skill2UI != null) skill2UI.SetActive(true); 
        }
    }
}