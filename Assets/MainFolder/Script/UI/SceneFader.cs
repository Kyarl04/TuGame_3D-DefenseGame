using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SceneFader : MonoBehaviour {

    [Header("UI Reference")]
    public Image fadeImage;

    [Header("Dissolve Settings")]
    public string dissolveParameter = "_DissolveFloat";
    public float fadeTime = 1.5f;
    public float blackValue = 0f; 
    public float transparentValue = 1f;

    [Header("Behavior")]
    public bool fadeInOnStart = true; // ★ [추가] 시작할 때 페이드인 연출을 할지 결정하는 스위치

    void Start ()
    {
        if (fadeInOnStart)
        {
            // 스위치가 켜져 있으면 기존처럼 씬 시작 시 등장 연출을 재생합니다.
            StartCoroutine(FadeIn());
        }
        else
        {
            // 스위치가 꺼져 있다면, 연출 없이 화면을 즉시 투명하게 치워버립니다.
            if (fadeImage != null && fadeImage.material != null)
            {
                fadeImage.material.SetFloat(dissolveParameter, transparentValue);
                fadeImage.raycastTarget = false; // 마우스 클릭 방지막 해제
            }
        }
    }

    public void FadeTo (string sceneName)
    {
        StartCoroutine(FadeOut(sceneName));
    }

    IEnumerator FadeIn ()
    {
        float timer = 0f;
        if (fadeImage != null) fadeImage.raycastTarget = false;

        while (timer < fadeTime)
        {
            timer += Time.deltaTime;
            float currentValue = Mathf.Lerp(blackValue, transparentValue, timer / fadeTime);
            
            if (fadeImage != null && fadeImage.material != null)
            {
                fadeImage.material.SetFloat(dissolveParameter, currentValue);
            }
            yield return null;
        }
    }

    IEnumerator FadeOut (string sceneName)
    {
        float timer = 0f;
        if (fadeImage != null) fadeImage.raycastTarget = true;

        while (timer < fadeTime)
        {
            timer += Time.deltaTime;
            float currentValue = Mathf.Lerp(transparentValue, blackValue, timer / fadeTime);
            
            if (fadeImage != null && fadeImage.material != null)
            {
                fadeImage.material.SetFloat(dissolveParameter, currentValue);
            }
            yield return null;
        }

        SceneManager.LoadScene(sceneName);
    }
}