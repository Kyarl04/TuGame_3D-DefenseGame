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

    public enum UpgradeType { None, Attack, Speed }
    private UpgradeType currentSelectedUpgrade = UpgradeType.None;

    [Header("Attack Upgrade (공격력)")]
    public int atkLevel = 0;
    public int atkBaseCost = 100;           
    public float atkCostMultiplier = 1.5f;  
    public int bonusDamagePerLevel = 10;    
    public TMP_Text atkLevelText; 
    public Button atkUpgradeBtn; // ★ 복구된 변수

    [Header("Speed Upgrade (공격 속도)")]
    public int spdLevel = 0;
    public int spdBaseCost = 100;
    public float spdCostMultiplier = 1.5f;
    public float bonusSpeedPerLevel = 0.2f; 
    public TMP_Text spdLevelText;
    public Button spdUpgradeBtn; // ★ 복구된 변수

    [Header("Confirm Panel UI (확인 창)")]
    public GameObject confirmPanel;       
    public TMP_Text confirmLevelText;     
    public TMP_Text confirmStatText;      
    public TMP_Text confirmCostText;      
    public Button confirmBuyBtn;          

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
        if (confirmPanel != null) confirmPanel.SetActive(false); 

        UpdateAllUI();
    }

    void Update()
    {
        // 1. 우클릭으로 닫기
        if (Input.GetMouseButtonDown(1))
        {
            if (confirmPanel != null && confirmPanel.activeSelf)
            {
                CloseConfirmPanel();
            }
        }

        // 2. 메인 화면 버튼 활성화 체크
        if (atkUpgradeBtn != null) atkUpgradeBtn.interactable = PlayerStats.Money >= GetAtkCost();
        if (spdUpgradeBtn != null) spdUpgradeBtn.interactable = PlayerStats.Money >= GetSpdCost();
        
        if (!isSkill1Unlocked && skill1UnlockBtn != null) skill1UnlockBtn.interactable = PlayerStats.Money >= skill1Cost;
        if (!isSkill2Unlocked && skill2UnlockBtn != null) skill2UnlockBtn.interactable = PlayerStats.Money >= skill2Cost;

        // 3. 확인 창 안의 구매 버튼 활성화 체크
        if (confirmPanel != null && confirmPanel.activeSelf && confirmBuyBtn != null)
        {
            if (currentSelectedUpgrade == UpgradeType.Attack)
                confirmBuyBtn.interactable = PlayerStats.Money >= GetAtkCost();
            else if (currentSelectedUpgrade == UpgradeType.Speed)
                confirmBuyBtn.interactable = PlayerStats.Money >= GetSpdCost();
        }
    }

    public int GetAtkCost() { return Mathf.RoundToInt(atkBaseCost * Mathf.Pow(atkCostMultiplier, atkLevel)); }
    public int GetSpdCost() { return Mathf.RoundToInt(spdBaseCost * Mathf.Pow(spdCostMultiplier, spdLevel)); }

    // ================= [ 확인 창(Confirm Panel) 열기 함수 ] =================
    
    public void OpenAttackConfirm()
    {
        if (confirmPanel != null && confirmPanel.activeSelf && currentSelectedUpgrade == UpgradeType.Attack)
        {
            CloseConfirmPanel();
            return;
        }

        currentSelectedUpgrade = UpgradeType.Attack;
        UpdateAttackConfirmUI(); // ★ 함수로 분리된 로직 호출
        if (confirmPanel != null) confirmPanel.SetActive(true);
    }

    public void OpenSpeedConfirm()
    {
        if (confirmPanel != null && confirmPanel.activeSelf && currentSelectedUpgrade == UpgradeType.Speed)
        {
            CloseConfirmPanel();
            return;
        }
        
        currentSelectedUpgrade = UpgradeType.Speed;
        UpdateSpeedConfirmUI(); // ★ 함수로 분리된 로직 호출
        if (confirmPanel != null) confirmPanel.SetActive(true);
    }

    // ★ [추가됨] 토글 없이 순수하게 창 내부 글씨만 바꿔주는 함수들
    private void UpdateAttackConfirmUI()
    {
        int cost = GetAtkCost();
        int currentBonus = atkLevel * bonusDamagePerLevel;
        int nextBonus = (atkLevel + 1) * bonusDamagePerLevel;

        if (confirmLevelText != null) confirmLevelText.text = "Lv." + atkLevel + " -> Lv." + (atkLevel + 1);
        if (confirmStatText != null) confirmStatText.text = "Damage: +" + currentBonus + " -> +" + nextBonus;
        if (confirmCostText != null) confirmCostText.text = cost + " G";
    }

    private void UpdateSpeedConfirmUI()
    {
        int cost = GetSpdCost();
        float currentBonus = spdLevel * bonusSpeedPerLevel;
        float nextBonus = (spdLevel + 1) * bonusSpeedPerLevel;

        if (confirmLevelText != null) confirmLevelText.text = "Lv." + spdLevel + " -> Lv." + (spdLevel + 1);
        if (confirmStatText != null) confirmStatText.text = "Speed: +" + currentBonus.ToString("F1") + " -> +" + nextBonus.ToString("F1");
        if (confirmCostText != null) confirmCostText.text = cost + " G";
    }

    // ================= [ 실제 구매 처리 함수 ] =================
    
    public void ConfirmPurchase()
    {
        if (currentSelectedUpgrade == UpgradeType.Attack)
        {
            int cost = GetAtkCost();
            if (PlayerStats.Money >= cost)
            {
                PlayerStats.Money -= cost;
                atkLevel++;
                ApplyUpgradesToAllTurrets(); 
                
                UpdateAttackConfirmUI(); // 창을 닫지 않고 글자만 새로고침!
            }
        }
        else if (currentSelectedUpgrade == UpgradeType.Speed)
        {
            int cost = GetSpdCost();
            if (PlayerStats.Money >= cost)
            {
                PlayerStats.Money -= cost;
                spdLevel++;
                ApplyUpgradesToAllTurrets(); 
                
                UpdateSpeedConfirmUI(); // 창을 닫지 않고 글자만 새로고침!
            }
        }

        UpdateAllUI();
    }

    public void CloseConfirmPanel()
    {
        currentSelectedUpgrade = UpgradeType.None;
        if (confirmPanel != null) confirmPanel.SetActive(false);
    }

    // ================= [ 유틸리티 및 어빌리티 함수 ] =================
    
    private void UpdateAllUI()
    {
        if (atkLevelText != null) atkLevelText.text = atkLevel.ToString();
        if (spdLevelText != null) spdLevelText.text = spdLevel.ToString();  

        if (!isSkill1Unlocked && skill1CostText != null) skill1CostText.text = skill1Cost + "G";
        if (!isSkill2Unlocked && skill2CostText != null) skill2CostText.text = skill2Cost + "G";
    }

    private void ApplyUpgradesToAllTurrets()
    {
        Turret[] turrets = FindObjectsOfType<Turret>();
        foreach (Turret t in turrets) 
        {
            t.ApplyUpgrades(); 
        }
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
            if (skill1UnlockBtn != null) skill1UnlockBtn.interactable = false; 
            if (skill1CostText != null) skill1CostText.text = "Unlocked!";
            if (skill1UI != null) skill1UI.SetActive(true); 
        }
    }

    public void UnlockSkill2()
    {
        if (PlayerStats.Money >= skill2Cost && !isSkill2Unlocked)
        {
            PlayerStats.Money -= skill2Cost;
            isSkill2Unlocked = true;
            if (skill2UnlockBtn != null) skill2UnlockBtn.interactable = false;
            if (skill2CostText != null) skill2CostText.text = "Unlocked!";
            if (skill2UI != null) skill2UI.SetActive(true); 
        }
    }
}