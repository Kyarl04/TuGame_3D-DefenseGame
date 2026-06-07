using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.UI;

public class VolumeController : MonoBehaviour
{
    [Header("Settings")]
    public AudioMixer audioMixer;
    public string volumeParameter = "MasterVolume"; // 아까 믹서에서 지어준 이름

    [Header("UI")]
    public Slider volumeSlider;

    void Start()
    {
        // 1. 기기에 저장된 볼륨 값 불러오기 (저장된 게 없으면 기본값 1(100%))
        float savedVolume = PlayerPrefs.GetFloat(volumeParameter, 1f);
        
        if (volumeSlider != null)
        {
            volumeSlider.value = savedVolume;
            // 2. 슬라이더를 움직일 때마다 SetVolume 함수가 자동으로 실행되도록 연결
            volumeSlider.onValueChanged.AddListener(SetVolume);
        }

        // 3. 시작할 때 저장된 볼륨을 바로 오디오 믹서에 적용
        SetVolume(savedVolume);
    }

    public void SetVolume(float sliderValue)
    {
        // 4. 슬라이더 값(0.0001 ~ 1)을 데시벨(dB)로 변환 (-80dB ~ 0dB)
        float dbVolume = Mathf.Log10(sliderValue) * 20f;
        
        // 슬라이더가 0으로 내려가면 완벽한 음소거(-80dB) 처리
        if (sliderValue == 0) 
        {
            dbVolume = -80f;
        }

        audioMixer.SetFloat(volumeParameter, dbVolume);

        // 5. 설정한 볼륨을 기기에 저장 (다음에 게임을 켜도 유지됨)
        PlayerPrefs.SetFloat(volumeParameter, sliderValue);
    }
}