using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class SkillManager : MonoBehaviour {

    public static SkillManager instance;
    public bool IsTargeting
    {
        get { return currentTargetingSkill != 0; }
    }
    void Awake()
    {
        if (instance != null) return;
        instance = this;
    }
    
    [Header("Targeting System")]
    public LayerMask groundMask; 
    private GameObject activeIndicator; // 현재 화면에 떠 있는 조준선
    private int currentTargetingSkill = 0; 

    [Header("Skill 1 : Hellfire")]
    public Button skill1Button;
    public Image skill1CooldownImage;
    public float skill1Cooldown = 15f;
    public int skill1Damage = 500;
    public float skill1Radius = 5f; 
    
    // [수정됨] 1번 스킬 전용 이펙트 분리
    [Tooltip("1번 스킬 조준 시 마우스를 따라다닐 Ray/Decal 파티클")]
    public GameObject skill1IndicatorPrefab; 
    [Tooltip("1번 스킬 발동 시 쾅! 터질 타격 파티클")]
    public GameObject skill1ImpactPrefab; 
    private bool isSkill1Ready = true;

    [Header("Skill 2 : Blizzard")]
    public Button skill2Button;
    public Image skill2CooldownImage;
    public float skill2Cooldown = 20f;
    public int skill2Damage = 300;
    public float skill2Radius = 8f; 
    
    // [수정됨] 2번 스킬 전용 이펙트 분리
    [Tooltip("2번 스킬 조준 시 마우스를 따라다닐 Ray/Decal 파티클")]
    public GameObject skill2IndicatorPrefab; 
    [Tooltip("2번 스킬 발동 시 쾅! 터질 타격 파티클")]
    public GameObject skill2ImpactPrefab; 
    private bool isSkill2Ready = true;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1) && isSkill1Ready)
        {
            EnterTargetingMode(1);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2) && isSkill2Ready)
        {
            EnterTargetingMode(2);
        }

        if (currentTargetingSkill != 0)
        {
            HandleTargeting();
        }
    }

    void EnterTargetingMode(int skillIndex)
    {
        currentTargetingSkill = skillIndex;

        if (activeIndicator != null) Destroy(activeIndicator);

        // 스킬 번호에 맞는 전용 조준선(Indicator) 생성
        GameObject indicatorToSpawn = (skillIndex == 1) ? skill1IndicatorPrefab : skill2IndicatorPrefab;
        
        if (indicatorToSpawn != null)
        {
            activeIndicator = Instantiate(indicatorToSpawn);
            
            // 주의: 커스텀 파티클의 크기가 왜곡되지 않도록 코드에서 강제로 크기를 늘리지 않습니다.
            // 인디케이터 프리팹 자체의 크기를 Radius에 맞게 유니티 에디터에서 조절해 주세요!
        }
    }

    void HandleTargeting()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundMask))
        {
            if (activeIndicator != null)
            {
                // 인디케이터가 지형에 파묻히지 않게 살짝(0.1f) 위로 띄워줍니다.
                activeIndicator.transform.position = hit.point + new Vector3(0, 0.1f, 0);
            }

            if (Input.GetMouseButtonDown(0))
            {
                ExecuteSkill(hit.point);
            }
        }

        if (Input.GetMouseButtonDown(1))
        {
            CancelTargeting();
        }
    }

    void ExecuteSkill(Vector3 targetPosition)
    {
        float radius = (currentTargetingSkill == 1) ? skill1Radius : skill2Radius;
        int damage = (currentTargetingSkill == 1) ? skill1Damage : skill2Damage;
        GameObject impactPrefab = (currentTargetingSkill == 1) ? skill1ImpactPrefab : skill2ImpactPrefab;

        Collider[] colliders = Physics.OverlapSphere(targetPosition, radius);
        foreach (Collider collider in colliders)
        {
            if (collider.CompareTag("Enemy"))
            {
                Enemy enemy = collider.GetComponent<Enemy>();
                if (enemy != null)
                {
                    enemy.TakeDamage(damage);
                }
            }
        }

        // 실제 타격(Impact) 이펙트 생성
        if (impactPrefab != null)
        {
            GameObject effect = Instantiate(impactPrefab, targetPosition, Quaternion.identity);
            Destroy(effect, 3f);
            SoundManager.Instance.PlaySkillImpact();
        }

        if (currentTargetingSkill == 1)
            StartCoroutine(CooldownRoutine(1, skill1Cooldown, skill1Button, skill1CooldownImage));
        else if (currentTargetingSkill == 2)
            StartCoroutine(CooldownRoutine(2, skill2Cooldown, skill2Button, skill2CooldownImage));

        CancelTargeting();
    }

    void CancelTargeting()
    {
        currentTargetingSkill = 0;
        
        // 조준이 끝나거나 취소되면 인디케이터 삭제
        if (activeIndicator != null)
        {
            Destroy(activeIndicator);
        }
    }

    IEnumerator CooldownRoutine(int skillIndex, float cooldown, Button btn, Image cooldownImg)
    {
        if (skillIndex == 1) isSkill1Ready = false;
        else isSkill2Ready = false;
        
        // [추가된 안전장치] 버튼과 이미지가 연결되어 있을 때만 접근합니다!
        if (btn != null) btn.interactable = false;
        if (cooldownImg != null) cooldownImg.fillAmount = 1f;

        float timer = cooldown;
        while (timer > 0)
        {
            timer -= Time.deltaTime;
            if (cooldownImg != null) cooldownImg.fillAmount = timer / cooldown;
            yield return null;
        }

        if (skillIndex == 1) isSkill1Ready = true;
        else isSkill2Ready = true;

        if (btn != null) btn.interactable = true;
        if (cooldownImg != null) cooldownImg.fillAmount = 0f;
    }

    public void OnSkill1ButtonClicked()
    {
        if (isSkill1Ready && currentTargetingSkill == 0) EnterTargetingMode(1);
    }

    public void OnSkill2ButtonClicked()
    {
        if (isSkill2Ready && currentTargetingSkill == 0) EnterTargetingMode(2);
    }
}