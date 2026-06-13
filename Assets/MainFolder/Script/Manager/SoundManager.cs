using UnityEngine;
using System.Collections; 

public class SoundManager : MonoBehaviour
{
    public static SoundManager Instance;

    [Header("오디오 소스 (Audio Sources)")]
    public AudioSource bgmSource;         
    public AudioSource sfxSource;         
    public AudioSource loopingSfxSource;  

    [Header("배경음악 (BGM)")]
    public AudioClip menuBGM;
    public AudioClip gameBGM;
    
    [Header("BGM Fade Settings")]
    public float fadeDuration = 1.5f;     
    public float maxBgmVolume = 1.0f;     
    
    private Coroutine currentFadeRoutine; 

    [Header("효과음 (SFX)")]
    public AudioClip buttonClickSFX;      
    public AudioClip towerShootSFX;      // 타워 발사음
    public AudioClip bulletHitSFX;       // 총알 적중/폭발음
    public AudioClip towerBuildSFX;      // 타워 건설/스폰음
    public AudioClip towerUpgradeSFX;    // 타워 레벨업/합성음
    public AudioClip enemyDeathSFX;      // 적 사망음 (Boom!)
    public AudioClip waveStartSFX;       // 웨이브 시작음
    public AudioClip waveSkipSFX;        // 웨이브 스킵음
    public AudioClip skillImpactSFX;     // 스킬 타격음
    
    [Header("지속 효과음 (Looping SFX)")]
    public AudioClip laserLoopSFX;       // 레이저 지속음

    // 피격음 중복 재생 폭발 방지용 (총알이 여러개 동시에 맞을 때)
    private float bulletHitCooldown = 0.05f; 
    private float lastBulletHitTime = -999f;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); 
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        PlayBGM(menuBGM);
    }

    // ==========================================
    // [BGM 제어]
    // ==========================================
    public void PlayBGM(AudioClip newClip)
    {
        if (newClip == null || bgmSource.clip == newClip) return; 

        if (currentFadeRoutine != null)
            StopCoroutine(currentFadeRoutine);

        currentFadeRoutine = StartCoroutine(FadeRoutine(newClip));
    }

    private IEnumerator FadeRoutine(AudioClip newClip)
    {
        if (bgmSource.isPlaying)
        {
            float startVolume = bgmSource.volume;
            while (bgmSource.volume > 0f)
            {
                bgmSource.volume -= startVolume * (Time.deltaTime / fadeDuration);
                yield return null; 
            }
            bgmSource.Stop();
        }

        bgmSource.clip = newClip;
        bgmSource.loop = true;
        bgmSource.Play();

        bgmSource.volume = 0f;
        while (bgmSource.volume < maxBgmVolume)
        {
            bgmSource.volume += maxBgmVolume * (Time.deltaTime / fadeDuration);
            yield return null; 
        }
        bgmSource.volume = maxBgmVolume; 
    }
    
    public void PlayGameBGM() => PlayBGM(gameBGM);
    public void PlayMenuBGM() => PlayBGM(menuBGM);

    // ==========================================
    // [단발성 SFX 제어]
    // ==========================================
    public void PlaySFX(AudioClip clip)
    {
        if (clip == null) return;
        sfxSource.PlayOneShot(clip); 
    }

    public void PlayButtonClick() => PlaySFX(buttonClickSFX);
    public void PlayTowerShoot() => PlaySFX(towerShootSFX);
    public void PlayTowerBuild() => PlaySFX(towerBuildSFX);
    public void PlayTowerUpgrade() => PlaySFX(towerUpgradeSFX);
    public void PlayEnemyDeath() => PlaySFX(enemyDeathSFX);
    public void PlayWaveStart() => PlaySFX(waveStartSFX);
    public void PlayWaveSkip() => PlaySFX(waveSkipSFX);
    public void PlaySkillImpact() => PlaySFX(skillImpactSFX);

    // 총알 적중음 중복 방지 (귀 보호)
    public void PlayBulletHit() 
    {
        if (Time.time >= lastBulletHitTime + bulletHitCooldown)
        {
            PlaySFX(bulletHitSFX);
            lastBulletHitTime = Time.time; 
        }
    }

    // ==========================================
    // [지속성 SFX 제어 (레이저 등)]
    // ==========================================
    public void StartLaserSFX()
    {
        if (laserLoopSFX == null || loopingSfxSource == null) return; 
        
        if (!loopingSfxSource.isPlaying)
        {
            loopingSfxSource.clip = laserLoopSFX;
            loopingSfxSource.loop = true;
            loopingSfxSource.Play();
        }
    }

    public void StopLaserSFX()
    {
        if (loopingSfxSource != null) 
        {
            loopingSfxSource.Stop();
        }
    }
}