// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_DefaultShader_V.1.4"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(Main Texture)]_MainTex("MainTex", 2D) = "white" {}
		[KeywordEnum(Custom1_Off,Custom1_On_XY)] _MUV_Scroll_Custom1_XY("M.UV_Scroll_Custom1_XY", Float) = 0
		_MUV_Scroll("M.UV_Scroll", Vector) = (0,0,0,0)
		[Toggle]_MTex_ImageClampU("M.Tex_ImageClampU", Float) = 0
		[Toggle]_MTex_ImageClampV("M.Tex_ImageClampV", Float) = 0
		_MRefine("M.Refine", Vector) = (1,1,1,0)
		_MColor("M.Color", Color) = (1,1,1,1)
		_MColor_Intensity("M.Color_Intensity", Float) = 1
		[Toggle]_MainTex_RGB("MainTex_RGB", Float) = 0
		[Toggle]_MainTex_Alpha("MainTex_Alpha", Float) = 0
		[KeywordEnum(Tex,RGB_Tex)] _MTex_RGB("M.Tex_RGB", Float) = 0
		_RGB_Offset("RGB_Offset", Vector) = (0.03,0,-0.03,0)
		_RGB_Value("RGB_Value", Range( 0 , 1)) = 0.2
		M_RotateValue("M_RotateValue", Range( 0 , 1)) = 0
		[Header(PoolarCoord)][Toggle]_MainTex_PolarCoord("MainTex_PolarCoord", Float) = 0
		_Length_Scale("Length_Scale", Float) = 1
		_PolarOffset("PolarOffset", Vector) = (0.5,0.5,0,0)
		_Radial_Scale("Radial_Scale", Float) = 1
		_Polar_CenterUV("Polar_CenterUV", Vector) = (0.5,0.5,0,0)
		[Header(__________________________________________________________________________)][Header(Distortion Texture)]_DistortionTex("DistortionTex", 2D) = "white" {}
		_DUV_Scroll("D.UV_Scroll", Vector) = (0,0,0,0)
		[Toggle(_DISTORTION_SWITCH_ON)] _Distortion_Switch("Distortion_Switch", Float) = 0
		[Toggle(_DISTORTION_CUSTOM2_Z_ON)] _Distortion_Custom2_Z("Distortion_Custom2_Z", Float) = 0
		_DIntensity("D.Intensity", Range( 0 , 1)) = 0
		[Header(__________________________________________________________________)][Header(Mask Texture)]_MaskTex("MaskTex", 2D) = "white" {}
		[KeywordEnum(Custom1_Off,Custom1_On_XY)] _MUV_Scroll_Custom1_ZW("M.UV_Scroll_Custom1_ZW", Float) = 0
		MUV_Scroll2("M.UV_Scroll", Vector) = (0,0,0,0)
		M_RotateValue2("M_RotateValue", Range( 0 , 1)) = 0
		_Mask_Distort_Value("Mask_Distort_Value", Range( 0 , 1)) = 0
		[KeywordEnum(Custom2_Off,Custom2_Y_ON)] _MOpacity_Custom2_Y("M.Opacity_Custom2_Y", Float) = 0
		_MaskOpacity("MaskOpacity", Range( 0 , 1)) = 1
		_Mask_Power("Mask_Power", Float) = 1
		_Mask_Intensity("Mask_Intensity", Float) = 1
		[SingleLineTexture]_AddMask("Add Mask", 2D) = "white" {}
		[Header(__________________________________________________________________)][Header(Dissolve Texture)]_DissolveTex("DissolveTex", 2D) = "white" {}
		DUV_Scroll2("D.UV_Scroll", Vector) = (0,0,0,0)
		_Dissolve_Distort_Value("Dissolve_Distort_Value", Range( 0 , 1)) = 0
		[KeywordEnum(Off,Smoothness,Step,DirectionDissolve)] _Dissolve("Dissolve", Float) = 0
		D_RotateValue("D_RotateValue", Range( 0 , 1)) = 0
		[KeywordEnum(Custom2_Off,Custom2_X_ON)] _DIntensity_Custom2_X("D.Intensity_Custom2_X", Float) = 0
		DIntensity2("D.Intensity", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.3
		_DEdge_Color("D.Edge_Color", Color) = (1,1,1,1)
		_DEdge_Intensity("D.Edge_Intensity", Float) = 1
		_DEdge_Width("D.Edge_Width", Range( 0 , 1)) = 0.01
		[Header(Dir.Dissolve)][KeywordEnum(U_Pos,U_Neg,V_Pos,V_Neg)] _UVMaskDirection("UV Mask Direction", Float) = 0
		[KeywordEnum(Custom2_Off,Custom2_X_On)] _Dissolve_Custom2_X("Dissolve_Custom2_X", Float) = 0
		_DissolveFloat("Dissolve_Intensity", Range( 0 , 1)) = 0.4526118
		_DDirection_Width("D.Direction_Width", Range( 0 , 1)) = 1
		_DirectionSmoothness("Direction Smoothness", Range( 0 , 1)) = 0.3282696
		[Header(______________________________________________________________) ][Header(SoftParticle) ][KeywordEnum(On,Off)] _SoftParticle("SoftParticle", Float) = 1
		_SoftParticle_Factor("SoftParticle_Factor", Range( 0 , 1)) = 0
		[______________________________________________________________________________________________________________________][Header(Fresnel)][Toggle]_Fresnel("Fresnel", Float) = 0
		[Toggle]_Rim_OneMinus("Rim_OneMinus", Float) = 0
		[HDR]_Frenel_Color("Frenel_Color", Color) = (1,1,1,1)
		_Fresnel_Range("Fresnel_Range", Float) = 0
		[Header(_________________________________________________________)][Header(VertexDisplacement)][KeywordEnum(Off,On)] _VertexDisplcement("VertexDisplcement", Float) = 0
		_VDTex("VD.Tex", 2D) = "white" {}
		_VDScrollSpeed("VD.ScrollSpeed", Vector) = (0,0,0,0)
		_VetexDir("VetexDir", Vector) = (1,1,1,0)
		_VDIntensity("VD.Intensity", Float) = 0
		_Vertex_Distort_Value("Vertex_Distort_Value", Range( 0 , 1)) = 0
		[Header(ScreenDistortion)][Toggle(_SCREEN_DISTORTION_ON)] _Screen_Distortion("Screen_Distortion", Float) = 0
		_Screen_Intensity("Screen_Intensity", Float) = 0
		[Toggle]_Screen_ADD("Screen_ADD", Float) = 0
		[Header(Setting)][Enum(AlphaBlend,5,Additive,1)]_src("src", Float) = 5
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("CullMode", Float) = 0
		[ASEEnd][Enum(OFF,0,ON,1)]_ZWirteMode("ZWirteMode", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull [_CullMode]
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 3.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend [_src] OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite [_ZWirteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 120115
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma multi_compile _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3

			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma shader_feature _ _SAMPLE_GI
			#pragma multi_compile _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _VERTEXDISPLCEMENT_OFF _VERTEXDISPLCEMENT_ON
			#pragma shader_feature_local _SCREEN_DISTORTION_ON
			#pragma shader_feature_local _MTEX_RGB_TEX _MTEX_RGB_RGB_TEX
			#pragma shader_feature_local _DISTORTION_SWITCH_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY
			#pragma shader_feature_local _DISTORTION_CUSTOM2_Z_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY
			#pragma shader_feature_local _MOPACITY_CUSTOM2_Y_CUSTOM2_OFF _MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON
			#pragma shader_feature_local _SOFTPARTICLE_ON _SOFTPARTICLE_OFF
			#pragma shader_feature_local _DISSOLVE_OFF _DISSOLVE_SMOOTHNESS _DISSOLVE_STEP _DISSOLVE_DIRECTIONDISSOLVE
			#pragma shader_feature_local _DINTENSITY_CUSTOM2_X_CUSTOM2_OFF _DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _DISSOLVE_CUSTOM2_X_CUSTOM2_OFF _DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _UVMASKDIRECTION_U_POS _UVMASKDIRECTION_U_NEG _UVMASKDIRECTION_V_POS _UVMASKDIRECTION_V_NEG


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Frenel_Color;
			float4 _MaskTex_ST;
			float4 _DissolveTex_ST;
			float4 _AddMask_ST;
			float4 _MainTex_ST;
			float4 _MRefine;
			float4 _DEdge_Color;
			float4 _RGB_Offset;
			float4 _DistortionTex_ST;
			float4 _VDTex_ST;
			float4 _MColor;
			float3 _VetexDir;
			float2 MUV_Scroll2;
			float2 _DUV_Scroll;
			float2 _VDScrollSpeed;
			float2 _MUV_Scroll;
			float2 _Polar_CenterUV;
			float2 _PolarOffset;
			float2 DUV_Scroll2;
			float DIntensity2;
			float D_RotateValue;
			float _Smoothness;
			float _ZWirteMode;
			float _DDirection_Width;
			float _DissolveFloat;
			float _DirectionSmoothness;
			float _MainTex_Alpha;
			float _DEdge_Width;
			float _DEdge_Intensity;
			float _Fresnel;
			float _Rim_OneMinus;
			float _Fresnel_Range;
			float _Dissolve_Distort_Value;
			float _SoftParticle_Factor;
			float M_RotateValue2;
			float _Screen_ADD;
			float _CullMode;
			float _Vertex_Distort_Value;
			float _VDIntensity;
			float _MainTex_RGB;
			float _MTex_ImageClampU;
			float _MainTex_PolarCoord;
			float _Radial_Scale;
			float _Length_Scale;
			float _MTex_ImageClampV;
			float M_RotateValue;
			float _DIntensity;
			float _RGB_Value;
			float _Mask_Intensity;
			float _Mask_Distort_Value;
			float _Mask_Power;
			float _MaskOpacity;
			float _MColor_Intensity;
			float _Screen_Intensity;
			float _src;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VDTex;
			sampler2D _DistortionTex;
			sampler2D _MainTex;
			sampler2D _MaskTex;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _DissolveTex;
			sampler2D _AddMask;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			

			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (0.0).xxx;
				float2 uv_VDTex = v.ase_texcoord.xy * _VDTex_ST.xy + _VDTex_ST.zw;
				float2 break7_g87 = _VDScrollSpeed;
				float2 appendResult8_g87 = (float2(( break7_g87.x * _TimeParameters.x ) , ( break7_g87.y * _TimeParameters.x )));
				float2 temp_output_10_0_g87 = ( ( v.vertex.xyz + float3( uv_VDTex ,  0.0 ) ).xy + appendResult8_g87 );
				float2 uv_DistortionTex = v.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2Dlod( _DistortionTex, float4( temp_output_10_0_g96, 0, 0.0) );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				#if defined(_VERTEXDISPLCEMENT_OFF)
				float3 staticSwitch146 = temp_cast_0;
				#elif defined(_VERTEXDISPLCEMENT_ON)
				float3 staticSwitch146 = ( ( _VetexDir + v.ase_normal ) * tex2Dlod( _VDTex, float4( ( float4( temp_output_10_0_g87, 0.0 , 0.0 ) + ( Distortion351 * _Vertex_Distort_Value ) ).rg, 0, 0.0) ).r * _VDIntensity );
				#else
				float3 staticSwitch146 = temp_cast_0;
				#endif
				float3 VertexDisplavement172 = staticSwitch146;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord6 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord7.xyz = ase_worldNormal;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord4 = v.ase_texcoord1;
				o.ase_texcoord5 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexDisplavement172;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_MainTex = IN.ase_texcoord3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break7_g99 = _MUV_Scroll;
				float2 appendResult8_g99 = (float2(( break7_g99.x * _TimeParameters.x ) , ( break7_g99.y * _TimeParameters.x )));
				float2 temp_output_10_0_g99 = ( uv_MainTex + appendResult8_g99 );
				float2 texCoord86 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break19_g100 = texCoord86;
				float2 appendResult20_g100 = (float2(break19_g100.x , break19_g100.y));
				float2 temp_output_10_0_g100 = ( uv_MainTex + appendResult20_g100 );
				#if defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF)
				float2 staticSwitch82 = temp_output_10_0_g99;
				#elif defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY)
				float2 staticSwitch82 = temp_output_10_0_g100;
				#else
				float2 staticSwitch82 = temp_output_10_0_g99;
				#endif
				float2 CenteredUV15_g101 = ( IN.ase_texcoord3.xy - _Polar_CenterUV );
				float2 break17_g101 = CenteredUV15_g101;
				float2 appendResult23_g101 = (float2(( length( CenteredUV15_g101 ) * _Radial_Scale * 2.0 ) , ( atan2( break17_g101.x , break17_g101.y ) * ( 1.0 / TWO_PI ) * _Length_Scale )));
				float temp_output_340_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).x;
				float temp_output_341_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).y;
				float2 appendResult347 = (float2((( _MTex_ImageClampU )?( saturate( temp_output_340_0 ) ):( temp_output_340_0 )) , (( _MTex_ImageClampV )?( saturate( temp_output_341_0 ) ):( temp_output_341_0 ))));
				float2 temp_cast_0 = (0.5).xx;
				float cos1_g98 = cos( ( M_RotateValue * TWO_PI ) );
				float sin1_g98 = sin( ( M_RotateValue * TWO_PI ) );
				float2 rotator1_g98 = mul( appendResult347 - temp_cast_0 , float2x2( cos1_g98 , -sin1_g98 , sin1_g98 , cos1_g98 )) + temp_cast_0;
				float2 temp_output_330_0 = rotator1_g98;
				float2 uv_DistortionTex = IN.ase_texcoord3.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2D( _DistortionTex, temp_output_10_0_g96 );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 texCoord528 = IN.ase_texcoord5;
				texCoord528.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISTORTION_CUSTOM2_Z_ON
				float staticSwitch529 = texCoord528.z;
				#else
				float staticSwitch529 = _DIntensity;
				#endif
				#ifdef _DISTORTION_SWITCH_ON
				float4 staticSwitch349 = ( ( temp_output_477_0 * staticSwitch529 ) + float4( temp_output_330_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch349 = float4( temp_output_330_0, 0.0 , 0.0 );
				#endif
				float4 tex2DNode10 = tex2D( _MainTex, staticSwitch349.rg );
				float4 temp_output_402_0 = ( tex2DNode10 * tex2DNode10.a );
				float4 break4_g97 = _MRefine;
				float clampResult7_g97 = clamp( break4_g97.w , 0.0 , 1.0 );
				float3 desaturateInitialColor10_g97 = (( _MainTex_RGB )?( tex2DNode10 ):( temp_output_402_0 )).xyz;
				float desaturateDot10_g97 = dot( desaturateInitialColor10_g97, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar10_g97 = lerp( desaturateInitialColor10_g97, desaturateDot10_g97.xxx, clampResult7_g97 );
				float3 temp_cast_6 = (break4_g97.x).xxx;
				float3 lerpResult11_g97 = lerp( ( pow( desaturateVar10_g97 , temp_cast_6 ) * break4_g97.y ) , ( desaturateVar10_g97 * break4_g97.z ) , 0.5);
				float2 break315 = temp_output_330_0;
				float2 appendResult307 = (float2(( break315.x + _RGB_Value ) , break315.y));
				float4 break303 = ( (0.0 + (_RGB_Value - 0.0) * (1.0 - 0.0) / (0.1 - 0.0)) * _RGB_Offset );
				float2 appendResult304 = (float2(break303.x , break303.y));
				float4 tex2DNode310 = tex2D( _MainTex, appendResult307 );
				float2 appendResult305 = (float2(break303.z , break303.w));
				float4 appendResult313 = (float4(tex2D( _MainTex, ( appendResult307 + appendResult304 ) ).r , tex2DNode310.g , tex2D( _MainTex, ( appendResult307 + appendResult305 ) ).b , tex2DNode310.a));
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch323 = float4( lerpResult11_g97 , 0.0 );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch323 = appendResult313;
				#else
				float4 staticSwitch323 = float4( lerpResult11_g97 , 0.0 );
				#endif
				float2 uv_MaskTex = IN.ase_texcoord3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				float4 Distortion351 = temp_output_477_0;
				float2 temp_cast_11 = (0.5).xx;
				float cos1_g84 = cos( ( M_RotateValue2 * TWO_PI ) );
				float sin1_g84 = sin( ( M_RotateValue2 * TWO_PI ) );
				float2 rotator1_g84 = mul( ( float4( uv_MaskTex, 0.0 , 0.0 ) + ( Distortion351 * _Mask_Distort_Value ) ).rg - temp_cast_11 , float2x2( cos1_g84 , -sin1_g84 , sin1_g84 , cos1_g84 )) + temp_cast_11;
				float2 temp_output_332_0 = rotator1_g84;
				float2 break7_g63 = MUV_Scroll2;
				float2 appendResult8_g63 = (float2(( break7_g63.x * _TimeParameters.x ) , ( break7_g63.y * _TimeParameters.x )));
				float2 temp_output_10_0_g63 = ( temp_output_332_0 + appendResult8_g63 );
				float4 texCoord122 = IN.ase_texcoord4;
				texCoord122.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult124 = (float2(texCoord122.z , texCoord122.w));
				float2 break19_g62 = appendResult124;
				float2 appendResult20_g62 = (float2(break19_g62.x , break19_g62.y));
				float2 temp_output_10_0_g62 = ( temp_output_332_0 + appendResult20_g62 );
				#if defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF)
				float2 staticSwitch120 = temp_output_10_0_g63;
				#elif defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY)
				float2 staticSwitch120 = temp_output_10_0_g62;
				#else
				float2 staticSwitch120 = temp_output_10_0_g63;
				#endif
				float4 temp_cast_12 = (_Mask_Power).xxxx;
				float4 temp_cast_13 = (1.0).xxxx;
				float4 texCoord155 = IN.ase_texcoord5;
				texCoord155.xy = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_OFF)
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#elif defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON)
				float staticSwitch156 = texCoord155.y;
				#else
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#endif
				float4 lerpResult148 = lerp( ( _Mask_Intensity * pow( tex2D( _MaskTex, staticSwitch120 ) , temp_cast_12 ) ) , temp_cast_13 , staticSwitch156);
				float4 temp_output_21_0 = ( staticSwitch323 * 1.0 * lerpResult148 );
				float3 appendResult425 = (float3(IN.ase_color.r , IN.ase_color.g , IN.ase_color.b));
				float3 appendResult426 = (float3(_MColor.r , _MColor.g , _MColor.b));
				float4 temp_output_427_0 = ( temp_output_21_0 * float4( appendResult425 , 0.0 ) * float4( appendResult426 , 0.0 ) * _MColor_Intensity );
				float4 screenPos = IN.ase_texcoord6;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal453 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( ( _Screen_Intensity * temp_output_21_0 * IN.ase_color.a ) + ase_grabScreenPosNorm ).xy ), 1.0 );
				float4 Mask178 = saturate( lerpResult148 );
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth4_g86 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				#if defined(_SOFTPARTICLE_ON)
				float staticSwitch75 = saturate( ( ( 1.0 - _SoftParticle_Factor ) * ( eyeDepth4_g86 - screenPos.w ) * 3.0 ) );
				#elif defined(_SOFTPARTICLE_OFF)
				float staticSwitch75 = 1.0;
				#else
				float staticSwitch75 = 1.0;
				#endif
				float SoftParticler174 = staticSwitch75;
				float4 temp_cast_23 = (tex2DNode10.a).xxxx;
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_23 )) );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch485 = ( appendResult313 * appendResult313.w );
				#else
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_23 )) );
				#endif
				float2 texCoord119 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch118 = DIntensity2;
				#elif defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch118 = texCoord119.x;
				#else
				float staticSwitch118 = DIntensity2;
				#endif
				float2 uv_DissolveTex = IN.ase_texcoord3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float2 temp_cast_25 = (0.5).xx;
				float cos1_g95 = cos( ( D_RotateValue * TWO_PI ) );
				float sin1_g95 = sin( ( D_RotateValue * TWO_PI ) );
				float2 rotator1_g95 = mul( uv_DissolveTex - temp_cast_25 , float2x2( cos1_g95 , -sin1_g95 , sin1_g95 , cos1_g95 )) + temp_cast_25;
				float2 break7_g94 = DUV_Scroll2;
				float2 appendResult8_g94 = (float2(( break7_g94.x * _TimeParameters.x ) , ( break7_g94.y * _TimeParameters.x )));
				float2 temp_output_10_0_g94 = ( ( float4( rotator1_g95, 0.0 , 0.0 ) + ( Distortion351 * _Dissolve_Distort_Value ) ).rg + appendResult8_g94 );
				float4 tex2DNode29 = tex2D( _DissolveTex, temp_output_10_0_g94 );
				float temp_output_368_0 = (( tex2DNode29 * tex2DNode29.a )).r;
				float smoothstepResult375 = smoothstep( 0.0 , _Smoothness , ( ( (0.0 + (staticSwitch118 - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * -1.0 ) + temp_output_368_0 + 1.0 ));
				float temp_output_381_0 = ( staticSwitch118 + 0.01 );
				float temp_output_385_0 = step( temp_output_381_0 , temp_output_368_0 );
				float2 texCoord244 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch243 = _DissolveFloat;
				#elif defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch243 = texCoord244.x;
				#else
				float staticSwitch243 = _DissolveFloat;
				#endif
				float temp_output_197_0 = ( 1.0 + _DirectionSmoothness );
				float temp_output_199_0 = ( staticSwitch243 * temp_output_197_0 );
				float2 texCoord238 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_UVMASKDIRECTION_U_POS)
				float staticSwitch240 = texCoord238.x;
				#elif defined(_UVMASKDIRECTION_U_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.x );
				#elif defined(_UVMASKDIRECTION_V_POS)
				float staticSwitch240 = texCoord238.y;
				#elif defined(_UVMASKDIRECTION_V_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.y );
				#else
				float staticSwitch240 = texCoord238.x;
				#endif
				float smoothstepResult198 = smoothstep( temp_output_199_0 , ( temp_output_199_0 - _DirectionSmoothness ) , staticSwitch240);
				float temp_output_267_0 = ( ( staticSwitch243 + _DDirection_Width ) * temp_output_197_0 );
				float smoothstepResult269 = smoothstep( temp_output_267_0 , ( temp_output_267_0 - _DirectionSmoothness ) , staticSwitch240);
				#if defined(_DISSOLVE_OFF)
				float staticSwitch378 = 1.0;
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float staticSwitch378 = smoothstepResult375;
				#elif defined(_DISSOLVE_STEP)
				float staticSwitch378 = temp_output_385_0;
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float staticSwitch378 = ( step( smoothstepResult198 , temp_output_368_0 ) - step( smoothstepResult269 , temp_output_368_0 ) );
				#else
				float staticSwitch378 = 1.0;
				#endif
				float2 uv_AddMask = IN.ase_texcoord3.xy * _AddMask_ST.xy + _AddMask_ST.zw;
				float4 AddMask488 = tex2D( _AddMask, uv_AddMask );
				float4 temp_output_22_0 = ( _MColor.a * IN.ase_color.a * Mask178 * SoftParticler174 * staticSwitch485 * staticSwitch378 * AddMask488 );
				float4 lerpResult454 = lerp( fetchOpaqueVal453 , temp_output_427_0 , temp_output_22_0);
				#ifdef _SCREEN_DISTORTION_ON
				float4 staticSwitch461 = (( _Screen_ADD )?( ( fetchOpaqueVal453 * temp_output_427_0 ) ):( lerpResult454 ));
				#else
				float4 staticSwitch461 = temp_output_427_0;
				#endif
				#if defined(_DISSOLVE_OFF)
				float4 staticSwitch433 = float4( 0,0,0,0 );
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float4 staticSwitch433 = float4( 0,0,0,0 );
				#elif defined(_DISSOLVE_STEP)
				float4 staticSwitch433 = ( ( temp_output_385_0 - step( ( temp_output_381_0 + ( _DEdge_Width * 0.5 ) ) , temp_output_368_0 ) ) * _DEdge_Color * _DEdge_Intensity * _DEdge_Color.a );
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float4 staticSwitch433 = float4( 0,0,0,0 );
				#else
				float4 staticSwitch433 = float4( 0,0,0,0 );
				#endif
				float4 temp_cast_39 = (0.0).xxxx;
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult500 = dot( ase_worldNormal , ase_worldViewDir );
				float temp_output_524_0 = saturate( abs( dotResult500 ) );
				float4 Fresnel522 = ( pow( (( _Rim_OneMinus )?( temp_output_524_0 ):( ( 1.0 - temp_output_524_0 ) )) , _Fresnel_Range ) * _Frenel_Color * _Frenel_Color.a );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = ( staticSwitch461 + temp_output_427_0 + staticSwitch433 + (( _Fresnel )?( Fresnel522 ):( temp_cast_39 )) ).xyz;
				float Alpha = ( temp_output_22_0 * saturate( ( _src - 1.0 ) ) ).r;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.clipPos, Color);
				#endif

				#if defined(_ALPHAPREMULTIPLY_ON)
				Color *= Alpha;
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 120115
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _VERTEXDISPLCEMENT_OFF _VERTEXDISPLCEMENT_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY
			#pragma shader_feature_local _MOPACITY_CUSTOM2_Y_CUSTOM2_OFF _MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON
			#pragma shader_feature_local _SOFTPARTICLE_ON _SOFTPARTICLE_OFF
			#pragma shader_feature_local _MTEX_RGB_TEX _MTEX_RGB_RGB_TEX
			#pragma shader_feature_local _DISTORTION_SWITCH_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY
			#pragma shader_feature_local _DISTORTION_CUSTOM2_Z_ON
			#pragma shader_feature_local _DISSOLVE_OFF _DISSOLVE_SMOOTHNESS _DISSOLVE_STEP _DISSOLVE_DIRECTIONDISSOLVE
			#pragma shader_feature_local _DINTENSITY_CUSTOM2_X_CUSTOM2_OFF _DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _DISSOLVE_CUSTOM2_X_CUSTOM2_OFF _DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _UVMASKDIRECTION_U_POS _UVMASKDIRECTION_U_NEG _UVMASKDIRECTION_V_POS _UVMASKDIRECTION_V_NEG


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Frenel_Color;
			float4 _MaskTex_ST;
			float4 _DissolveTex_ST;
			float4 _AddMask_ST;
			float4 _MainTex_ST;
			float4 _MRefine;
			float4 _DEdge_Color;
			float4 _RGB_Offset;
			float4 _DistortionTex_ST;
			float4 _VDTex_ST;
			float4 _MColor;
			float3 _VetexDir;
			float2 MUV_Scroll2;
			float2 _DUV_Scroll;
			float2 _VDScrollSpeed;
			float2 _MUV_Scroll;
			float2 _Polar_CenterUV;
			float2 _PolarOffset;
			float2 DUV_Scroll2;
			float DIntensity2;
			float D_RotateValue;
			float _Smoothness;
			float _ZWirteMode;
			float _DDirection_Width;
			float _DissolveFloat;
			float _DirectionSmoothness;
			float _MainTex_Alpha;
			float _DEdge_Width;
			float _DEdge_Intensity;
			float _Fresnel;
			float _Rim_OneMinus;
			float _Fresnel_Range;
			float _Dissolve_Distort_Value;
			float _SoftParticle_Factor;
			float M_RotateValue2;
			float _Screen_ADD;
			float _CullMode;
			float _Vertex_Distort_Value;
			float _VDIntensity;
			float _MainTex_RGB;
			float _MTex_ImageClampU;
			float _MainTex_PolarCoord;
			float _Radial_Scale;
			float _Length_Scale;
			float _MTex_ImageClampV;
			float M_RotateValue;
			float _DIntensity;
			float _RGB_Value;
			float _Mask_Intensity;
			float _Mask_Distort_Value;
			float _Mask_Power;
			float _MaskOpacity;
			float _MColor_Intensity;
			float _Screen_Intensity;
			float _src;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VDTex;
			sampler2D _DistortionTex;
			sampler2D _MaskTex;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _MainTex;
			sampler2D _DissolveTex;
			sampler2D _AddMask;


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (0.0).xxx;
				float2 uv_VDTex = v.ase_texcoord.xy * _VDTex_ST.xy + _VDTex_ST.zw;
				float2 break7_g87 = _VDScrollSpeed;
				float2 appendResult8_g87 = (float2(( break7_g87.x * _TimeParameters.x ) , ( break7_g87.y * _TimeParameters.x )));
				float2 temp_output_10_0_g87 = ( ( v.vertex.xyz + float3( uv_VDTex ,  0.0 ) ).xy + appendResult8_g87 );
				float2 uv_DistortionTex = v.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2Dlod( _DistortionTex, float4( temp_output_10_0_g96, 0, 0.0) );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				#if defined(_VERTEXDISPLCEMENT_OFF)
				float3 staticSwitch146 = temp_cast_0;
				#elif defined(_VERTEXDISPLCEMENT_ON)
				float3 staticSwitch146 = ( ( _VetexDir + v.ase_normal ) * tex2Dlod( _VDTex, float4( ( float4( temp_output_10_0_g87, 0.0 , 0.0 ) + ( Distortion351 * _Vertex_Distort_Value ) ).rg, 0, 0.0) ).r * _VDIntensity );
				#else
				float3 staticSwitch146 = temp_cast_0;
				#endif
				float3 VertexDisplavement172 = staticSwitch146;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord3 = v.ase_texcoord1;
				o.ase_texcoord4 = v.ase_texcoord3;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexDisplavement172;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = TransformWorldToHClip( positionWS );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_MaskTex = IN.ase_texcoord2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				float2 uv_DistortionTex = IN.ase_texcoord2.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2D( _DistortionTex, temp_output_10_0_g96 );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				float2 temp_cast_2 = (0.5).xx;
				float cos1_g84 = cos( ( M_RotateValue2 * TWO_PI ) );
				float sin1_g84 = sin( ( M_RotateValue2 * TWO_PI ) );
				float2 rotator1_g84 = mul( ( float4( uv_MaskTex, 0.0 , 0.0 ) + ( Distortion351 * _Mask_Distort_Value ) ).rg - temp_cast_2 , float2x2( cos1_g84 , -sin1_g84 , sin1_g84 , cos1_g84 )) + temp_cast_2;
				float2 temp_output_332_0 = rotator1_g84;
				float2 break7_g63 = MUV_Scroll2;
				float2 appendResult8_g63 = (float2(( break7_g63.x * _TimeParameters.x ) , ( break7_g63.y * _TimeParameters.x )));
				float2 temp_output_10_0_g63 = ( temp_output_332_0 + appendResult8_g63 );
				float4 texCoord122 = IN.ase_texcoord3;
				texCoord122.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult124 = (float2(texCoord122.z , texCoord122.w));
				float2 break19_g62 = appendResult124;
				float2 appendResult20_g62 = (float2(break19_g62.x , break19_g62.y));
				float2 temp_output_10_0_g62 = ( temp_output_332_0 + appendResult20_g62 );
				#if defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF)
				float2 staticSwitch120 = temp_output_10_0_g63;
				#elif defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY)
				float2 staticSwitch120 = temp_output_10_0_g62;
				#else
				float2 staticSwitch120 = temp_output_10_0_g63;
				#endif
				float4 temp_cast_3 = (_Mask_Power).xxxx;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 texCoord155 = IN.ase_texcoord4;
				texCoord155.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_OFF)
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#elif defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON)
				float staticSwitch156 = texCoord155.y;
				#else
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#endif
				float4 lerpResult148 = lerp( ( _Mask_Intensity * pow( tex2D( _MaskTex, staticSwitch120 ) , temp_cast_3 ) ) , temp_cast_4 , staticSwitch156);
				float4 Mask178 = saturate( lerpResult148 );
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth4_g86 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				#if defined(_SOFTPARTICLE_ON)
				float staticSwitch75 = saturate( ( ( 1.0 - _SoftParticle_Factor ) * ( eyeDepth4_g86 - screenPos.w ) * 3.0 ) );
				#elif defined(_SOFTPARTICLE_OFF)
				float staticSwitch75 = 1.0;
				#else
				float staticSwitch75 = 1.0;
				#endif
				float SoftParticler174 = staticSwitch75;
				float2 uv_MainTex = IN.ase_texcoord2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break7_g99 = _MUV_Scroll;
				float2 appendResult8_g99 = (float2(( break7_g99.x * _TimeParameters.x ) , ( break7_g99.y * _TimeParameters.x )));
				float2 temp_output_10_0_g99 = ( uv_MainTex + appendResult8_g99 );
				float2 texCoord86 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break19_g100 = texCoord86;
				float2 appendResult20_g100 = (float2(break19_g100.x , break19_g100.y));
				float2 temp_output_10_0_g100 = ( uv_MainTex + appendResult20_g100 );
				#if defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF)
				float2 staticSwitch82 = temp_output_10_0_g99;
				#elif defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY)
				float2 staticSwitch82 = temp_output_10_0_g100;
				#else
				float2 staticSwitch82 = temp_output_10_0_g99;
				#endif
				float2 CenteredUV15_g101 = ( IN.ase_texcoord2.xy - _Polar_CenterUV );
				float2 break17_g101 = CenteredUV15_g101;
				float2 appendResult23_g101 = (float2(( length( CenteredUV15_g101 ) * _Radial_Scale * 2.0 ) , ( atan2( break17_g101.x , break17_g101.y ) * ( 1.0 / TWO_PI ) * _Length_Scale )));
				float temp_output_340_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).x;
				float temp_output_341_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).y;
				float2 appendResult347 = (float2((( _MTex_ImageClampU )?( saturate( temp_output_340_0 ) ):( temp_output_340_0 )) , (( _MTex_ImageClampV )?( saturate( temp_output_341_0 ) ):( temp_output_341_0 ))));
				float2 temp_cast_5 = (0.5).xx;
				float cos1_g98 = cos( ( M_RotateValue * TWO_PI ) );
				float sin1_g98 = sin( ( M_RotateValue * TWO_PI ) );
				float2 rotator1_g98 = mul( appendResult347 - temp_cast_5 , float2x2( cos1_g98 , -sin1_g98 , sin1_g98 , cos1_g98 )) + temp_cast_5;
				float2 temp_output_330_0 = rotator1_g98;
				float4 texCoord528 = IN.ase_texcoord4;
				texCoord528.xy = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISTORTION_CUSTOM2_Z_ON
				float staticSwitch529 = texCoord528.z;
				#else
				float staticSwitch529 = _DIntensity;
				#endif
				#ifdef _DISTORTION_SWITCH_ON
				float4 staticSwitch349 = ( ( temp_output_477_0 * staticSwitch529 ) + float4( temp_output_330_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch349 = float4( temp_output_330_0, 0.0 , 0.0 );
				#endif
				float4 tex2DNode10 = tex2D( _MainTex, staticSwitch349.rg );
				float4 temp_cast_9 = (tex2DNode10.a).xxxx;
				float4 temp_output_402_0 = ( tex2DNode10 * tex2DNode10.a );
				float2 break315 = temp_output_330_0;
				float2 appendResult307 = (float2(( break315.x + _RGB_Value ) , break315.y));
				float4 break303 = ( (0.0 + (_RGB_Value - 0.0) * (1.0 - 0.0) / (0.1 - 0.0)) * _RGB_Offset );
				float2 appendResult304 = (float2(break303.x , break303.y));
				float4 tex2DNode310 = tex2D( _MainTex, appendResult307 );
				float2 appendResult305 = (float2(break303.z , break303.w));
				float4 appendResult313 = (float4(tex2D( _MainTex, ( appendResult307 + appendResult304 ) ).r , tex2DNode310.g , tex2D( _MainTex, ( appendResult307 + appendResult305 ) ).b , tex2DNode310.a));
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch485 = ( appendResult313 * appendResult313.w );
				#else
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#endif
				float2 texCoord119 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch118 = DIntensity2;
				#elif defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch118 = texCoord119.x;
				#else
				float staticSwitch118 = DIntensity2;
				#endif
				float2 uv_DissolveTex = IN.ase_texcoord2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float2 temp_cast_11 = (0.5).xx;
				float cos1_g95 = cos( ( D_RotateValue * TWO_PI ) );
				float sin1_g95 = sin( ( D_RotateValue * TWO_PI ) );
				float2 rotator1_g95 = mul( uv_DissolveTex - temp_cast_11 , float2x2( cos1_g95 , -sin1_g95 , sin1_g95 , cos1_g95 )) + temp_cast_11;
				float2 break7_g94 = DUV_Scroll2;
				float2 appendResult8_g94 = (float2(( break7_g94.x * _TimeParameters.x ) , ( break7_g94.y * _TimeParameters.x )));
				float2 temp_output_10_0_g94 = ( ( float4( rotator1_g95, 0.0 , 0.0 ) + ( Distortion351 * _Dissolve_Distort_Value ) ).rg + appendResult8_g94 );
				float4 tex2DNode29 = tex2D( _DissolveTex, temp_output_10_0_g94 );
				float temp_output_368_0 = (( tex2DNode29 * tex2DNode29.a )).r;
				float smoothstepResult375 = smoothstep( 0.0 , _Smoothness , ( ( (0.0 + (staticSwitch118 - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * -1.0 ) + temp_output_368_0 + 1.0 ));
				float temp_output_381_0 = ( staticSwitch118 + 0.01 );
				float temp_output_385_0 = step( temp_output_381_0 , temp_output_368_0 );
				float2 texCoord244 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch243 = _DissolveFloat;
				#elif defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch243 = texCoord244.x;
				#else
				float staticSwitch243 = _DissolveFloat;
				#endif
				float temp_output_197_0 = ( 1.0 + _DirectionSmoothness );
				float temp_output_199_0 = ( staticSwitch243 * temp_output_197_0 );
				float2 texCoord238 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_UVMASKDIRECTION_U_POS)
				float staticSwitch240 = texCoord238.x;
				#elif defined(_UVMASKDIRECTION_U_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.x );
				#elif defined(_UVMASKDIRECTION_V_POS)
				float staticSwitch240 = texCoord238.y;
				#elif defined(_UVMASKDIRECTION_V_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.y );
				#else
				float staticSwitch240 = texCoord238.x;
				#endif
				float smoothstepResult198 = smoothstep( temp_output_199_0 , ( temp_output_199_0 - _DirectionSmoothness ) , staticSwitch240);
				float temp_output_267_0 = ( ( staticSwitch243 + _DDirection_Width ) * temp_output_197_0 );
				float smoothstepResult269 = smoothstep( temp_output_267_0 , ( temp_output_267_0 - _DirectionSmoothness ) , staticSwitch240);
				#if defined(_DISSOLVE_OFF)
				float staticSwitch378 = 1.0;
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float staticSwitch378 = smoothstepResult375;
				#elif defined(_DISSOLVE_STEP)
				float staticSwitch378 = temp_output_385_0;
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float staticSwitch378 = ( step( smoothstepResult198 , temp_output_368_0 ) - step( smoothstepResult269 , temp_output_368_0 ) );
				#else
				float staticSwitch378 = 1.0;
				#endif
				float2 uv_AddMask = IN.ase_texcoord2.xy * _AddMask_ST.xy + _AddMask_ST.zw;
				float4 AddMask488 = tex2D( _AddMask, uv_AddMask );
				float4 temp_output_22_0 = ( _MColor.a * IN.ase_color.a * Mask178 * SoftParticler174 * staticSwitch485 * staticSwitch378 * AddMask488 );
				

				float Alpha = ( temp_output_22_0 * saturate( ( _src - 1.0 ) ) ).r;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 120115
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _VERTEXDISPLCEMENT_OFF _VERTEXDISPLCEMENT_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY
			#pragma shader_feature_local _MOPACITY_CUSTOM2_Y_CUSTOM2_OFF _MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON
			#pragma shader_feature_local _SOFTPARTICLE_ON _SOFTPARTICLE_OFF
			#pragma shader_feature_local _MTEX_RGB_TEX _MTEX_RGB_RGB_TEX
			#pragma shader_feature_local _DISTORTION_SWITCH_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY
			#pragma shader_feature_local _DISTORTION_CUSTOM2_Z_ON
			#pragma shader_feature_local _DISSOLVE_OFF _DISSOLVE_SMOOTHNESS _DISSOLVE_STEP _DISSOLVE_DIRECTIONDISSOLVE
			#pragma shader_feature_local _DINTENSITY_CUSTOM2_X_CUSTOM2_OFF _DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _DISSOLVE_CUSTOM2_X_CUSTOM2_OFF _DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _UVMASKDIRECTION_U_POS _UVMASKDIRECTION_U_NEG _UVMASKDIRECTION_V_POS _UVMASKDIRECTION_V_NEG


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Frenel_Color;
			float4 _MaskTex_ST;
			float4 _DissolveTex_ST;
			float4 _AddMask_ST;
			float4 _MainTex_ST;
			float4 _MRefine;
			float4 _DEdge_Color;
			float4 _RGB_Offset;
			float4 _DistortionTex_ST;
			float4 _VDTex_ST;
			float4 _MColor;
			float3 _VetexDir;
			float2 MUV_Scroll2;
			float2 _DUV_Scroll;
			float2 _VDScrollSpeed;
			float2 _MUV_Scroll;
			float2 _Polar_CenterUV;
			float2 _PolarOffset;
			float2 DUV_Scroll2;
			float DIntensity2;
			float D_RotateValue;
			float _Smoothness;
			float _ZWirteMode;
			float _DDirection_Width;
			float _DissolveFloat;
			float _DirectionSmoothness;
			float _MainTex_Alpha;
			float _DEdge_Width;
			float _DEdge_Intensity;
			float _Fresnel;
			float _Rim_OneMinus;
			float _Fresnel_Range;
			float _Dissolve_Distort_Value;
			float _SoftParticle_Factor;
			float M_RotateValue2;
			float _Screen_ADD;
			float _CullMode;
			float _Vertex_Distort_Value;
			float _VDIntensity;
			float _MainTex_RGB;
			float _MTex_ImageClampU;
			float _MainTex_PolarCoord;
			float _Radial_Scale;
			float _Length_Scale;
			float _MTex_ImageClampV;
			float M_RotateValue;
			float _DIntensity;
			float _RGB_Value;
			float _Mask_Intensity;
			float _Mask_Distort_Value;
			float _Mask_Power;
			float _MaskOpacity;
			float _MColor_Intensity;
			float _Screen_Intensity;
			float _src;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VDTex;
			sampler2D _DistortionTex;
			sampler2D _MaskTex;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _MainTex;
			sampler2D _DissolveTex;
			sampler2D _AddMask;


			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (0.0).xxx;
				float2 uv_VDTex = v.ase_texcoord.xy * _VDTex_ST.xy + _VDTex_ST.zw;
				float2 break7_g87 = _VDScrollSpeed;
				float2 appendResult8_g87 = (float2(( break7_g87.x * _TimeParameters.x ) , ( break7_g87.y * _TimeParameters.x )));
				float2 temp_output_10_0_g87 = ( ( v.vertex.xyz + float3( uv_VDTex ,  0.0 ) ).xy + appendResult8_g87 );
				float2 uv_DistortionTex = v.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2Dlod( _DistortionTex, float4( temp_output_10_0_g96, 0, 0.0) );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				#if defined(_VERTEXDISPLCEMENT_OFF)
				float3 staticSwitch146 = temp_cast_0;
				#elif defined(_VERTEXDISPLCEMENT_ON)
				float3 staticSwitch146 = ( ( _VetexDir + v.ase_normal ) * tex2Dlod( _VDTex, float4( ( float4( temp_output_10_0_g87, 0.0 , 0.0 ) + ( Distortion351 * _Vertex_Distort_Value ) ).rg, 0, 0.0) ).r * _VDIntensity );
				#else
				float3 staticSwitch146 = temp_cast_0;
				#endif
				float3 VertexDisplavement172 = staticSwitch146;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord3;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexDisplavement172;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_MaskTex = IN.ase_texcoord.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				float2 uv_DistortionTex = IN.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2D( _DistortionTex, temp_output_10_0_g96 );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				float2 temp_cast_2 = (0.5).xx;
				float cos1_g84 = cos( ( M_RotateValue2 * TWO_PI ) );
				float sin1_g84 = sin( ( M_RotateValue2 * TWO_PI ) );
				float2 rotator1_g84 = mul( ( float4( uv_MaskTex, 0.0 , 0.0 ) + ( Distortion351 * _Mask_Distort_Value ) ).rg - temp_cast_2 , float2x2( cos1_g84 , -sin1_g84 , sin1_g84 , cos1_g84 )) + temp_cast_2;
				float2 temp_output_332_0 = rotator1_g84;
				float2 break7_g63 = MUV_Scroll2;
				float2 appendResult8_g63 = (float2(( break7_g63.x * _TimeParameters.x ) , ( break7_g63.y * _TimeParameters.x )));
				float2 temp_output_10_0_g63 = ( temp_output_332_0 + appendResult8_g63 );
				float4 texCoord122 = IN.ase_texcoord1;
				texCoord122.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult124 = (float2(texCoord122.z , texCoord122.w));
				float2 break19_g62 = appendResult124;
				float2 appendResult20_g62 = (float2(break19_g62.x , break19_g62.y));
				float2 temp_output_10_0_g62 = ( temp_output_332_0 + appendResult20_g62 );
				#if defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF)
				float2 staticSwitch120 = temp_output_10_0_g63;
				#elif defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY)
				float2 staticSwitch120 = temp_output_10_0_g62;
				#else
				float2 staticSwitch120 = temp_output_10_0_g63;
				#endif
				float4 temp_cast_3 = (_Mask_Power).xxxx;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 texCoord155 = IN.ase_texcoord2;
				texCoord155.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_OFF)
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#elif defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON)
				float staticSwitch156 = texCoord155.y;
				#else
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#endif
				float4 lerpResult148 = lerp( ( _Mask_Intensity * pow( tex2D( _MaskTex, staticSwitch120 ) , temp_cast_3 ) ) , temp_cast_4 , staticSwitch156);
				float4 Mask178 = saturate( lerpResult148 );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth4_g86 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				#if defined(_SOFTPARTICLE_ON)
				float staticSwitch75 = saturate( ( ( 1.0 - _SoftParticle_Factor ) * ( eyeDepth4_g86 - screenPos.w ) * 3.0 ) );
				#elif defined(_SOFTPARTICLE_OFF)
				float staticSwitch75 = 1.0;
				#else
				float staticSwitch75 = 1.0;
				#endif
				float SoftParticler174 = staticSwitch75;
				float2 uv_MainTex = IN.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break7_g99 = _MUV_Scroll;
				float2 appendResult8_g99 = (float2(( break7_g99.x * _TimeParameters.x ) , ( break7_g99.y * _TimeParameters.x )));
				float2 temp_output_10_0_g99 = ( uv_MainTex + appendResult8_g99 );
				float2 texCoord86 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break19_g100 = texCoord86;
				float2 appendResult20_g100 = (float2(break19_g100.x , break19_g100.y));
				float2 temp_output_10_0_g100 = ( uv_MainTex + appendResult20_g100 );
				#if defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF)
				float2 staticSwitch82 = temp_output_10_0_g99;
				#elif defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY)
				float2 staticSwitch82 = temp_output_10_0_g100;
				#else
				float2 staticSwitch82 = temp_output_10_0_g99;
				#endif
				float2 CenteredUV15_g101 = ( IN.ase_texcoord.xy - _Polar_CenterUV );
				float2 break17_g101 = CenteredUV15_g101;
				float2 appendResult23_g101 = (float2(( length( CenteredUV15_g101 ) * _Radial_Scale * 2.0 ) , ( atan2( break17_g101.x , break17_g101.y ) * ( 1.0 / TWO_PI ) * _Length_Scale )));
				float temp_output_340_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).x;
				float temp_output_341_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).y;
				float2 appendResult347 = (float2((( _MTex_ImageClampU )?( saturate( temp_output_340_0 ) ):( temp_output_340_0 )) , (( _MTex_ImageClampV )?( saturate( temp_output_341_0 ) ):( temp_output_341_0 ))));
				float2 temp_cast_5 = (0.5).xx;
				float cos1_g98 = cos( ( M_RotateValue * TWO_PI ) );
				float sin1_g98 = sin( ( M_RotateValue * TWO_PI ) );
				float2 rotator1_g98 = mul( appendResult347 - temp_cast_5 , float2x2( cos1_g98 , -sin1_g98 , sin1_g98 , cos1_g98 )) + temp_cast_5;
				float2 temp_output_330_0 = rotator1_g98;
				float4 texCoord528 = IN.ase_texcoord2;
				texCoord528.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISTORTION_CUSTOM2_Z_ON
				float staticSwitch529 = texCoord528.z;
				#else
				float staticSwitch529 = _DIntensity;
				#endif
				#ifdef _DISTORTION_SWITCH_ON
				float4 staticSwitch349 = ( ( temp_output_477_0 * staticSwitch529 ) + float4( temp_output_330_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch349 = float4( temp_output_330_0, 0.0 , 0.0 );
				#endif
				float4 tex2DNode10 = tex2D( _MainTex, staticSwitch349.rg );
				float4 temp_cast_9 = (tex2DNode10.a).xxxx;
				float4 temp_output_402_0 = ( tex2DNode10 * tex2DNode10.a );
				float2 break315 = temp_output_330_0;
				float2 appendResult307 = (float2(( break315.x + _RGB_Value ) , break315.y));
				float4 break303 = ( (0.0 + (_RGB_Value - 0.0) * (1.0 - 0.0) / (0.1 - 0.0)) * _RGB_Offset );
				float2 appendResult304 = (float2(break303.x , break303.y));
				float4 tex2DNode310 = tex2D( _MainTex, appendResult307 );
				float2 appendResult305 = (float2(break303.z , break303.w));
				float4 appendResult313 = (float4(tex2D( _MainTex, ( appendResult307 + appendResult304 ) ).r , tex2DNode310.g , tex2D( _MainTex, ( appendResult307 + appendResult305 ) ).b , tex2DNode310.a));
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch485 = ( appendResult313 * appendResult313.w );
				#else
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#endif
				float2 texCoord119 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch118 = DIntensity2;
				#elif defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch118 = texCoord119.x;
				#else
				float staticSwitch118 = DIntensity2;
				#endif
				float2 uv_DissolveTex = IN.ase_texcoord.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float2 temp_cast_11 = (0.5).xx;
				float cos1_g95 = cos( ( D_RotateValue * TWO_PI ) );
				float sin1_g95 = sin( ( D_RotateValue * TWO_PI ) );
				float2 rotator1_g95 = mul( uv_DissolveTex - temp_cast_11 , float2x2( cos1_g95 , -sin1_g95 , sin1_g95 , cos1_g95 )) + temp_cast_11;
				float2 break7_g94 = DUV_Scroll2;
				float2 appendResult8_g94 = (float2(( break7_g94.x * _TimeParameters.x ) , ( break7_g94.y * _TimeParameters.x )));
				float2 temp_output_10_0_g94 = ( ( float4( rotator1_g95, 0.0 , 0.0 ) + ( Distortion351 * _Dissolve_Distort_Value ) ).rg + appendResult8_g94 );
				float4 tex2DNode29 = tex2D( _DissolveTex, temp_output_10_0_g94 );
				float temp_output_368_0 = (( tex2DNode29 * tex2DNode29.a )).r;
				float smoothstepResult375 = smoothstep( 0.0 , _Smoothness , ( ( (0.0 + (staticSwitch118 - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * -1.0 ) + temp_output_368_0 + 1.0 ));
				float temp_output_381_0 = ( staticSwitch118 + 0.01 );
				float temp_output_385_0 = step( temp_output_381_0 , temp_output_368_0 );
				float2 texCoord244 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch243 = _DissolveFloat;
				#elif defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch243 = texCoord244.x;
				#else
				float staticSwitch243 = _DissolveFloat;
				#endif
				float temp_output_197_0 = ( 1.0 + _DirectionSmoothness );
				float temp_output_199_0 = ( staticSwitch243 * temp_output_197_0 );
				float2 texCoord238 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_UVMASKDIRECTION_U_POS)
				float staticSwitch240 = texCoord238.x;
				#elif defined(_UVMASKDIRECTION_U_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.x );
				#elif defined(_UVMASKDIRECTION_V_POS)
				float staticSwitch240 = texCoord238.y;
				#elif defined(_UVMASKDIRECTION_V_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.y );
				#else
				float staticSwitch240 = texCoord238.x;
				#endif
				float smoothstepResult198 = smoothstep( temp_output_199_0 , ( temp_output_199_0 - _DirectionSmoothness ) , staticSwitch240);
				float temp_output_267_0 = ( ( staticSwitch243 + _DDirection_Width ) * temp_output_197_0 );
				float smoothstepResult269 = smoothstep( temp_output_267_0 , ( temp_output_267_0 - _DirectionSmoothness ) , staticSwitch240);
				#if defined(_DISSOLVE_OFF)
				float staticSwitch378 = 1.0;
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float staticSwitch378 = smoothstepResult375;
				#elif defined(_DISSOLVE_STEP)
				float staticSwitch378 = temp_output_385_0;
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float staticSwitch378 = ( step( smoothstepResult198 , temp_output_368_0 ) - step( smoothstepResult269 , temp_output_368_0 ) );
				#else
				float staticSwitch378 = 1.0;
				#endif
				float2 uv_AddMask = IN.ase_texcoord.xy * _AddMask_ST.xy + _AddMask_ST.zw;
				float4 AddMask488 = tex2D( _AddMask, uv_AddMask );
				float4 temp_output_22_0 = ( _MColor.a * IN.ase_color.a * Mask178 * SoftParticler174 * staticSwitch485 * staticSwitch378 * AddMask488 );
				

				surfaceDescription.Alpha = ( temp_output_22_0 * saturate( ( _src - 1.0 ) ) ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 120115
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _VERTEXDISPLCEMENT_OFF _VERTEXDISPLCEMENT_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY
			#pragma shader_feature_local _MOPACITY_CUSTOM2_Y_CUSTOM2_OFF _MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON
			#pragma shader_feature_local _SOFTPARTICLE_ON _SOFTPARTICLE_OFF
			#pragma shader_feature_local _MTEX_RGB_TEX _MTEX_RGB_RGB_TEX
			#pragma shader_feature_local _DISTORTION_SWITCH_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY
			#pragma shader_feature_local _DISTORTION_CUSTOM2_Z_ON
			#pragma shader_feature_local _DISSOLVE_OFF _DISSOLVE_SMOOTHNESS _DISSOLVE_STEP _DISSOLVE_DIRECTIONDISSOLVE
			#pragma shader_feature_local _DINTENSITY_CUSTOM2_X_CUSTOM2_OFF _DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _DISSOLVE_CUSTOM2_X_CUSTOM2_OFF _DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _UVMASKDIRECTION_U_POS _UVMASKDIRECTION_U_NEG _UVMASKDIRECTION_V_POS _UVMASKDIRECTION_V_NEG


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Frenel_Color;
			float4 _MaskTex_ST;
			float4 _DissolveTex_ST;
			float4 _AddMask_ST;
			float4 _MainTex_ST;
			float4 _MRefine;
			float4 _DEdge_Color;
			float4 _RGB_Offset;
			float4 _DistortionTex_ST;
			float4 _VDTex_ST;
			float4 _MColor;
			float3 _VetexDir;
			float2 MUV_Scroll2;
			float2 _DUV_Scroll;
			float2 _VDScrollSpeed;
			float2 _MUV_Scroll;
			float2 _Polar_CenterUV;
			float2 _PolarOffset;
			float2 DUV_Scroll2;
			float DIntensity2;
			float D_RotateValue;
			float _Smoothness;
			float _ZWirteMode;
			float _DDirection_Width;
			float _DissolveFloat;
			float _DirectionSmoothness;
			float _MainTex_Alpha;
			float _DEdge_Width;
			float _DEdge_Intensity;
			float _Fresnel;
			float _Rim_OneMinus;
			float _Fresnel_Range;
			float _Dissolve_Distort_Value;
			float _SoftParticle_Factor;
			float M_RotateValue2;
			float _Screen_ADD;
			float _CullMode;
			float _Vertex_Distort_Value;
			float _VDIntensity;
			float _MainTex_RGB;
			float _MTex_ImageClampU;
			float _MainTex_PolarCoord;
			float _Radial_Scale;
			float _Length_Scale;
			float _MTex_ImageClampV;
			float M_RotateValue;
			float _DIntensity;
			float _RGB_Value;
			float _Mask_Intensity;
			float _Mask_Distort_Value;
			float _Mask_Power;
			float _MaskOpacity;
			float _MColor_Intensity;
			float _Screen_Intensity;
			float _src;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VDTex;
			sampler2D _DistortionTex;
			sampler2D _MaskTex;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _MainTex;
			sampler2D _DissolveTex;
			sampler2D _AddMask;


			
			float4 _SelectionID;


			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (0.0).xxx;
				float2 uv_VDTex = v.ase_texcoord.xy * _VDTex_ST.xy + _VDTex_ST.zw;
				float2 break7_g87 = _VDScrollSpeed;
				float2 appendResult8_g87 = (float2(( break7_g87.x * _TimeParameters.x ) , ( break7_g87.y * _TimeParameters.x )));
				float2 temp_output_10_0_g87 = ( ( v.vertex.xyz + float3( uv_VDTex ,  0.0 ) ).xy + appendResult8_g87 );
				float2 uv_DistortionTex = v.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2Dlod( _DistortionTex, float4( temp_output_10_0_g96, 0, 0.0) );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				#if defined(_VERTEXDISPLCEMENT_OFF)
				float3 staticSwitch146 = temp_cast_0;
				#elif defined(_VERTEXDISPLCEMENT_ON)
				float3 staticSwitch146 = ( ( _VetexDir + v.ase_normal ) * tex2Dlod( _VDTex, float4( ( float4( temp_output_10_0_g87, 0.0 , 0.0 ) + ( Distortion351 * _Vertex_Distort_Value ) ).rg, 0, 0.0) ).r * _VDIntensity );
				#else
				float3 staticSwitch146 = temp_cast_0;
				#endif
				float3 VertexDisplavement172 = staticSwitch146;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord2 = v.ase_texcoord3;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = VertexDisplavement172;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_MaskTex = IN.ase_texcoord.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				float2 uv_DistortionTex = IN.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2D( _DistortionTex, temp_output_10_0_g96 );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				float2 temp_cast_2 = (0.5).xx;
				float cos1_g84 = cos( ( M_RotateValue2 * TWO_PI ) );
				float sin1_g84 = sin( ( M_RotateValue2 * TWO_PI ) );
				float2 rotator1_g84 = mul( ( float4( uv_MaskTex, 0.0 , 0.0 ) + ( Distortion351 * _Mask_Distort_Value ) ).rg - temp_cast_2 , float2x2( cos1_g84 , -sin1_g84 , sin1_g84 , cos1_g84 )) + temp_cast_2;
				float2 temp_output_332_0 = rotator1_g84;
				float2 break7_g63 = MUV_Scroll2;
				float2 appendResult8_g63 = (float2(( break7_g63.x * _TimeParameters.x ) , ( break7_g63.y * _TimeParameters.x )));
				float2 temp_output_10_0_g63 = ( temp_output_332_0 + appendResult8_g63 );
				float4 texCoord122 = IN.ase_texcoord1;
				texCoord122.xy = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult124 = (float2(texCoord122.z , texCoord122.w));
				float2 break19_g62 = appendResult124;
				float2 appendResult20_g62 = (float2(break19_g62.x , break19_g62.y));
				float2 temp_output_10_0_g62 = ( temp_output_332_0 + appendResult20_g62 );
				#if defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF)
				float2 staticSwitch120 = temp_output_10_0_g63;
				#elif defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY)
				float2 staticSwitch120 = temp_output_10_0_g62;
				#else
				float2 staticSwitch120 = temp_output_10_0_g63;
				#endif
				float4 temp_cast_3 = (_Mask_Power).xxxx;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 texCoord155 = IN.ase_texcoord2;
				texCoord155.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_OFF)
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#elif defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON)
				float staticSwitch156 = texCoord155.y;
				#else
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#endif
				float4 lerpResult148 = lerp( ( _Mask_Intensity * pow( tex2D( _MaskTex, staticSwitch120 ) , temp_cast_3 ) ) , temp_cast_4 , staticSwitch156);
				float4 Mask178 = saturate( lerpResult148 );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth4_g86 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				#if defined(_SOFTPARTICLE_ON)
				float staticSwitch75 = saturate( ( ( 1.0 - _SoftParticle_Factor ) * ( eyeDepth4_g86 - screenPos.w ) * 3.0 ) );
				#elif defined(_SOFTPARTICLE_OFF)
				float staticSwitch75 = 1.0;
				#else
				float staticSwitch75 = 1.0;
				#endif
				float SoftParticler174 = staticSwitch75;
				float2 uv_MainTex = IN.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break7_g99 = _MUV_Scroll;
				float2 appendResult8_g99 = (float2(( break7_g99.x * _TimeParameters.x ) , ( break7_g99.y * _TimeParameters.x )));
				float2 temp_output_10_0_g99 = ( uv_MainTex + appendResult8_g99 );
				float2 texCoord86 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break19_g100 = texCoord86;
				float2 appendResult20_g100 = (float2(break19_g100.x , break19_g100.y));
				float2 temp_output_10_0_g100 = ( uv_MainTex + appendResult20_g100 );
				#if defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF)
				float2 staticSwitch82 = temp_output_10_0_g99;
				#elif defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY)
				float2 staticSwitch82 = temp_output_10_0_g100;
				#else
				float2 staticSwitch82 = temp_output_10_0_g99;
				#endif
				float2 CenteredUV15_g101 = ( IN.ase_texcoord.xy - _Polar_CenterUV );
				float2 break17_g101 = CenteredUV15_g101;
				float2 appendResult23_g101 = (float2(( length( CenteredUV15_g101 ) * _Radial_Scale * 2.0 ) , ( atan2( break17_g101.x , break17_g101.y ) * ( 1.0 / TWO_PI ) * _Length_Scale )));
				float temp_output_340_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).x;
				float temp_output_341_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).y;
				float2 appendResult347 = (float2((( _MTex_ImageClampU )?( saturate( temp_output_340_0 ) ):( temp_output_340_0 )) , (( _MTex_ImageClampV )?( saturate( temp_output_341_0 ) ):( temp_output_341_0 ))));
				float2 temp_cast_5 = (0.5).xx;
				float cos1_g98 = cos( ( M_RotateValue * TWO_PI ) );
				float sin1_g98 = sin( ( M_RotateValue * TWO_PI ) );
				float2 rotator1_g98 = mul( appendResult347 - temp_cast_5 , float2x2( cos1_g98 , -sin1_g98 , sin1_g98 , cos1_g98 )) + temp_cast_5;
				float2 temp_output_330_0 = rotator1_g98;
				float4 texCoord528 = IN.ase_texcoord2;
				texCoord528.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISTORTION_CUSTOM2_Z_ON
				float staticSwitch529 = texCoord528.z;
				#else
				float staticSwitch529 = _DIntensity;
				#endif
				#ifdef _DISTORTION_SWITCH_ON
				float4 staticSwitch349 = ( ( temp_output_477_0 * staticSwitch529 ) + float4( temp_output_330_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch349 = float4( temp_output_330_0, 0.0 , 0.0 );
				#endif
				float4 tex2DNode10 = tex2D( _MainTex, staticSwitch349.rg );
				float4 temp_cast_9 = (tex2DNode10.a).xxxx;
				float4 temp_output_402_0 = ( tex2DNode10 * tex2DNode10.a );
				float2 break315 = temp_output_330_0;
				float2 appendResult307 = (float2(( break315.x + _RGB_Value ) , break315.y));
				float4 break303 = ( (0.0 + (_RGB_Value - 0.0) * (1.0 - 0.0) / (0.1 - 0.0)) * _RGB_Offset );
				float2 appendResult304 = (float2(break303.x , break303.y));
				float4 tex2DNode310 = tex2D( _MainTex, appendResult307 );
				float2 appendResult305 = (float2(break303.z , break303.w));
				float4 appendResult313 = (float4(tex2D( _MainTex, ( appendResult307 + appendResult304 ) ).r , tex2DNode310.g , tex2D( _MainTex, ( appendResult307 + appendResult305 ) ).b , tex2DNode310.a));
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch485 = ( appendResult313 * appendResult313.w );
				#else
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#endif
				float2 texCoord119 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch118 = DIntensity2;
				#elif defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch118 = texCoord119.x;
				#else
				float staticSwitch118 = DIntensity2;
				#endif
				float2 uv_DissolveTex = IN.ase_texcoord.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float2 temp_cast_11 = (0.5).xx;
				float cos1_g95 = cos( ( D_RotateValue * TWO_PI ) );
				float sin1_g95 = sin( ( D_RotateValue * TWO_PI ) );
				float2 rotator1_g95 = mul( uv_DissolveTex - temp_cast_11 , float2x2( cos1_g95 , -sin1_g95 , sin1_g95 , cos1_g95 )) + temp_cast_11;
				float2 break7_g94 = DUV_Scroll2;
				float2 appendResult8_g94 = (float2(( break7_g94.x * _TimeParameters.x ) , ( break7_g94.y * _TimeParameters.x )));
				float2 temp_output_10_0_g94 = ( ( float4( rotator1_g95, 0.0 , 0.0 ) + ( Distortion351 * _Dissolve_Distort_Value ) ).rg + appendResult8_g94 );
				float4 tex2DNode29 = tex2D( _DissolveTex, temp_output_10_0_g94 );
				float temp_output_368_0 = (( tex2DNode29 * tex2DNode29.a )).r;
				float smoothstepResult375 = smoothstep( 0.0 , _Smoothness , ( ( (0.0 + (staticSwitch118 - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * -1.0 ) + temp_output_368_0 + 1.0 ));
				float temp_output_381_0 = ( staticSwitch118 + 0.01 );
				float temp_output_385_0 = step( temp_output_381_0 , temp_output_368_0 );
				float2 texCoord244 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch243 = _DissolveFloat;
				#elif defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch243 = texCoord244.x;
				#else
				float staticSwitch243 = _DissolveFloat;
				#endif
				float temp_output_197_0 = ( 1.0 + _DirectionSmoothness );
				float temp_output_199_0 = ( staticSwitch243 * temp_output_197_0 );
				float2 texCoord238 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_UVMASKDIRECTION_U_POS)
				float staticSwitch240 = texCoord238.x;
				#elif defined(_UVMASKDIRECTION_U_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.x );
				#elif defined(_UVMASKDIRECTION_V_POS)
				float staticSwitch240 = texCoord238.y;
				#elif defined(_UVMASKDIRECTION_V_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.y );
				#else
				float staticSwitch240 = texCoord238.x;
				#endif
				float smoothstepResult198 = smoothstep( temp_output_199_0 , ( temp_output_199_0 - _DirectionSmoothness ) , staticSwitch240);
				float temp_output_267_0 = ( ( staticSwitch243 + _DDirection_Width ) * temp_output_197_0 );
				float smoothstepResult269 = smoothstep( temp_output_267_0 , ( temp_output_267_0 - _DirectionSmoothness ) , staticSwitch240);
				#if defined(_DISSOLVE_OFF)
				float staticSwitch378 = 1.0;
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float staticSwitch378 = smoothstepResult375;
				#elif defined(_DISSOLVE_STEP)
				float staticSwitch378 = temp_output_385_0;
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float staticSwitch378 = ( step( smoothstepResult198 , temp_output_368_0 ) - step( smoothstepResult269 , temp_output_368_0 ) );
				#else
				float staticSwitch378 = 1.0;
				#endif
				float2 uv_AddMask = IN.ase_texcoord.xy * _AddMask_ST.xy + _AddMask_ST.zw;
				float4 AddMask488 = tex2D( _AddMask, uv_AddMask );
				float4 temp_output_22_0 = ( _MColor.a * IN.ase_color.a * Mask178 * SoftParticler174 * staticSwitch485 * staticSwitch378 * AddMask488 );
				

				surfaceDescription.Alpha = ( temp_output_22_0 * saturate( ( _src - 1.0 ) ) ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
            Name "DepthNormals"
            Tags { "LightMode"="DepthNormals" }

			ZTest LEqual
			ZWrite On


			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 120115
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _VERTEXDISPLCEMENT_OFF _VERTEXDISPLCEMENT_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY
			#pragma shader_feature_local _MOPACITY_CUSTOM2_Y_CUSTOM2_OFF _MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON
			#pragma shader_feature_local _SOFTPARTICLE_ON _SOFTPARTICLE_OFF
			#pragma shader_feature_local _MTEX_RGB_TEX _MTEX_RGB_RGB_TEX
			#pragma shader_feature_local _DISTORTION_SWITCH_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY
			#pragma shader_feature_local _DISTORTION_CUSTOM2_Z_ON
			#pragma shader_feature_local _DISSOLVE_OFF _DISSOLVE_SMOOTHNESS _DISSOLVE_STEP _DISSOLVE_DIRECTIONDISSOLVE
			#pragma shader_feature_local _DINTENSITY_CUSTOM2_X_CUSTOM2_OFF _DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _DISSOLVE_CUSTOM2_X_CUSTOM2_OFF _DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _UVMASKDIRECTION_U_POS _UVMASKDIRECTION_U_NEG _UVMASKDIRECTION_V_POS _UVMASKDIRECTION_V_NEG


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Frenel_Color;
			float4 _MaskTex_ST;
			float4 _DissolveTex_ST;
			float4 _AddMask_ST;
			float4 _MainTex_ST;
			float4 _MRefine;
			float4 _DEdge_Color;
			float4 _RGB_Offset;
			float4 _DistortionTex_ST;
			float4 _VDTex_ST;
			float4 _MColor;
			float3 _VetexDir;
			float2 MUV_Scroll2;
			float2 _DUV_Scroll;
			float2 _VDScrollSpeed;
			float2 _MUV_Scroll;
			float2 _Polar_CenterUV;
			float2 _PolarOffset;
			float2 DUV_Scroll2;
			float DIntensity2;
			float D_RotateValue;
			float _Smoothness;
			float _ZWirteMode;
			float _DDirection_Width;
			float _DissolveFloat;
			float _DirectionSmoothness;
			float _MainTex_Alpha;
			float _DEdge_Width;
			float _DEdge_Intensity;
			float _Fresnel;
			float _Rim_OneMinus;
			float _Fresnel_Range;
			float _Dissolve_Distort_Value;
			float _SoftParticle_Factor;
			float M_RotateValue2;
			float _Screen_ADD;
			float _CullMode;
			float _Vertex_Distort_Value;
			float _VDIntensity;
			float _MainTex_RGB;
			float _MTex_ImageClampU;
			float _MainTex_PolarCoord;
			float _Radial_Scale;
			float _Length_Scale;
			float _MTex_ImageClampV;
			float M_RotateValue;
			float _DIntensity;
			float _RGB_Value;
			float _Mask_Intensity;
			float _Mask_Distort_Value;
			float _Mask_Power;
			float _MaskOpacity;
			float _MColor_Intensity;
			float _Screen_Intensity;
			float _src;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _VDTex;
			sampler2D _DistortionTex;
			sampler2D _MaskTex;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _MainTex;
			sampler2D _DissolveTex;
			sampler2D _AddMask;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (0.0).xxx;
				float2 uv_VDTex = v.ase_texcoord.xy * _VDTex_ST.xy + _VDTex_ST.zw;
				float2 break7_g87 = _VDScrollSpeed;
				float2 appendResult8_g87 = (float2(( break7_g87.x * _TimeParameters.x ) , ( break7_g87.y * _TimeParameters.x )));
				float2 temp_output_10_0_g87 = ( ( v.vertex.xyz + float3( uv_VDTex ,  0.0 ) ).xy + appendResult8_g87 );
				float2 uv_DistortionTex = v.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2Dlod( _DistortionTex, float4( temp_output_10_0_g96, 0, 0.0) );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				#if defined(_VERTEXDISPLCEMENT_OFF)
				float3 staticSwitch146 = temp_cast_0;
				#elif defined(_VERTEXDISPLCEMENT_ON)
				float3 staticSwitch146 = ( ( _VetexDir + v.ase_normal ) * tex2Dlod( _VDTex, float4( ( float4( temp_output_10_0_g87, 0.0 , 0.0 ) + ( Distortion351 * _Vertex_Distort_Value ) ).rg, 0, 0.0) ).r * _VDIntensity );
				#else
				float3 staticSwitch146 = temp_cast_0;
				#endif
				float3 VertexDisplavement172 = staticSwitch146;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexDisplavement172;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.ase_normal);

				o.clipPos = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_MaskTex = IN.ase_texcoord1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				float2 uv_DistortionTex = IN.ase_texcoord1.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2D( _DistortionTex, temp_output_10_0_g96 );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				float2 temp_cast_2 = (0.5).xx;
				float cos1_g84 = cos( ( M_RotateValue2 * TWO_PI ) );
				float sin1_g84 = sin( ( M_RotateValue2 * TWO_PI ) );
				float2 rotator1_g84 = mul( ( float4( uv_MaskTex, 0.0 , 0.0 ) + ( Distortion351 * _Mask_Distort_Value ) ).rg - temp_cast_2 , float2x2( cos1_g84 , -sin1_g84 , sin1_g84 , cos1_g84 )) + temp_cast_2;
				float2 temp_output_332_0 = rotator1_g84;
				float2 break7_g63 = MUV_Scroll2;
				float2 appendResult8_g63 = (float2(( break7_g63.x * _TimeParameters.x ) , ( break7_g63.y * _TimeParameters.x )));
				float2 temp_output_10_0_g63 = ( temp_output_332_0 + appendResult8_g63 );
				float4 texCoord122 = IN.ase_texcoord2;
				texCoord122.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult124 = (float2(texCoord122.z , texCoord122.w));
				float2 break19_g62 = appendResult124;
				float2 appendResult20_g62 = (float2(break19_g62.x , break19_g62.y));
				float2 temp_output_10_0_g62 = ( temp_output_332_0 + appendResult20_g62 );
				#if defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF)
				float2 staticSwitch120 = temp_output_10_0_g63;
				#elif defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY)
				float2 staticSwitch120 = temp_output_10_0_g62;
				#else
				float2 staticSwitch120 = temp_output_10_0_g63;
				#endif
				float4 temp_cast_3 = (_Mask_Power).xxxx;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 texCoord155 = IN.ase_texcoord3;
				texCoord155.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_OFF)
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#elif defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON)
				float staticSwitch156 = texCoord155.y;
				#else
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#endif
				float4 lerpResult148 = lerp( ( _Mask_Intensity * pow( tex2D( _MaskTex, staticSwitch120 ) , temp_cast_3 ) ) , temp_cast_4 , staticSwitch156);
				float4 Mask178 = saturate( lerpResult148 );
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth4_g86 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				#if defined(_SOFTPARTICLE_ON)
				float staticSwitch75 = saturate( ( ( 1.0 - _SoftParticle_Factor ) * ( eyeDepth4_g86 - screenPos.w ) * 3.0 ) );
				#elif defined(_SOFTPARTICLE_OFF)
				float staticSwitch75 = 1.0;
				#else
				float staticSwitch75 = 1.0;
				#endif
				float SoftParticler174 = staticSwitch75;
				float2 uv_MainTex = IN.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break7_g99 = _MUV_Scroll;
				float2 appendResult8_g99 = (float2(( break7_g99.x * _TimeParameters.x ) , ( break7_g99.y * _TimeParameters.x )));
				float2 temp_output_10_0_g99 = ( uv_MainTex + appendResult8_g99 );
				float2 texCoord86 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break19_g100 = texCoord86;
				float2 appendResult20_g100 = (float2(break19_g100.x , break19_g100.y));
				float2 temp_output_10_0_g100 = ( uv_MainTex + appendResult20_g100 );
				#if defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF)
				float2 staticSwitch82 = temp_output_10_0_g99;
				#elif defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY)
				float2 staticSwitch82 = temp_output_10_0_g100;
				#else
				float2 staticSwitch82 = temp_output_10_0_g99;
				#endif
				float2 CenteredUV15_g101 = ( IN.ase_texcoord1.xy - _Polar_CenterUV );
				float2 break17_g101 = CenteredUV15_g101;
				float2 appendResult23_g101 = (float2(( length( CenteredUV15_g101 ) * _Radial_Scale * 2.0 ) , ( atan2( break17_g101.x , break17_g101.y ) * ( 1.0 / TWO_PI ) * _Length_Scale )));
				float temp_output_340_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).x;
				float temp_output_341_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).y;
				float2 appendResult347 = (float2((( _MTex_ImageClampU )?( saturate( temp_output_340_0 ) ):( temp_output_340_0 )) , (( _MTex_ImageClampV )?( saturate( temp_output_341_0 ) ):( temp_output_341_0 ))));
				float2 temp_cast_5 = (0.5).xx;
				float cos1_g98 = cos( ( M_RotateValue * TWO_PI ) );
				float sin1_g98 = sin( ( M_RotateValue * TWO_PI ) );
				float2 rotator1_g98 = mul( appendResult347 - temp_cast_5 , float2x2( cos1_g98 , -sin1_g98 , sin1_g98 , cos1_g98 )) + temp_cast_5;
				float2 temp_output_330_0 = rotator1_g98;
				float4 texCoord528 = IN.ase_texcoord3;
				texCoord528.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISTORTION_CUSTOM2_Z_ON
				float staticSwitch529 = texCoord528.z;
				#else
				float staticSwitch529 = _DIntensity;
				#endif
				#ifdef _DISTORTION_SWITCH_ON
				float4 staticSwitch349 = ( ( temp_output_477_0 * staticSwitch529 ) + float4( temp_output_330_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch349 = float4( temp_output_330_0, 0.0 , 0.0 );
				#endif
				float4 tex2DNode10 = tex2D( _MainTex, staticSwitch349.rg );
				float4 temp_cast_9 = (tex2DNode10.a).xxxx;
				float4 temp_output_402_0 = ( tex2DNode10 * tex2DNode10.a );
				float2 break315 = temp_output_330_0;
				float2 appendResult307 = (float2(( break315.x + _RGB_Value ) , break315.y));
				float4 break303 = ( (0.0 + (_RGB_Value - 0.0) * (1.0 - 0.0) / (0.1 - 0.0)) * _RGB_Offset );
				float2 appendResult304 = (float2(break303.x , break303.y));
				float4 tex2DNode310 = tex2D( _MainTex, appendResult307 );
				float2 appendResult305 = (float2(break303.z , break303.w));
				float4 appendResult313 = (float4(tex2D( _MainTex, ( appendResult307 + appendResult304 ) ).r , tex2DNode310.g , tex2D( _MainTex, ( appendResult307 + appendResult305 ) ).b , tex2DNode310.a));
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch485 = ( appendResult313 * appendResult313.w );
				#else
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#endif
				float2 texCoord119 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch118 = DIntensity2;
				#elif defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch118 = texCoord119.x;
				#else
				float staticSwitch118 = DIntensity2;
				#endif
				float2 uv_DissolveTex = IN.ase_texcoord1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float2 temp_cast_11 = (0.5).xx;
				float cos1_g95 = cos( ( D_RotateValue * TWO_PI ) );
				float sin1_g95 = sin( ( D_RotateValue * TWO_PI ) );
				float2 rotator1_g95 = mul( uv_DissolveTex - temp_cast_11 , float2x2( cos1_g95 , -sin1_g95 , sin1_g95 , cos1_g95 )) + temp_cast_11;
				float2 break7_g94 = DUV_Scroll2;
				float2 appendResult8_g94 = (float2(( break7_g94.x * _TimeParameters.x ) , ( break7_g94.y * _TimeParameters.x )));
				float2 temp_output_10_0_g94 = ( ( float4( rotator1_g95, 0.0 , 0.0 ) + ( Distortion351 * _Dissolve_Distort_Value ) ).rg + appendResult8_g94 );
				float4 tex2DNode29 = tex2D( _DissolveTex, temp_output_10_0_g94 );
				float temp_output_368_0 = (( tex2DNode29 * tex2DNode29.a )).r;
				float smoothstepResult375 = smoothstep( 0.0 , _Smoothness , ( ( (0.0 + (staticSwitch118 - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * -1.0 ) + temp_output_368_0 + 1.0 ));
				float temp_output_381_0 = ( staticSwitch118 + 0.01 );
				float temp_output_385_0 = step( temp_output_381_0 , temp_output_368_0 );
				float2 texCoord244 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch243 = _DissolveFloat;
				#elif defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch243 = texCoord244.x;
				#else
				float staticSwitch243 = _DissolveFloat;
				#endif
				float temp_output_197_0 = ( 1.0 + _DirectionSmoothness );
				float temp_output_199_0 = ( staticSwitch243 * temp_output_197_0 );
				float2 texCoord238 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_UVMASKDIRECTION_U_POS)
				float staticSwitch240 = texCoord238.x;
				#elif defined(_UVMASKDIRECTION_U_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.x );
				#elif defined(_UVMASKDIRECTION_V_POS)
				float staticSwitch240 = texCoord238.y;
				#elif defined(_UVMASKDIRECTION_V_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.y );
				#else
				float staticSwitch240 = texCoord238.x;
				#endif
				float smoothstepResult198 = smoothstep( temp_output_199_0 , ( temp_output_199_0 - _DirectionSmoothness ) , staticSwitch240);
				float temp_output_267_0 = ( ( staticSwitch243 + _DDirection_Width ) * temp_output_197_0 );
				float smoothstepResult269 = smoothstep( temp_output_267_0 , ( temp_output_267_0 - _DirectionSmoothness ) , staticSwitch240);
				#if defined(_DISSOLVE_OFF)
				float staticSwitch378 = 1.0;
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float staticSwitch378 = smoothstepResult375;
				#elif defined(_DISSOLVE_STEP)
				float staticSwitch378 = temp_output_385_0;
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float staticSwitch378 = ( step( smoothstepResult198 , temp_output_368_0 ) - step( smoothstepResult269 , temp_output_368_0 ) );
				#else
				float staticSwitch378 = 1.0;
				#endif
				float2 uv_AddMask = IN.ase_texcoord1.xy * _AddMask_ST.xy + _AddMask_ST.zw;
				float4 AddMask488 = tex2D( _AddMask, uv_AddMask );
				float4 temp_output_22_0 = ( _MColor.a * IN.ase_color.a * Mask178 * SoftParticler174 * staticSwitch485 * staticSwitch378 * AddMask488 );
				

				surfaceDescription.Alpha = ( temp_output_22_0 * saturate( ( _src - 1.0 ) ) ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				float3 normalWS = IN.normalWS;

				return half4(NormalizeNormalPerPixel(normalWS), 0.0);
			}

			ENDHLSL
		}

		
		Pass
		{
			
            Name "DepthNormalsOnly"
            Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 120115
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma exclude_renderers glcore gles gles3 
			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define VARYINGS_NEED_NORMAL_WS
			#define VARYINGS_NEED_TANGENT_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _VERTEXDISPLCEMENT_OFF _VERTEXDISPLCEMENT_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY
			#pragma shader_feature_local _MOPACITY_CUSTOM2_Y_CUSTOM2_OFF _MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON
			#pragma shader_feature_local _SOFTPARTICLE_ON _SOFTPARTICLE_OFF
			#pragma shader_feature_local _MTEX_RGB_TEX _MTEX_RGB_RGB_TEX
			#pragma shader_feature_local _DISTORTION_SWITCH_ON
			#pragma shader_feature_local _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF _MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY
			#pragma shader_feature_local _DISTORTION_CUSTOM2_Z_ON
			#pragma shader_feature_local _DISSOLVE_OFF _DISSOLVE_SMOOTHNESS _DISSOLVE_STEP _DISSOLVE_DIRECTIONDISSOLVE
			#pragma shader_feature_local _DINTENSITY_CUSTOM2_X_CUSTOM2_OFF _DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _DISSOLVE_CUSTOM2_X_CUSTOM2_OFF _DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON
			#pragma shader_feature_local _UVMASKDIRECTION_U_POS _UVMASKDIRECTION_U_NEG _UVMASKDIRECTION_V_POS _UVMASKDIRECTION_V_NEG


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Frenel_Color;
			float4 _MaskTex_ST;
			float4 _DissolveTex_ST;
			float4 _AddMask_ST;
			float4 _MainTex_ST;
			float4 _MRefine;
			float4 _DEdge_Color;
			float4 _RGB_Offset;
			float4 _DistortionTex_ST;
			float4 _VDTex_ST;
			float4 _MColor;
			float3 _VetexDir;
			float2 MUV_Scroll2;
			float2 _DUV_Scroll;
			float2 _VDScrollSpeed;
			float2 _MUV_Scroll;
			float2 _Polar_CenterUV;
			float2 _PolarOffset;
			float2 DUV_Scroll2;
			float DIntensity2;
			float D_RotateValue;
			float _Smoothness;
			float _ZWirteMode;
			float _DDirection_Width;
			float _DissolveFloat;
			float _DirectionSmoothness;
			float _MainTex_Alpha;
			float _DEdge_Width;
			float _DEdge_Intensity;
			float _Fresnel;
			float _Rim_OneMinus;
			float _Fresnel_Range;
			float _Dissolve_Distort_Value;
			float _SoftParticle_Factor;
			float M_RotateValue2;
			float _Screen_ADD;
			float _CullMode;
			float _Vertex_Distort_Value;
			float _VDIntensity;
			float _MainTex_RGB;
			float _MTex_ImageClampU;
			float _MainTex_PolarCoord;
			float _Radial_Scale;
			float _Length_Scale;
			float _MTex_ImageClampV;
			float M_RotateValue;
			float _DIntensity;
			float _RGB_Value;
			float _Mask_Intensity;
			float _Mask_Distort_Value;
			float _Mask_Power;
			float _MaskOpacity;
			float _MColor_Intensity;
			float _Screen_Intensity;
			float _src;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _VDTex;
			sampler2D _DistortionTex;
			sampler2D _MaskTex;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _MainTex;
			sampler2D _DissolveTex;
			sampler2D _AddMask;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float3 temp_cast_1 = (0.0).xxx;
				float2 uv_VDTex = v.ase_texcoord.xy * _VDTex_ST.xy + _VDTex_ST.zw;
				float2 break7_g87 = _VDScrollSpeed;
				float2 appendResult8_g87 = (float2(( break7_g87.x * _TimeParameters.x ) , ( break7_g87.y * _TimeParameters.x )));
				float2 temp_output_10_0_g87 = ( ( v.vertex.xyz + float3( uv_VDTex ,  0.0 ) ).xy + appendResult8_g87 );
				float2 uv_DistortionTex = v.ase_texcoord.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2Dlod( _DistortionTex, float4( temp_output_10_0_g96, 0, 0.0) );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				#if defined(_VERTEXDISPLCEMENT_OFF)
				float3 staticSwitch146 = temp_cast_0;
				#elif defined(_VERTEXDISPLCEMENT_ON)
				float3 staticSwitch146 = ( ( _VetexDir + v.ase_normal ) * tex2Dlod( _VDTex, float4( ( float4( temp_output_10_0_g87, 0.0 , 0.0 ) + ( Distortion351 * _Vertex_Distort_Value ) ).rg, 0, 0.0) ).r * _VDIntensity );
				#else
				float3 staticSwitch146 = temp_cast_0;
				#endif
				float3 VertexDisplavement172 = staticSwitch146;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
				o.ase_color = v.ase_color;
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexDisplavement172;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.ase_normal);

				o.clipPos = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_MaskTex = IN.ase_texcoord1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
				float2 uv_DistortionTex = IN.ase_texcoord1.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
				float2 break7_g96 = _DUV_Scroll;
				float2 appendResult8_g96 = (float2(( break7_g96.x * _TimeParameters.x ) , ( break7_g96.y * _TimeParameters.x )));
				float2 temp_output_10_0_g96 = ( uv_DistortionTex + appendResult8_g96 );
				float4 tex2DNode101 = tex2D( _DistortionTex, temp_output_10_0_g96 );
				float4 temp_output_477_0 = ( tex2DNode101 * tex2DNode101.a );
				float4 Distortion351 = temp_output_477_0;
				float2 temp_cast_2 = (0.5).xx;
				float cos1_g84 = cos( ( M_RotateValue2 * TWO_PI ) );
				float sin1_g84 = sin( ( M_RotateValue2 * TWO_PI ) );
				float2 rotator1_g84 = mul( ( float4( uv_MaskTex, 0.0 , 0.0 ) + ( Distortion351 * _Mask_Distort_Value ) ).rg - temp_cast_2 , float2x2( cos1_g84 , -sin1_g84 , sin1_g84 , cos1_g84 )) + temp_cast_2;
				float2 temp_output_332_0 = rotator1_g84;
				float2 break7_g63 = MUV_Scroll2;
				float2 appendResult8_g63 = (float2(( break7_g63.x * _TimeParameters.x ) , ( break7_g63.y * _TimeParameters.x )));
				float2 temp_output_10_0_g63 = ( temp_output_332_0 + appendResult8_g63 );
				float4 texCoord122 = IN.ase_texcoord2;
				texCoord122.xy = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult124 = (float2(texCoord122.z , texCoord122.w));
				float2 break19_g62 = appendResult124;
				float2 appendResult20_g62 = (float2(break19_g62.x , break19_g62.y));
				float2 temp_output_10_0_g62 = ( temp_output_332_0 + appendResult20_g62 );
				#if defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_OFF)
				float2 staticSwitch120 = temp_output_10_0_g63;
				#elif defined(_MUV_SCROLL_CUSTOM1_ZW_CUSTOM1_ON_XY)
				float2 staticSwitch120 = temp_output_10_0_g62;
				#else
				float2 staticSwitch120 = temp_output_10_0_g63;
				#endif
				float4 temp_cast_3 = (_Mask_Power).xxxx;
				float4 temp_cast_4 = (1.0).xxxx;
				float4 texCoord155 = IN.ase_texcoord3;
				texCoord155.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_OFF)
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#elif defined(_MOPACITY_CUSTOM2_Y_CUSTOM2_Y_ON)
				float staticSwitch156 = texCoord155.y;
				#else
				float staticSwitch156 = ( 1.0 - _MaskOpacity );
				#endif
				float4 lerpResult148 = lerp( ( _Mask_Intensity * pow( tex2D( _MaskTex, staticSwitch120 ) , temp_cast_3 ) ) , temp_cast_4 , staticSwitch156);
				float4 Mask178 = saturate( lerpResult148 );
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth4_g86 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				#if defined(_SOFTPARTICLE_ON)
				float staticSwitch75 = saturate( ( ( 1.0 - _SoftParticle_Factor ) * ( eyeDepth4_g86 - screenPos.w ) * 3.0 ) );
				#elif defined(_SOFTPARTICLE_OFF)
				float staticSwitch75 = 1.0;
				#else
				float staticSwitch75 = 1.0;
				#endif
				float SoftParticler174 = staticSwitch75;
				float2 uv_MainTex = IN.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break7_g99 = _MUV_Scroll;
				float2 appendResult8_g99 = (float2(( break7_g99.x * _TimeParameters.x ) , ( break7_g99.y * _TimeParameters.x )));
				float2 temp_output_10_0_g99 = ( uv_MainTex + appendResult8_g99 );
				float2 texCoord86 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break19_g100 = texCoord86;
				float2 appendResult20_g100 = (float2(break19_g100.x , break19_g100.y));
				float2 temp_output_10_0_g100 = ( uv_MainTex + appendResult20_g100 );
				#if defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_OFF)
				float2 staticSwitch82 = temp_output_10_0_g99;
				#elif defined(_MUV_SCROLL_CUSTOM1_XY_CUSTOM1_ON_XY)
				float2 staticSwitch82 = temp_output_10_0_g100;
				#else
				float2 staticSwitch82 = temp_output_10_0_g99;
				#endif
				float2 CenteredUV15_g101 = ( IN.ase_texcoord1.xy - _Polar_CenterUV );
				float2 break17_g101 = CenteredUV15_g101;
				float2 appendResult23_g101 = (float2(( length( CenteredUV15_g101 ) * _Radial_Scale * 2.0 ) , ( atan2( break17_g101.x , break17_g101.y ) * ( 1.0 / TWO_PI ) * _Length_Scale )));
				float temp_output_340_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).x;
				float temp_output_341_0 = ((( _MainTex_PolarCoord )?( ( staticSwitch82 + appendResult23_g101 + _PolarOffset ) ):( staticSwitch82 ))).y;
				float2 appendResult347 = (float2((( _MTex_ImageClampU )?( saturate( temp_output_340_0 ) ):( temp_output_340_0 )) , (( _MTex_ImageClampV )?( saturate( temp_output_341_0 ) ):( temp_output_341_0 ))));
				float2 temp_cast_5 = (0.5).xx;
				float cos1_g98 = cos( ( M_RotateValue * TWO_PI ) );
				float sin1_g98 = sin( ( M_RotateValue * TWO_PI ) );
				float2 rotator1_g98 = mul( appendResult347 - temp_cast_5 , float2x2( cos1_g98 , -sin1_g98 , sin1_g98 , cos1_g98 )) + temp_cast_5;
				float2 temp_output_330_0 = rotator1_g98;
				float4 texCoord528 = IN.ase_texcoord3;
				texCoord528.xy = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISTORTION_CUSTOM2_Z_ON
				float staticSwitch529 = texCoord528.z;
				#else
				float staticSwitch529 = _DIntensity;
				#endif
				#ifdef _DISTORTION_SWITCH_ON
				float4 staticSwitch349 = ( ( temp_output_477_0 * staticSwitch529 ) + float4( temp_output_330_0, 0.0 , 0.0 ) );
				#else
				float4 staticSwitch349 = float4( temp_output_330_0, 0.0 , 0.0 );
				#endif
				float4 tex2DNode10 = tex2D( _MainTex, staticSwitch349.rg );
				float4 temp_cast_9 = (tex2DNode10.a).xxxx;
				float4 temp_output_402_0 = ( tex2DNode10 * tex2DNode10.a );
				float2 break315 = temp_output_330_0;
				float2 appendResult307 = (float2(( break315.x + _RGB_Value ) , break315.y));
				float4 break303 = ( (0.0 + (_RGB_Value - 0.0) * (1.0 - 0.0) / (0.1 - 0.0)) * _RGB_Offset );
				float2 appendResult304 = (float2(break303.x , break303.y));
				float4 tex2DNode310 = tex2D( _MainTex, appendResult307 );
				float2 appendResult305 = (float2(break303.z , break303.w));
				float4 appendResult313 = (float4(tex2D( _MainTex, ( appendResult307 + appendResult304 ) ).r , tex2DNode310.g , tex2D( _MainTex, ( appendResult307 + appendResult305 ) ).b , tex2DNode310.a));
				#if defined(_MTEX_RGB_TEX)
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#elif defined(_MTEX_RGB_RGB_TEX)
				float4 staticSwitch485 = ( appendResult313 * appendResult313.w );
				#else
				float4 staticSwitch485 = saturate( (( _MainTex_Alpha )?( temp_output_402_0 ):( temp_cast_9 )) );
				#endif
				float2 texCoord119 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch118 = DIntensity2;
				#elif defined(_DINTENSITY_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch118 = texCoord119.x;
				#else
				float staticSwitch118 = DIntensity2;
				#endif
				float2 uv_DissolveTex = IN.ase_texcoord1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
				float2 temp_cast_11 = (0.5).xx;
				float cos1_g95 = cos( ( D_RotateValue * TWO_PI ) );
				float sin1_g95 = sin( ( D_RotateValue * TWO_PI ) );
				float2 rotator1_g95 = mul( uv_DissolveTex - temp_cast_11 , float2x2( cos1_g95 , -sin1_g95 , sin1_g95 , cos1_g95 )) + temp_cast_11;
				float2 break7_g94 = DUV_Scroll2;
				float2 appendResult8_g94 = (float2(( break7_g94.x * _TimeParameters.x ) , ( break7_g94.y * _TimeParameters.x )));
				float2 temp_output_10_0_g94 = ( ( float4( rotator1_g95, 0.0 , 0.0 ) + ( Distortion351 * _Dissolve_Distort_Value ) ).rg + appendResult8_g94 );
				float4 tex2DNode29 = tex2D( _DissolveTex, temp_output_10_0_g94 );
				float temp_output_368_0 = (( tex2DNode29 * tex2DNode29.a )).r;
				float smoothstepResult375 = smoothstep( 0.0 , _Smoothness , ( ( (0.0 + (staticSwitch118 - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) * -1.0 ) + temp_output_368_0 + 1.0 ));
				float temp_output_381_0 = ( staticSwitch118 + 0.01 );
				float temp_output_385_0 = step( temp_output_381_0 , temp_output_368_0 );
				float2 texCoord244 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_OFF)
				float staticSwitch243 = _DissolveFloat;
				#elif defined(_DISSOLVE_CUSTOM2_X_CUSTOM2_X_ON)
				float staticSwitch243 = texCoord244.x;
				#else
				float staticSwitch243 = _DissolveFloat;
				#endif
				float temp_output_197_0 = ( 1.0 + _DirectionSmoothness );
				float temp_output_199_0 = ( staticSwitch243 * temp_output_197_0 );
				float2 texCoord238 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#if defined(_UVMASKDIRECTION_U_POS)
				float staticSwitch240 = texCoord238.x;
				#elif defined(_UVMASKDIRECTION_U_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.x );
				#elif defined(_UVMASKDIRECTION_V_POS)
				float staticSwitch240 = texCoord238.y;
				#elif defined(_UVMASKDIRECTION_V_NEG)
				float staticSwitch240 = ( 1.0 - texCoord238.y );
				#else
				float staticSwitch240 = texCoord238.x;
				#endif
				float smoothstepResult198 = smoothstep( temp_output_199_0 , ( temp_output_199_0 - _DirectionSmoothness ) , staticSwitch240);
				float temp_output_267_0 = ( ( staticSwitch243 + _DDirection_Width ) * temp_output_197_0 );
				float smoothstepResult269 = smoothstep( temp_output_267_0 , ( temp_output_267_0 - _DirectionSmoothness ) , staticSwitch240);
				#if defined(_DISSOLVE_OFF)
				float staticSwitch378 = 1.0;
				#elif defined(_DISSOLVE_SMOOTHNESS)
				float staticSwitch378 = smoothstepResult375;
				#elif defined(_DISSOLVE_STEP)
				float staticSwitch378 = temp_output_385_0;
				#elif defined(_DISSOLVE_DIRECTIONDISSOLVE)
				float staticSwitch378 = ( step( smoothstepResult198 , temp_output_368_0 ) - step( smoothstepResult269 , temp_output_368_0 ) );
				#else
				float staticSwitch378 = 1.0;
				#endif
				float2 uv_AddMask = IN.ase_texcoord1.xy * _AddMask_ST.xy + _AddMask_ST.zw;
				float4 AddMask488 = tex2D( _AddMask, uv_AddMask );
				float4 temp_output_22_0 = ( _MColor.a * IN.ase_color.a * Mask178 * SoftParticler174 * staticSwitch485 * staticSwitch378 * AddMask488 );
				

				surfaceDescription.Alpha = ( temp_output_22_0 * saturate( ( _src - 1.0 ) ) ).r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				float3 normalWS = IN.normalWS;

				return half4(NormalizeNormalPerPixel(normalWS), 0.0);
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.CommentaryNode;490;196.0947,1514.721;Inherit;False;246;160.4;;1;489;Add Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;159;-7967.054,-697.4672;Inherit;False;5006.917;611.0271;;16;92;88;330;347;82;315;410;409;402;10;87;86;84;83;348;476;Main Tex;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;476;-6739.521,-623.4171;Inherit;False;1101.115;488.7396;;7;472;474;473;475;465;464;468;PolarCoord;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;462;352.3221,-877.984;Inherit;False;1781.505;413.4996;;9;452;451;450;449;453;455;454;459;461;Screen Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;145;-964.4734,2637.555;Inherit;False;2299.059;675.1548;;16;146;138;147;135;142;139;172;133;143;136;140;137;395;400;492;493;VertexDisplacement;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;400;-584.4938,3031.494;Inherit;False;486.706;278.8691;;3;397;396;480;Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;160;-7090.273,1100.516;Inherit;False;4356.794;1828.188;;19;378;364;331;62;53;31;30;29;367;119;368;433;118;34;379;360;326;380;391;Dissolve;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;391;-4618.594,1502.609;Inherit;False;1126.691;479.1692;;12;125;389;387;386;385;383;381;382;266;432;436;435;Step;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;380;-4657.785,1127.921;Inherit;False;1016.249;358.4513;;7;371;373;375;372;374;376;370;Smoothness;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;366;-609.3558,-484.6191;Inherit;False;209.4767;271.924;;1;21;RGB;0.4744861,1,0.4584905,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;365;975.2825,1056.231;Inherit;False;212.4;254;;1;22;Alpha;1,0.4886792,0.4886792,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;158;-5579.449,-46.51625;Inherit;False;3909.794;951.6903;;26;178;149;148;443;151;448;447;446;444;445;24;357;25;332;122;124;66;59;156;155;52;120;121;358;486;488;Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;358;-5549.957,320.5359;Inherit;False;413.8354;244.5476;;3;355;354;478;Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;157;-6021.053,-1385.09;Inherit;False;2120.495;631.6118;;11;99;349;106;95;101;100;96;352;434;528;529;Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;352;-4809.215,-1314.757;Inherit;False;274.7998;165.4;;1;351;DIstortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;348;-5568,-458.2919;Inherit;False;717.562;270.854;;6;343;341;346;340;345;342;UV_Clamp;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;337;611.5089,2044.932;Inherit;False;617.9817;496.4839;;6;491;333;339;335;336;334;Setting;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;327;-2780.627,-671.5839;Inherit;False;603.7216;478.3409;;3;411;430;431;Refine;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;326;-6495.027,2050.975;Inherit;False;2175.255;676.1514;;21;394;393;392;200;269;238;243;196;240;265;244;202;198;267;268;201;199;241;197;239;525;Dissolve UV Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;325;-3786.834,-1483.423;Inherit;False;1933.451;722.933;;15;313;309;310;311;303;304;305;301;298;300;312;308;307;306;299;Main Tex RGB ;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;181;210.46,1778.958;Inherit;False;246;165.4;;1;180;Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;177;217.5694,2001.985;Inherit;False;262.8;165.4;;1;176;SoftPartice;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;144;-685.3486,2214.33;Inherit;False;1257.429;254.9338;;5;174;75;76;73;74;SoftParticle;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-635.3476,2264.33;Inherit;False;Property;_SoftParticle_Factor;SoftParticle_Factor;53;0;Create;True;1;SoftParticle;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-177.9391,2351.619;Inherit;False;Constant;_Float3;Float 3;23;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;121;-4357.588,451.0855;Inherit;False;FX_UV_Scroll;-1;;62;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,1;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.StaticSwitch;120;-3979.129,375.3264;Inherit;False;Property;_MUV_Scroll_Custom1_ZW;M.UV_Scroll_Custom1_ZW;27;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Custom1_Off;Custom1_On_XY;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;52;-4367.723,300.2947;Inherit;False;FX_UV_Scroll;-1;;63;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,0;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.TextureCoordinatesNode;155;-3838.415,707.4444;Inherit;False;3;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;156;-3587.88,664.1578;Inherit;False;Property;_MOpacity_Custom2_Y;M.Opacity_Custom2_Y;31;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Custom2_Off;Custom2_Y_ON;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;172;1060.746,2829.016;Inherit;False;VertexDisplavement;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;1410.016,18.47129;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.OneMinusNode;239;-5784.73,2100.976;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;197;-5406.134,2400.348;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;241;-5784.126,2200.347;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;199;-5295.634,2308.048;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;201;-5159.316,2417.368;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;267;-5297.01,2576.631;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;198;-4990.347,2297.096;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;243;-6152.006,2282.533;Inherit;False;Property;_Dissolve_Custom2_X;Dissolve_Custom2_X;48;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Custom2_Off;Custom2_X_On;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;238;-6034.996,2103.368;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;59;-4989.151,341.7921;Inherit;False;Property;M_RotateValue2;M_RotateValue;29;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;66;-4704.515,374.5175;Inherit;False;Property;MUV_Scroll2;M.UV_Scroll;28;0;Create;False;0;0;0;False;0;False;0,0;1,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;124;-4619.94,513.6563;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;122;-4863.836,510.7758;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;332;-4696.402,263.7875;Inherit;False;FX_Rotator;0;;84;e5de1de77a1fcb046bd822e82ac5d69e;0;2;7;FLOAT2;0,0;False;8;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;360;-6971.903,1362.745;Inherit;False;413.8354;244.5476;;3;361;362;479;Distortion;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;355;-5298.521,397.0912;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;1025.283,1106.23;Inherit;False;7;7;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;5;FLOAT;0;False;6;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;371;-4374.585,1189.134;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;373;-4134.751,1187.566;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;375;-3830.34,1180.83;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;372;-4525.811,1370.974;Inherit;False;Constant;_Float1;Float 1;48;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;374;-4275.002,1363.135;Inherit;False;Constant;_Float5;Float 5;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;370;-4607.785,1177.921;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;361;-6709.767,1433.883;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;362;-6911.203,1407.328;Inherit;False;351;Distortion;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;385;-4044.368,1552.609;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;387;-3871.774,1595.665;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;386;-4042.767,1664.609;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;73;-326.9464,2269.814;Inherit;False;FX_SoftParticle;-1;;86;18b0ff4c58fbf8943a03f551ab3f9adb;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;75;-2.604325,2295.818;Inherit;False;Property;_SoftParticle;SoftParticle;52;0;Create;True;0;0;0;False;2;Header(______________________________________________________________) ;Header(SoftParticle) ;False;0;1;1;True;;KeywordEnum;2;On;Off;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;147;443.6519,2734.352;Inherit;False;Constant;_Float8;Float 8;44;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;138;103.901,2911.54;Inherit;True;Property;_VDTex;VD.Tex;59;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;146;674.9488,2817.819;Inherit;False;Property;_VertexDisplcement;VertexDisplcement;58;0;Create;True;0;0;0;False;2;Header(_________________________________________________________);Header(VertexDisplacement);False;0;0;0;True;;KeywordEnum;2;Off;On;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;174;283.0476,2310.176;Inherit;False;SoftParticler;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;338;1427.335,790.6761;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;334;884.7067,2165.95;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;336;1044.345,2167.335;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;686.3835,2265.779;Inherit;False;Constant;_Float4;Float 4;42;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;176;267.5692,2051.986;Inherit;False;174;SoftParticler;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-5510.507,1679.707;Inherit;False;Property;DIntensity2;D.Intensity;42;0;Create;False;0;0;0;False;0;False;0;0.665;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;118;-5206.514,1695.707;Inherit;False;Property;_DIntensity_Custom2_X;D.Intensity_Custom2_X;41;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Custom2_Off;Custom2_X_ON;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;139;-516.3291,2873.943;Inherit;False;FX_UV_Scroll;-1;;87;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,0;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.SimpleAddOpNode;137;-663.9364,2860.068;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector2Node;140;-839.1024,3042.654;Inherit;False;Property;_VDScrollSpeed;VD.ScrollSpeed;60;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;136;-916.7374,2911.589;Inherit;False;0;138;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;133;-865.0084,2703.933;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;395;-85.21206,2961.484;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;142;524.4956,2919.969;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;143;220.1624,3120.695;Inherit;False;Property;_VDIntensity;VD.Intensity;62;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;25;-5449.087,73.49018;Inherit;False;0;24;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;357;-5067.699,213.9648;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;397;-271.4707,3118.649;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;396;-491.0493,3092.777;Inherit;False;351;Distortion;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;313;-2086.469,-1175.637;Inherit;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;376;-4115.176,1365.426;Inherit;False;Property;_Smoothness;Smoothness;43;0;Create;True;0;0;0;False;0;False;0.3;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;24;-3678.15,288.9888;Inherit;True;Property;_MaskTex;MaskTex;26;1;[Header];Create;True;2;__________________________________________________________________;Mask Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;19;574.824,80.67121;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;18;534.6503,260.6277;Inherit;False;Property;_MColor;M.Color;8;0;Create;True;0;0;0;False;0;False;1,1,1,1;0.7207546,0.6085154,0.444692,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;333;663.9091,2094.933;Inherit;False;Property;_src;src;67;2;[Header];[Enum];Create;True;1;Setting;2;AlphaBlend;5;Additive;1;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;425;769.1584,135.9375;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;427;1074.672,71.6191;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;368;-5056.369,1502.425;Inherit;False;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;119;-5464.498,1767.327;Inherit;False;3;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;432;-3891.71,1918.503;Inherit;False;Property;_DEdge_Intensity;D.Edge_Intensity;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;381;-4395.312,1638.927;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;382;-4591.666,1712.715;Inherit;False;Constant;_Float10;Float 10;50;0;Create;True;0;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;383;-4220.471,1733.769;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;435;-4583.575,1881.897;Inherit;False;Constant;_Float12;Float 12;52;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;436;-4348.296,1824.377;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;445;-3613.794,71.26006;Inherit;False;Property;_Mask_Power;Mask_Power;33;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;444;-3297.75,172.7204;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;446;-3290.754,70.0939;Inherit;False;Property;_Mask_Intensity;Mask_Intensity;34;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;447;-3080.834,142.399;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;448;-3758.403,610.05;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;151;-4062.896,613.2935;Inherit;False;Property;_MaskOpacity;MaskOpacity;32;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;148;-2887.666,258.8601;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;1,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;149;-3076.882,277.1688;Inherit;False;Constant;_Float7;Float 7;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;367;-5259.978,1478.711;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;29;-5584.324,1429.904;Inherit;True;Property;_DissolveTex;DissolveTex;36;1;[Header];Create;True;2;__________________________________________________________________;Dissolve Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;30;-6932.144,1230.687;Inherit;False;0;29;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;31;-6096.708,1577.81;Inherit;False;Property;DUV_Scroll2;D.UV_Scroll;37;0;Create;False;0;0;0;False;0;False;0,0;0.1,-0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;53;-5919.378,1428.295;Inherit;False;FX_UV_Scroll;-1;;94;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,0;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.RangedFloatNode;62;-6846.422,1162.374;Inherit;False;Property;D_RotateValue;D_RotateValue;40;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;331;-6545.708,1258.027;Inherit;False;FX_Rotator;0;;95;e5de1de77a1fcb046bd822e82ac5d69e;0;2;7;FLOAT2;0,0;False;8;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;364;-6246.507,1339.047;Inherit;False;2;2;0;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;309;-2485.558,-1433.423;Inherit;True;Property;_asdasd1;asdasd;2;1;[Header];Create;True;1;Main Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;10;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;310;-2484.729,-1209.85;Inherit;True;Property;_asdasd2;asdasd;2;1;[Header];Create;True;1;Main Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;10;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;303;-3053.091,-1077.489;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;304;-2905.891,-1092.849;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;305;-2905.489,-1003.884;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;301;-3223.157,-1116.543;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TFHCRemapNode;298;-3420.663,-1224.723;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;300;-3436.538,-1034.983;Inherit;False;Property;_RGB_Offset;RGB_Offset;13;0;Create;True;0;0;0;False;0;False;0.03,0,-0.03,0;0.03,0,-0.03,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;312;-2665.76,-1056.744;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;308;-2684.177,-1217.77;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;307;-2903.132,-1236.787;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;306;-3043.195,-1351.125;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.44;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-3736.834,-1331.034;Inherit;False;Property;_RGB_Value;RGB_Value;14;0;Create;True;0;0;0;False;0;False;0.2;0.223411;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;96;-5666.049,-1122.116;Inherit;False;FX_UV_Scroll;-1;;96;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,0;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.SamplerNode;101;-5369.538,-1141.166;Inherit;True;Property;_DistortionTex;DistortionTex;21;1;[Header];Create;True;2;__________________________________________________________________________;Distortion Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;351;-4754.204,-1263.504;Inherit;False;Distortion;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector2Node;100;-5874,-1053.309;Inherit;False;Property;_DUV_Scroll;D.UV_Scroll;22;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SamplerNode;311;-2478.208,-991.2909;Inherit;True;Property;_asdasd3;asdasd;2;1;[Header];Create;True;1;Main Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;10;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;430;-2479.12,-453.8815;Inherit;False;FX_Refine;-1;;97;de71e6d169e4b37458b413e4ae7400ee;0;2;9;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;411;-2351.828,-292.4492;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;342;-5375.168,-376.528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;345;-5131.903,-407.4749;Inherit;False;Property;_MTex_ImageClampU;M.Tex_ImageClampU;5;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;340;-5536.355,-415.5354;Inherit;False;FLOAT;0;1;2;3;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;10;-3755.57,-374.4686;Inherit;True;Property;_MainTex;MainTex;2;1;[Header];Create;True;1;Main Texture;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;402;-3423.596,-320.0984;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;409;-3209.608,-387.0749;Inherit;False;Property;_MainTex_RGB;MainTex_RGB;10;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;410;-3213.577,-275.9638;Inherit;False;Property;_MainTex_Alpha;MainTex_Alpha;11;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;315;-3411.188,-625.3619;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.StaticSwitch;349;-4221.471,-922.6723;Inherit;False;Property;_Distortion_Switch;Distortion_Switch;23;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;434;-4448.897,-893.4631;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;346;-5129.679,-308.1115;Inherit;False;Property;_MTex_ImageClampV;M.Tex_ImageClampV;6;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;341;-5540.412,-306.8063;Inherit;False;FLOAT;1;1;2;3;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;343;-5376.492,-279.9272;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;431;-2702.427,-618.1992;Inherit;False;Property;_MRefine;M.Refine;7;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;347;-4808.579,-379.1641;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;330;-4637.87,-335.942;Inherit;False;FX_Rotator;0;;98;e5de1de77a1fcb046bd822e82ac5d69e;0;2;7;FLOAT2;0,0;False;8;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-4949.026,-174.0947;Inherit;False;Property;M_RotateValue;M_RotateValue;15;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;2479.358,201.0172;Float;False;True;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;FX_DefaultShader_V.1.4;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;2;True;_CullMode;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;True;True;2;5;True;_src;10;False;_Dst;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_ZWirteMode;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;23;Surface;1;639055965288897449;  Blend;0;639098659892548244;Two Sided;0;639128933683706388;Forward Only;0;639125409655268324;Cast Shadows;0;0;  Use Shadow Threshold;0;0;Receive Shadows;0;0;GPU Instancing;0;0;LOD CrossFade;0;0;Built-in Fog;0;0;DOTS Instancing;0;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;False;True;False;False;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.SimpleAddOpNode;404;2161.785,158.6219;Inherit;False;4;4;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;452;651.8132,-827.984;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;451;402.3221,-811.4009;Inherit;False;Property;_Screen_Intensity;Screen_Intensity;65;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;450;909.9594,-799.5756;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GrabScreenPosition;449;687.2119,-673.4844;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;453;1054.372,-764.019;Inherit;False;Global;_GrabScreen0;Grab Screen 0;55;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;455;1249.726,-602.5434;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;454;1432.725,-756.6854;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ToggleSwitchNode;459;1615.433,-641.8167;Inherit;False;Property;_Screen_ADD;Screen_ADD;66;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;461;1844.228,-626.5664;Inherit;False;Property;_Screen_Distortion;Screen_Distortion;64;0;Create;True;0;0;0;False;1;Header(ScreenDistortion);False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-562.5107,-411.012;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;428;-780.6484,-381.2948;Inherit;False;Constant;_Float11;Float 11;52;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;86;-7772.962,-274.4411;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;87;-7769.63,-449.6829;Inherit;False;Property;_MUV_Scroll;M.UV_Scroll;4;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;92;-7824.923,-608.3751;Inherit;False;0;10;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;472;-6668.104,-289.7219;Inherit;False;Property;_PolarOffset;PolarOffset;18;0;Create;True;0;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch;82;-7069.419,-559.5;Inherit;False;Property;_MUV_Scroll_Custom1_XY;M.UV_Scroll_Custom1_XY;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Custom1_Off;Custom1_On_XY;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;84;-7431.175,-576.7369;Inherit;False;FX_UV_Scroll;-1;;99;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,0;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.FunctionNode;83;-7463.643,-406.0357;Inherit;False;FX_UV_Scroll;-1;;100;9376bb3fcf8e3d74cb4c5a371b5756f1;1,17,1;5;9;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;FLOAT2;0,0;False;12;FLOAT2;0,0;False;13;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;16
Node;AmplifyShaderEditor.RangedFloatNode;474;-6678.879,-452.2925;Inherit;False;Property;_Radial_Scale;Radial_Scale;19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;473;-6684.935,-381.6548;Inherit;False;Property;_Length_Scale;Length_Scale;17;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;475;-6706.696,-573.9708;Inherit;False;Property;_Polar_CenterUV;Polar_CenterUV;20;0;Create;True;0;0;0;False;0;False;0.5,0.5;0.5,0.5;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;468;-6113.651,-393.0745;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;465;-6454.813,-486.2419;Inherit;False;Polar Coordinates;-1;;101;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;1;False;4;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ToggleSwitchNode;464;-5942.565,-468.4333;Inherit;False;Property;_MainTex_PolarCoord;MainTex_PolarCoord;16;0;Create;True;0;0;0;False;1;Header(PoolarCoord);False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;477;-5001.148,-1075.79;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-4755.653,-982.8201;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;354;-5499.957,370.536;Inherit;False;351;Distortion;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-5358.317,-940.062;Inherit;False;Property;_DIntensity;D.Intensity;25;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;478;-5532.352,470.6734;Inherit;False;Property;_Mask_Distort_Value;Mask_Distort_Value;30;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;479;-6946.768,1507.066;Inherit;False;Property;_Dissolve_Distort_Value;Dissolve_Distort_Value;38;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;480;-533.8414,3204.819;Inherit;False;Property;_Vertex_Distort_Value;Vertex_Distort_Value;63;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;323;-1727.257,-777.8055;Inherit;False;Property;_MTex_RGB;M.Tex_RGB;12;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Tex;RGB_Tex;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;484;-1640.006,-1149.713;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;482;-1783.203,-1093.353;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;489;248.1263,1562.689;Inherit;False;488;AddMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;135;-30.47893,2804.515;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;492;-0.8310686,2648.151;Inherit;False;Property;_VetexDir;VetexDir;61;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;493;242.3716,2750.95;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;494;-759.7605,3507.534;Inherit;False;2134.032;482.3044;;14;505;497;498;514;508;522;509;523;513;502;504;501;500;524;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;508;967.2,3555.582;Inherit;False;Constant;_Float13;Float 13;68;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;429;548.8489,450.8181;Inherit;False;Property;_MColor_Intensity;M.Color_Intensity;9;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;426;768.451,252.2208;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;498;-656.7119,3779.515;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;497;-689.9708,3629.426;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;173;2080.771,744.1775;Inherit;False;172;VertexDisplavement;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;500;-459.3608,3723.425;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;501;-330.4567,3723.191;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;513;56.92972,3705.229;Inherit;False;Property;_Rim_OneMinus;Rim_OneMinus;55;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;502;-85.5196,3652.548;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;524;-214.6043,3718.446;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;505;28.01932,3830.62;Inherit;False;Property;_Fresnel_Range;Fresnel_Range;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;523;665.77,3716.802;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;522;861.6743,3682.714;Inherit;False;Fresnel;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;514;1141.038,3557.35;Inherit;False;Property;_Fresnel;Fresnel;54;0;Create;True;0;0;0;False;2;______________________________________________________________________________________________________________________;Header(Fresnel);False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;509;409.7391,3789.406;Inherit;False;Property;_Frenel_Color;Frenel_Color;56;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;125;-3919.057,1705.379;Inherit;False;Property;_DEdge_Color;D.Edge_Color;44;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,0.9094239,0.7830188,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;389;-3636.333,1783.373;Inherit;False;4;4;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;491;687.5072,2438.301;Inherit;False;Property;_ZWirteMode;ZWirteMode;69;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;339;688.2777,2351.236;Inherit;False;Property;_CullMode;CullMode;68;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;485;-1351.102,-319.7749;Inherit;False;Property;_MTex_RGB1;M.Tex_RGB;12;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;Tex;RGB_Tex;Reference;323;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;180;260.4598,1828.958;Inherit;False;178;Mask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;488;-2829.868,723.1904;Inherit;False;AddMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;486;-3223.896,684.5066;Inherit;True;Property;_AddMask;Add Mask;35;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.SaturateNode;443;-2176.907,645.6758;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;178;-2014.063,643.0278;Inherit;False;Mask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;200;-5755.427,2458.52;Inherit;False;Property;_DirectionSmoothness;Direction Smoothness;51;0;Create;True;0;0;0;False;0;False;0.3282696;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;196;-5618.94,2350.126;Inherit;False;Constant;_2;1;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;268;-5161.35,2507.696;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;269;-4994.11,2470.158;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;266;-4618.809,1805.33;Inherit;False;Property;_DEdge_Width;D.Edge_Width;46;0;Create;True;0;0;0;False;0;False;0.01;-0.01;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;265;-5887.793,2500.631;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;525;-6210.628,2553.853;Inherit;False;Property;_DDirection_Width;D.Direction_Width;50;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;504;268.6813,3722.374;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;378;-3222.854,1809.508;Inherit;False;Property;_Dissolve;Dissolve;39;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;Off;Smoothness;Step;DirectionDissolve;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;379;-3376.964,1614.206;Inherit;False;Constant;_Float9;Float 9;50;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;433;-3194.998,1980.001;Inherit;False;Property;_Keyword0;Keyword 0;39;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;378;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-6444.335,2280.32;Inherit;False;Property;_DissolveFloat;Dissolve_Intensity;49;0;Create;False;1;UV Mask;0;0;False;0;False;0.4526118;0.6553627;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;392;-4691.15,2279.694;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;393;-4701.678,2385.117;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;394;-4494.282,2323.387;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;240;-5620.723,2102.825;Inherit;False;Property;_UVMaskDirection;UV Mask Direction;47;0;Create;True;0;0;0;False;1;Header(Dir.Dissolve);False;0;0;0;True;;KeywordEnum;4;U_Pos;U_Neg;V_Pos;V_Neg;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;99;-5932.263,-1262.612;Inherit;False;0;101;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;244;-6445.027,2380.345;Inherit;False;3;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;528;-5642.891,-927.6161;Inherit;False;3;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;529;-5076.109,-931.9622;Inherit;False;Property;_Distortion_Custom2_Z;Distortion_Custom2_Z;24;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
WireConnection;121;9;332;0
WireConnection;121;18;124;0
WireConnection;120;1;52;0
WireConnection;120;0;121;0
WireConnection;52;9;332;0
WireConnection;52;1;66;0
WireConnection;156;1;448;0
WireConnection;156;0;155;2
WireConnection;172;0;146;0
WireConnection;239;0;238;1
WireConnection;197;0;196;0
WireConnection;197;1;200;0
WireConnection;241;0;238;2
WireConnection;199;0;243;0
WireConnection;199;1;197;0
WireConnection;201;0;199;0
WireConnection;201;1;200;0
WireConnection;267;0;265;0
WireConnection;267;1;197;0
WireConnection;198;0;240;0
WireConnection;198;1;199;0
WireConnection;198;2;201;0
WireConnection;243;1;202;0
WireConnection;243;0;244;1
WireConnection;124;0;122;3
WireConnection;124;1;122;4
WireConnection;332;7;357;0
WireConnection;332;8;59;0
WireConnection;355;0;354;0
WireConnection;355;1;478;0
WireConnection;22;0;18;4
WireConnection;22;1;19;4
WireConnection;22;2;180;0
WireConnection;22;3;176;0
WireConnection;22;4;485;0
WireConnection;22;5;378;0
WireConnection;22;6;489;0
WireConnection;371;0;370;0
WireConnection;371;1;372;0
WireConnection;373;0;371;0
WireConnection;373;1;368;0
WireConnection;373;2;374;0
WireConnection;375;0;373;0
WireConnection;375;2;376;0
WireConnection;370;0;118;0
WireConnection;361;0;362;0
WireConnection;361;1;479;0
WireConnection;385;0;381;0
WireConnection;385;1;368;0
WireConnection;387;0;385;0
WireConnection;387;1;386;0
WireConnection;386;0;383;0
WireConnection;386;1;368;0
WireConnection;73;2;74;0
WireConnection;75;1;73;0
WireConnection;75;0;76;0
WireConnection;138;1;395;0
WireConnection;146;1;147;0
WireConnection;146;0;142;0
WireConnection;174;0;75;0
WireConnection;338;0;22;0
WireConnection;338;1;336;0
WireConnection;334;0;333;0
WireConnection;334;1;335;0
WireConnection;336;0;334;0
WireConnection;118;1;34;0
WireConnection;118;0;119;1
WireConnection;139;9;137;0
WireConnection;139;1;140;0
WireConnection;137;0;133;0
WireConnection;137;1;136;0
WireConnection;395;0;139;0
WireConnection;395;1;397;0
WireConnection;142;0;493;0
WireConnection;142;1;138;1
WireConnection;142;2;143;0
WireConnection;357;0;25;0
WireConnection;357;1;355;0
WireConnection;397;0;396;0
WireConnection;397;1;480;0
WireConnection;313;0;309;1
WireConnection;313;1;310;2
WireConnection;313;2;311;3
WireConnection;313;3;310;4
WireConnection;24;1;120;0
WireConnection;425;0;19;1
WireConnection;425;1;19;2
WireConnection;425;2;19;3
WireConnection;427;0;21;0
WireConnection;427;1;425;0
WireConnection;427;2;426;0
WireConnection;427;3;429;0
WireConnection;368;0;367;0
WireConnection;381;0;118;0
WireConnection;381;1;382;0
WireConnection;383;0;381;0
WireConnection;383;1;436;0
WireConnection;436;0;266;0
WireConnection;436;1;435;0
WireConnection;444;0;24;0
WireConnection;444;1;445;0
WireConnection;447;0;446;0
WireConnection;447;1;444;0
WireConnection;448;0;151;0
WireConnection;148;0;447;0
WireConnection;148;1;149;0
WireConnection;148;2;156;0
WireConnection;367;0;29;0
WireConnection;367;1;29;4
WireConnection;29;1;53;0
WireConnection;53;9;364;0
WireConnection;53;1;31;0
WireConnection;331;7;30;0
WireConnection;331;8;62;0
WireConnection;364;0;331;0
WireConnection;364;1;361;0
WireConnection;309;1;308;0
WireConnection;310;1;307;0
WireConnection;303;0;301;0
WireConnection;304;0;303;0
WireConnection;304;1;303;1
WireConnection;305;0;303;2
WireConnection;305;1;303;3
WireConnection;301;0;298;0
WireConnection;301;1;300;0
WireConnection;298;0;299;0
WireConnection;312;0;307;0
WireConnection;312;1;305;0
WireConnection;308;0;307;0
WireConnection;308;1;304;0
WireConnection;307;0;306;0
WireConnection;307;1;315;1
WireConnection;306;0;315;0
WireConnection;306;1;299;0
WireConnection;96;9;99;0
WireConnection;96;1;100;0
WireConnection;101;1;96;0
WireConnection;351;0;477;0
WireConnection;311;1;312;0
WireConnection;430;9;409;0
WireConnection;430;1;431;0
WireConnection;411;0;410;0
WireConnection;342;0;340;0
WireConnection;345;0;340;0
WireConnection;345;1;342;0
WireConnection;340;0;464;0
WireConnection;10;1;349;0
WireConnection;402;0;10;0
WireConnection;402;1;10;4
WireConnection;409;0;402;0
WireConnection;409;1;10;0
WireConnection;410;0;10;4
WireConnection;410;1;402;0
WireConnection;315;0;330;0
WireConnection;349;1;330;0
WireConnection;349;0;434;0
WireConnection;434;0;106;0
WireConnection;434;1;330;0
WireConnection;346;0;341;0
WireConnection;346;1;343;0
WireConnection;341;0;464;0
WireConnection;343;0;341;0
WireConnection;347;0;345;0
WireConnection;347;1;346;0
WireConnection;330;7;347;0
WireConnection;330;8;88;0
WireConnection;1;2;404;0
WireConnection;1;3;338;0
WireConnection;1;5;173;0
WireConnection;404;0;461;0
WireConnection;404;1;427;0
WireConnection;404;2;433;0
WireConnection;404;3;514;0
WireConnection;452;0;451;0
WireConnection;452;1;21;0
WireConnection;452;2;19;4
WireConnection;450;0;452;0
WireConnection;450;1;449;0
WireConnection;453;0;450;0
WireConnection;455;0;453;0
WireConnection;455;1;427;0
WireConnection;454;0;453;0
WireConnection;454;1;427;0
WireConnection;454;2;22;0
WireConnection;459;0;454;0
WireConnection;459;1;455;0
WireConnection;461;1;427;0
WireConnection;461;0;459;0
WireConnection;21;0;323;0
WireConnection;21;1;428;0
WireConnection;21;2;148;0
WireConnection;82;1;84;0
WireConnection;82;0;83;0
WireConnection;84;9;92;0
WireConnection;84;1;87;0
WireConnection;83;9;92;0
WireConnection;83;18;86;0
WireConnection;468;0;82;0
WireConnection;468;1;465;0
WireConnection;468;2;472;0
WireConnection;465;2;475;0
WireConnection;465;3;474;0
WireConnection;465;4;473;0
WireConnection;464;0;82;0
WireConnection;464;1;468;0
WireConnection;477;0;101;0
WireConnection;477;1;101;4
WireConnection;106;0;477;0
WireConnection;106;1;529;0
WireConnection;323;1;430;0
WireConnection;323;0;313;0
WireConnection;484;0;313;0
WireConnection;484;1;482;3
WireConnection;482;0;313;0
WireConnection;493;0;492;0
WireConnection;493;1;135;0
WireConnection;426;0;18;1
WireConnection;426;1;18;2
WireConnection;426;2;18;3
WireConnection;500;0;497;0
WireConnection;500;1;498;0
WireConnection;501;0;500;0
WireConnection;513;0;502;0
WireConnection;513;1;524;0
WireConnection;502;0;524;0
WireConnection;524;0;501;0
WireConnection;523;0;504;0
WireConnection;523;1;509;0
WireConnection;523;2;509;4
WireConnection;522;0;523;0
WireConnection;514;0;508;0
WireConnection;514;1;522;0
WireConnection;389;0;387;0
WireConnection;389;1;125;0
WireConnection;389;2;432;0
WireConnection;389;3;125;4
WireConnection;485;1;411;0
WireConnection;485;0;484;0
WireConnection;488;0;486;0
WireConnection;443;0;148;0
WireConnection;178;0;443;0
WireConnection;268;0;267;0
WireConnection;268;1;200;0
WireConnection;269;0;240;0
WireConnection;269;1;267;0
WireConnection;269;2;268;0
WireConnection;265;0;243;0
WireConnection;265;1;525;0
WireConnection;504;0;513;0
WireConnection;504;1;505;0
WireConnection;378;1;379;0
WireConnection;378;0;375;0
WireConnection;378;2;385;0
WireConnection;378;3;394;0
WireConnection;433;2;389;0
WireConnection;392;0;198;0
WireConnection;392;1;368;0
WireConnection;393;0;269;0
WireConnection;393;1;368;0
WireConnection;394;0;392;0
WireConnection;394;1;393;0
WireConnection;240;1;238;1
WireConnection;240;0;239;0
WireConnection;240;2;238;2
WireConnection;240;3;241;0
WireConnection;529;1;95;0
WireConnection;529;0;528;3
ASEEND*/
//CHKSM=4C5022D68437D7D3A63552AE94E4B3CA5FA9C4DE