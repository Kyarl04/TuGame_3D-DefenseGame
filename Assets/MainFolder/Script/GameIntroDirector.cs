using UnityEngine;
using Cinemachine;
using System.Collections;

public class GameIntroDirector : MonoBehaviour
{
    [Header("Cameras & Control")]
    public CinemachineVirtualCamera introCamera; 
    public CinemachineVirtualCamera gameplayCamera; 
    
    [Tooltip("GameplayCam에 붙어있는 CameraController 스크립트")]
    public CameraController gameplayCameraController; 

    [Header("Intro Settings")]
    public float introDuration = 4f;   
    public float rotationSpeed = 45f;  

    private CinemachineOrbitalTransposer orbitalTransposer;

    void Start()
    {
        // 1. 인트로 중에는 조작(WASD)을 막아둡니다.
        if (gameplayCameraController != null)
        {
            gameplayCameraController.enabled = false;
        }

        if (introCamera != null) introCamera.Priority = 20;
        if (gameplayCamera != null) gameplayCamera.Priority = 10;

        if (introCamera != null)
        {
            orbitalTransposer = introCamera.GetCinemachineComponent<CinemachineOrbitalTransposer>();
        }

        StartCoroutine(IntroSequence());
    }

    IEnumerator IntroSequence()
    {
        yield return new WaitForSeconds(1f);

        float timer = 0f;
        while (timer < introDuration)
        {
            timer += Time.deltaTime;
            if (orbitalTransposer != null)
            {
                orbitalTransposer.m_XAxis.Value += rotationSpeed * Time.deltaTime;
            }
            yield return null;
        }

        // 2. 인트로 끝! GameplayCam으로 스르륵 복귀합니다.
        if (introCamera != null)
        {
            introCamera.Priority = 0; 
        }

        CinemachineBrain cinemachineBrain = Camera.main.GetComponent<CinemachineBrain>();
        float blendTime = cinemachineBrain != null ? cinemachineBrain.m_DefaultBlend.m_Time : 2f;
        
        yield return new WaitForSeconds(blendTime);

        // 3. 전환이 끝나면 GameplayCam에 붙은 조작 컨트롤러를 다시 켭니다!
        // (이제 시네머신 Brain을 끄지 않아도 가상 카메라를 직접 움직이므로 정상 작동합니다.)
        if (gameplayCameraController != null) 
        {
            gameplayCameraController.enabled = true;
        }
    }
}