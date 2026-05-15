using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class SkillManager : MonoBehaviour {

    [Header("Targeting System")]
    public LayerMask groundMask; // 마우스가 닿을 바닥 레이어
    public GameObject indicatorPrefab; // 마우스를 따라다닐 타격 범위 표시 UI(원형)
    private GameObject activeIndicator;
    private int currentTargetingSkill = 0; // 0: 없음, 1: 1번 스킬, 2: 2번 스킬

    [Header("Skill 1 : Hellfire")]
    public Button skill1Button;
    public Image skill1CooldownImage;
    public float skill1Cooldown = 15f;
    public int skill1Damage = 500;
    public float skill1Radius = 5f; // 1번 스킬 타격 범위 반경
    public GameObject skill1EffectPrefab;
    private bool isSkill1Ready = true;

    [Header("Skill 2 : Blizzard")]
    public Button skill2Button;
    public Image skill2CooldownImage;
    public float skill2Cooldown = 20f;
    public int skill2Damage = 300;
    public float skill2Radius = 8f; // 2번 스킬 타격 범위 반경
    public GameObject skill2EffectPrefab;
    private bool isSkill2Ready = true;

    void Update()
    {
        // 1. 키보드 입력으로 타겟팅 모드 진입
        if (Input.GetKeyDown(KeyCode.Alpha1) && isSkill1Ready)
        {
            EnterTargetingMode(1);
        }
        else if (Input.GetKeyDown(KeyCode.Alpha2) && isSkill2Ready)
        {
            EnterTargetingMode(2);
        }

        // 2. 타겟팅 모드 중일 때 마우스 조작 처리
        if (currentTargetingSkill != 0)
        {
            HandleTargeting();
        }
    }

    void EnterTargetingMode(int skillIndex)
    {
        currentTargetingSkill = skillIndex;

        // 기존 인디케이터가 있다면 삭제
        if (activeIndicator != null) Destroy(activeIndicator);

        // 새로운 인디케이터 생성
        activeIndicator = Instantiate(indicatorPrefab);

        // 스킬에 따라 인디케이터 크기 조절 (반경의 2배가 지름)
        float radius = (skillIndex == 1) ? skill1Radius : skill2Radius;
        activeIndicator.transform.localScale = new Vector3(radius * 2, 0.1f, radius * 2);
    }

    void HandleTargeting()
    {
        // 카메라에서 마우스 위치로 레이저를 쏴서 바닥(Ground)을 찾음
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundMask))
        {
            // 인디케이터를 마우스가 가리키는 바닥 위치로 이동
            activeIndicator.transform.position = hit.point;

            // 좌클릭: 스킬 발동
            if (Input.GetMouseButtonDown(0))
            {
                ExecuteSkill(hit.point);
            }
        }

        // 우클릭: 타겟팅 취소
        if (Input.GetMouseButtonDown(1))
        {
            CancelTargeting();
        }
    }

    void ExecuteSkill(Vector3 targetPosition)
    {
        float radius = (currentTargetingSkill == 1) ? skill1Radius : skill2Radius;
        int damage = (currentTargetingSkill == 1) ? skill1Damage : skill2Damage;
        GameObject effectPrefab = (currentTargetingSkill == 1) ? skill1EffectPrefab : skill2EffectPrefab;

        // 1. 범위 내의 모든 적 찾기 (OverlapSphere 사용)
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

        // 2. 파티클 이펙트 생성
        if (effectPrefab != null)
        {
            GameObject effect = Instantiate(effectPrefab, targetPosition, Quaternion.identity);
            Destroy(effect, 3f);
        }

        // 3. 쿨타임 시작 및 모드 초기화
        if (currentTargetingSkill == 1)
            StartCoroutine(CooldownRoutine(1, skill1Cooldown, skill1Button, skill1CooldownImage));
        else if (currentTargetingSkill == 2)
            StartCoroutine(CooldownRoutine(2, skill2Cooldown, skill2Button, skill2CooldownImage));

        CancelTargeting();
    }

    void CancelTargeting()
    {
        currentTargetingSkill = 0;
        if (activeIndicator != null)
        {
            Destroy(activeIndicator);
        }
    }

    IEnumerator CooldownRoutine(int skillIndex, float cooldown, Button btn, Image cooldownImg)
    {
        // 쿨타임 시작 세팅
        if (skillIndex == 1) isSkill1Ready = false;
        else isSkill2Ready = false;
        
        btn.interactable = false;
        cooldownImg.fillAmount = 1f;

        // 시간 감소 연출
        float timer = cooldown;
        while (timer > 0)
        {
            timer -= Time.deltaTime;
            cooldownImg.fillAmount = timer / cooldown;
            yield return null;
        }

        // 쿨타임 종료 세팅
        if (skillIndex == 1) isSkill1Ready = true;
        else isSkill2Ready = true;

        btn.interactable = true;
        cooldownImg.fillAmount = 0f;
    }

    // UI 버튼을 마우스로 클릭했을 때도 타겟팅 모드에 진입하도록 연결할 함수
    public void OnSkill1ButtonClicked()
    {
        if (isSkill1Ready && currentTargetingSkill == 0) EnterTargetingMode(1);
    }

    public void OnSkill2ButtonClicked()
    {
        if (isSkill2Ready && currentTargetingSkill == 0) EnterTargetingMode(2);
    }
}