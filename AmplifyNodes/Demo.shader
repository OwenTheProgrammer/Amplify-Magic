// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TestingGrounds"
{
	Properties
	{
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#endif//ASE Sampling Macros

		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv2_texcoord2;
			float3 worldPos;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _VRChatCameraMode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_RNM0);
		SamplerState sampler_RNM0;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_RNM1);
		SamplerState sampler_RNM1;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_RNM2);
		SamplerState sampler_RNM2;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float smoothness11_g1044 = 0.5;
			float perceptualRoughness82_g1044 = ( 1.0 - smoothness11_g1044 );
			float temp_output_1_0_g1069 = perceptualRoughness82_g1044;
			float roughness85_g1044 = ( temp_output_1_0_g1069 * temp_output_1_0_g1069 );
			float temp_output_1_0_g1046 = roughness85_g1044;
			float temp_output_7_0_g1045 = ( temp_output_1_0_g1046 * temp_output_1_0_g1046 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float3 worldNormal17_g1044 = ase_normWorldNormal;
			float2 lightmapUV15_g1044 = (i.uv2_texcoord2*(unity_LightmapST).xy + (unity_LightmapST).zw);
			float2 lightmapUV22_g1071 = lightmapUV15_g1044;
			float2 uv14_g1072 = lightmapUV22_g1071;
			float4 temp_output_1_0_g1074 = unity_LightmapST;
			float3 lightmap_nL138_g1044 = ( ( (SAMPLE_TEXTURE2D( unity_LightmapInd, samplerunity_Lightmap, ( ( uv14_g1072 * (temp_output_1_0_g1074).xy ) + (temp_output_1_0_g1074).zw ) )).rgb * 2.0 ) - 1.0 );
			float3 normalizeResult67_g1044 = normalize( lightmap_nL138_g1044 );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 viewDir13_g1044 = ase_worldViewDir;
			float3 normalizeResult71_g1044 = normalize( ( normalizeResult67_g1044 + viewDir13_g1044 ) );
			float3 halfDir72_g1044 = normalizeResult71_g1044;
			float dotResult76_g1044 = dot( worldNormal17_g1044 , halfDir72_g1044 );
			float ndoth78_g1044 = saturate( dotResult76_g1044 );
			float ndoth11_g1045 = ndoth78_g1044;
			float temp_output_15_0_g1045 = ( ( ndoth11_g1045 * ( ( ndoth11_g1045 * temp_output_7_0_g1045 ) - ndoth11_g1045 ) ) + 1.0 );
			float spec88_g1044 = ( ( temp_output_7_0_g1045 * 0.3183099 ) / ( ( temp_output_15_0_g1045 * temp_output_15_0_g1045 ) + 1E-07 ) );
			float2 uv14_g1080 = lightmapUV22_g1071;
			float4 temp_output_1_0_g1081 = unity_LightmapST;
			float3 decodeLightMap8_g1071 = DecodeLightmap(SAMPLE_TEXTURE2D( unity_Lightmap, samplerunity_Lightmap, ( ( uv14_g1080 * (temp_output_1_0_g1081).xy ) + (temp_output_1_0_g1081).zw ) ));
			float3 lightmap_L037_g1044 = decodeLightMap8_g1071;
			float3 L020_g1060 = lightmap_L037_g1044;
			float3 nL112_g1089 = lightmap_nL138_g1044;
			float3 L011_g1089 = lightmap_L037_g1044;
			float3 temp_output_6_0_g1089 = ( L011_g1089 * 2.0 );
			float3 LC_L1x94_g1044 = ( (nL112_g1089).x * temp_output_6_0_g1089 );
			float3 L1x18_g1060 = LC_L1x94_g1044;
			float3 Direction19_g1060 = lightmap_nL138_g1044;
			float3 LC_L1y95_g1044 = ( (nL112_g1089).y * temp_output_6_0_g1089 );
			float3 L1y22_g1060 = LC_L1y95_g1044;
			float3 LC_L1z96_g1044 = ( (nL112_g1089).z * temp_output_6_0_g1089 );
			float3 L1z25_g1060 = LC_L1z96_g1044;
			float3 temp_output_9_0_g1060 = ( L020_g1060 + ( L1x18_g1060 * (Direction19_g1060).x ) + ( L1y22_g1060 * (Direction19_g1060).y ) + ( L1z25_g1060 * (Direction19_g1060).z ) );
			float3 temp_cast_1 = (0.0).xxx;
			float3 specularSH146_g1044 = max( ( spec88_g1044 * temp_output_9_0_g1060 ) , temp_cast_1 );
			float4 temp_cast_3 = (0.04).xxxx;
			float4 color9_g1044 = IsGammaSpace() ? float4(0.3481636,0.3326806,0.7924528,0) : float4(0.09939151,0.09047569,0.5911142,0);
			float4 albedo10_g1044 = float4( color9_g1044.rgb , 0.0 );
			float metallic8_g1044 = 0.5;
			float4 lerpResult116_g1044 = lerp( temp_cast_3 , albedo10_g1044 , metallic8_g1044);
			float4 specularColor117_g1044 = lerpResult116_g1044;
			float3 break5_g1047 = specularColor117_g1044.rgb;
			float grazingTerm140_g1044 = saturate( ( max( max( break5_g1047.x , break5_g1047.y ) , break5_g1047.z ) + smoothness11_g1044 ) );
			float4 temp_cast_6 = (grazingTerm140_g1044).xxxx;
			float dotResult125_g1044 = dot( worldNormal17_g1044 , viewDir13_g1044 );
			float nv128_g1044 = ( 1.0 - saturate( dotResult125_g1044 ) );
			float fresnel131_g1044 = pow( nv128_g1044 , 5.0 );
			float4 lerpResult141_g1044 = lerp( specularColor117_g1044 , temp_cast_6 , fresnel131_g1044);
			float4 temp_cast_7 = (0.0).xxxx;
			float4 temp_output_148_0_g1044 = max( ( float4( specularSH146_g1044 , 0.0 ) * lerpResult141_g1044 ) , temp_cast_7 );
			o.Emission = temp_output_148_0_g1044.rgb + 1E-5;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows noforwardadd 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv2_texcoord2;
				o.customPack1.xy = v.texcoord1;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv2_texcoord2 = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19501
Node;AmplifyShaderEditor.CommentaryNode;329;-2912,688;Inherit;False;1326.3;604.3003;_Coordinate Mapping/Repeat Domain;9;351;322;325;324;315;350;451;463;469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;291;-1296,736;Inherit;False;1768;616;_2D Shape/Realize SDF;13;296;293;292;295;269;268;263;265;273;271;285;297;380;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;121;-4208,64;Inherit;False;856.8926;617.2144;_Coordinate Mapping/UV Padding;6;112;106;108;352;354;118;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;619;528,-2976;Inherit;False;1215;304;_LightingFunctions/SH;4;615;616;617;618;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;614;144,-2976;Inherit;False;378;304;_LightingModels/GGXLight;1;613;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;612;1120,-2656;Inherit;False;929;723;_LightingModels/ ()NDF;8;605;608;604;607;606;610;609;611;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;602;1744,-2976;Inherit;False;388;304;_LightingFunctions/SchlickFresnell;1;601;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;600;-176,-2352;Inherit;False;388;304;_LightingFunctions/ReflectDirection;1;599;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;598;208,-2656;Inherit;False;897.1;692.7;_LightingFunctions/()dot();7;603;597;594;592;596;593;595;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;591;-160,-2976;Inherit;False;292;304;_LightingFunctions/HalfDirection;1;590;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;589;-160,-2656;Inherit;False;369;304;_ShadowFunctions/GGX GSF;1;587;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;586;1040,-1568;Inherit;False;424;277;_AmplifyBakery/SmoothnessToPerceptualRoughness;1;585;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;584;1040,-1888;Inherit;False;324;304;_AmplifyBakery/SHEvaluateL1Diffuse;1;583;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;582;1376,-1888;Inherit;False;420;304;_AmplifyBakery/PerceptualRoughnessToRoughness;1;580;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;579;1056,-1264;Inherit;False;420;304;_AmplifyBakery/PerceptualRoughnessToMipmapLevel;1;578;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;577;1488,-1584;Inherit;False;356;328;_AmplifyBakery/CombineSHTerms;1;576;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;575;1360,-928;Inherit;False;344;376;_AmplifyBakery/BakerySH4Luma;1;574;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;573;1712,-928;Inherit;False;359;352;_AmplifyBakery/BakerySH4LightContribution;1;572;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;571;1024,-928;Inherit;False;328;379;_AmplifyBakery/BakerySampleSHMatrix;1;570;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;569;1488,-1248;Inherit;False;406;304;_AmplifyBakery/BakeryReadLightmap;1;568;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;563;624,-928;Inherit;False;388;328;_AmplifyBakery/BakeryMonoSHLightContribution;1;562;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;561;240,-928;Inherit;False;375;304;_AmplifyBakery/BakeryLumaClamp;1;560;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;559;672,-1888;Inherit;False;356;304;_AmplifyBakery/BakeryDecodeLightmapRNM;1;558;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;557;624,-1248;Inherit;False;422;304;_AmplifyBakery/SampleRNMX;1;556;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;555;304,-1248;Inherit;False;297;304;_AmplifyBakery/SampleL1;1;554;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;553;-64,-928;Inherit;False;292;304;_AmplifyBakery/LightmapUV;1;551;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;550;-64,-1248;Inherit;False;342;304;_AmplifyBakery/GGXTerm;1;548;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;540;-64,-1888;Inherit;False;356;304;_AmplifyBakery/BakerySH;1;539;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;530;-2128,-1920;Inherit;False;324;187;_Utils/Transform Properties;1;529;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;528;-2464,-1920;Inherit;False;324;304;_Utils/Blackbody Approximation;1;527;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;526;-2800,-1920;Inherit;False;324;304;_Utils/ACES Approximation;1;525;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;524;-608,-1904;Inherit;False;484;328;_Unity Globals/Reflection Probe Data;1;523;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;522;-1600,-1904;Inherit;False;484;427;_Unity Globals/Lightmap Data;1;521;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;520;-1104,-1568;Inherit;False;388;187;_Unity Globals/Decode HDR;1;519;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;518;-1904,-512;Inherit;False;394;328;_Math Utils/Direction to Signed Cube;1;517;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;516;-3136,-1696;Inherit;False;244;164;_Extensions/Sort 3;1;515;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;514;-3136,-1520;Inherit;False;257;160;_Extensions/Sort 2;1;513;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;512;-3456,-1520;Inherit;False;292;163;_Extensions/Min Index 3;1;511;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;510;-3760,-1520;Inherit;False;292;163;_Extensions/Min Index 2;1;509;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;508;-3456,-1696;Inherit;False;292;163;_Extensions/Max Index 3;1;507;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;506;-3760,-1696;Inherit;False;292;163;_Extensions/Max Index 2;1;505;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;504;-3424,-1920;Inherit;False;324;211;_Extensions/Generic Min;1;503;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;502;-3760,-1920;Inherit;False;324;211;_Extensions/Generic Max;1;501;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;499;-3904,1360;Inherit;False;292;328;_Coordinate Mapping/UV to Tunnel;1;531;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;496;-2512,-1552;Inherit;False;842;304;_Coordinate Mapping/ST Remapping;3;493;495;494;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;492;-2496,1344;Inherit;False;324;304;_Coordinate Mapping/Spherical Coordinates;1;491;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;490;-4272,1024;Inherit;False;341;304;_Coordinate Mapping/Sample Pixel in Middle;1;489;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;487;-2864,1344;Inherit;False;361;328;_Coordinate Mapping/Project To Box;1;486;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;485;-3248,1360;Inherit;False;349;328;_Coordinate Mapping/Box Side Mask;1;484;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;481;-1104,-1904;Inherit;False;484;328;_Unity Globals/Reflection Probe Data;1;480;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;478;-1712,-848;Inherit;False;552;304;_Utils/RGB to BW;2;476;477;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;416;-3968,-528;Inherit;False;757;363;_Utils/Smooth Lerp;5;407;406;413;415;411;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;398;-2144,-1232;Inherit;False;816;276;_Shader Trixx/ Pixelate (AA);2;395;397;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;373;-2576,-512;Inherit;False;307;285;_Math Utils/Smooth Min;1;460;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;371;-2224,-512;Inherit;False;297;276;_Math Utils/Smooth Max;1;461;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;363;-2576,-848;Inherit;False;221;269;_Math Utils/Filtered Cosine;1;453;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;350;-2560,1008;Inherit;False;756;280;Demo Colours;5;343;344;345;347;462;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;320;-4208,688;Inherit;False;380;304;_Coordinate Mapping/Rotate UV;1;319;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;309;496,736;Inherit;False;933.8081;459;_2D Shapes/Round Out Shape;5;300;307;306;308;379;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;285;-1232,992;Inherit;False;629;244;Crazy Lerp Mask;7;274;277;278;281;280;279;283;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;147;-1440,288;Inherit;False;917;388;_2D Shapes/Line Shape;5;253;254;262;261;473;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;252;-1296,-32;Inherit;False;673;304;_2D Shapes/Grid Anti Aliased;3;245;247;251;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;242;48,-400;Inherit;False;1104.27;660.6033;_2D Shapes/Combine SDFs;8;241;215;214;216;239;221;238;459;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;207;-1200,-400;Inherit;False;910.9182;325.3818;_2D Shapes/Circle Normal Map;6;197;206;204;200;203;236;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;194;-272,-400;Inherit;False;297;286;_2D Shapes/Checkers Anti Aliased;1;243;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;190;976,288;Inherit;False;336;285;_2D Shapes/Analytical Dot Matrix;1;455;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;182;-2704,64;Inherit;False;1098;531;_Coordinate Mapping/UV Remapping;7;174;175;176;177;178;181;180;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;173;-3920,1024;Inherit;False;982;321;_Coordinate Mapping/Project to Square;6;157;234;172;159;160;158;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;155;-464,288;Inherit;False;1044.621;328.6392;_2D Shapes/Make Annular;3;298;299;378;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;131;-3344,64;Inherit;False;614;498;_Coordinate Mapping/Smooth UV Grid;3;132;130;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;118;-3856,112;Inherit;False;495.8215;338.6786;Padding Viewer;2;120;117;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;84;-2080,-848;Inherit;False;365;322;_Utils/Square Wave;1;458;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;34;-3808,688;Inherit;False;873.442;323.9419;_Coordinate Mapping/Point on Circle;5;28;235;94;111;49;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-2336,-848;Inherit;False;234.8733;286;_Math Utils/Smoothstep 10;1;456;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;14;-560,-64;Inherit;False;586;320;_2D Shapes/Circle Shape;3;4;5;50;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;544;304,-1568;Inherit;False;356;307;_AmplifyBakery/BakerySpecularSHFull;1;545;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;424;-3072,-1248;Inherit;False;324;259;_VRChat/Mirror Info;1;431;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;422;-3808,-1008;Inherit;False;312;256;_VRChat/CameraMode;1;428;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;420;-3474,-1250;Inherit;False;388;547;_VRChat/Camera Mask;1;429;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;418;-3792,-1248;Inherit;False;292;235;_VRChat/Camera Info;1;474;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;388;-2512,-1232;Inherit;False;356;331;_Shader Trixx/VR Info;1;448;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;547;672,-1568;Inherit;False;356;304;_AmplifyBakery/DirectionalSpecular;1;567;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;542;-64,-1584;Inherit;False;356;328;_AmplifyBakery/BakerySpecularMonoSHFull;1;566;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;538;304,-1888;Inherit;False;357;304;_AmplifyBakery/BakeryMonoSH;1;565;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;397;-1616,-1184;Inherit;True;Property;_TextureSample2;Texture Sample 2;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode;395;-2128,-1184;Inherit;True;Property;_Texture1;Texture 1;665;0;Create;True;0;0;0;False;0;False;e86ba70d2363b9443beac28a6a370b87;e86ba70d2363b9443beac28a6a370b87;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;126;-3040,304;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Derivative;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;117;-3840,160;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;130;-3296,128;Inherit;True;Property;_MainTex;_MainTex;90;0;Create;True;0;0;0;False;0;False;None;None;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;174;-2224,304;Inherit;False;UV Remapping;-1;;146;bab65971de611394b9eb077788fe7541;0;5;6;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;1,0;False;3;FLOAT2;0,1;False;4;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;175;-2656,304;Inherit;False;Constant;_Vector4;Vector 4;2;0;Create;True;0;0;0;False;0;False;0.24,0.44;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;176;-2656,432;Inherit;False;Constant;_Vector5;Vector 5;2;0;Create;True;0;0;0;False;0;False;0.16,0.17;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;177;-2480,432;Inherit;False;Constant;_Vector6;Vector 6;2;0;Create;True;0;0;0;False;0;False;0.6,0.1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;178;-2480,304;Inherit;False;Constant;_Vector7;Vector 7;2;0;Create;True;0;0;0;False;0;False;0.88,0.67;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;319;-4160,736;Inherit;True;Rotate UV;-1;;248;1728e361aec8a4346b634bc2d31abb4f;0;2;1;FLOAT2;0,0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;158;-3488,1088;Inherit;False;UV Padding;-1;;249;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;160;-3248,1072;Inherit;True;Circle Shape;-1;;250;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.5;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.RangedFloatNode;159;-3392,1184;Inherit;False;Constant;_Float3;Float 3;2;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;172;-3728,1072;Inherit;False;Project to Square;-1;;252;591e16f969798b345b6286c68fc838a2;0;1;1;FLOAT2;0,0;False;3;FLOAT;0;FLOAT2;11;FLOAT2;17
Node;AmplifyShaderEditor.FunctionNode;234;-3792,1200;Inherit;False;Point on Circle;-1;;253;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.SimpleTimeNode;157;-3904,1120;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;49;-3248,736;Inherit;True;Circle Shape;-1;;254;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.5;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.RangedFloatNode;94;-3424,848;Inherit;False;Constant;_CircleRadius;Circle Radius;0;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;28;-3792,848;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;111;-3488,752;Inherit;False;UV Padding;-1;;256;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;235;-3792,752;Inherit;False;Point on Circle;-1;;257;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-3840,240;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;354;-4032,240;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;352;-4176,240;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FractNode;108;-3520,464;Inherit;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-3664,464;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;4,4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;112;-3904,464;Inherit;False;UV Padding;-1;;258;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;180;-2176,112;Inherit;True;Property;_Texture0;Texture 0;664;0;Create;True;0;0;0;False;0;False;None;None;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;181;-1904,112;Inherit;True;Property;_TextureSample1;Texture Sample 1;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;132;-3328,320;Inherit;True;Smooth UV Grid;-1;;259;97583f406bc6ec545adaf71cae9af065;0;2;1;FLOAT2;0,0;False;2;FLOAT2;16,16;False;3;FLOAT2;0;FLOAT2;13;FLOAT2;18
Node;AmplifyShaderEditor.ColorNode;407;-3712,-480;Inherit;False;Constant;_Color3;Color 3;4;0;Create;True;0;0;0;False;0;False;0.9843137,0,0.3529412,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;406;-3920,-480;Inherit;False;Constant;_Color2;Color 2;4;0;Create;True;0;0;0;False;0;False;0.2,0.7215686,0.9843137,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SinOpNode;413;-3760,-304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;415;-3648,-304;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;411;-3920,-304;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-1120,-256;Inherit;False;Constant;_Float7;Float 7;3;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;5;-528,16;Inherit;False;Constant;_Vector0;Vector 0;0;0;Create;True;0;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;4;-528,144;Inherit;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;236;-1152,-352;Inherit;False;Point on Circle;-1;;312;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.FunctionNode;203;-832,-336;Inherit;False;UV Padding;-1;;313;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;245;-944,16;Inherit;True;Grid Anti Aliased;-1;;317;78e8261f160bf9f45b077ddb8c6055b0;0;4;1;FLOAT2;0,0;False;3;FLOAT;0.9;False;22;FLOAT2;4,4;False;23;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;247;-1248,16;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;-1104,32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;239;576,-320;Inherit;False;UV Padding;-1;;320;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;214;832,-336;Inherit;True;Circle Shape;-1;;321;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.1;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;215;496,-96;Inherit;True;Circle Shape;-1;;323;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.1;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.RangedFloatNode;216;304,-176;Inherit;False;Constant;_Float8;Float 8;3;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;238;272,-336;Inherit;False;Point on Circle;-1;;325;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.SimpleTimeNode;221;96,-336;Inherit;False;1;0;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;50;-288,-16;Inherit;True;Circle Shape;-1;;327;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.5;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.SimpleTimeNode;271;-1232,816;Inherit;False;1;0;FLOAT;2.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CosOpNode;273;-1056,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;265;-752,816;Inherit;False;FLOAT2;4;0;FLOAT;0.5;False;1;FLOAT;0.5;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;283;-1232,1040;Inherit;False;1;0;FLOAT;0.284;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;279;-768,1040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;280;-944,1040;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;281;-1056,1040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;278;-1232,1120;Inherit;False;2;2;0;FLOAT;8;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;277;-1088,1120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;274;-768,1136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;268;-944,816;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.2;False;4;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;269;-224,784;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;293;-48,1168;Inherit;False;Constant;_Color1;Color 1;3;0;Create;True;0;0;0;False;0;False;0.9607843,0.07058824,0.3254902,1;0,0,0,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;292;-240,1168;Inherit;False;Constant;_Color0;Color 0;3;0;Create;True;0;0;0;False;0;False;0.2,0.7215686,0.9843137,1;0,0,0,0;False;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TFHCRemapNode;299;48,416;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.02;False;4;FLOAT;0.07;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;296;256,784;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;295;-224,1040;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GammaToLinearNode;297;-48,1040;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SinTimeNode;298;-432,448;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;300;848,784;Inherit;True;Round Out Shape;-1;;329;2ed1b10728f615d4a82c2edfafee3732;0;2;1;FLOAT;0;False;2;FLOAT;0.16;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;307;992,1008;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;306;832,1008;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;308;688,1040;Inherit;False;Constant;_Float4;Float 4;3;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;263;-544,784;Inherit;True;Circle Shape;-1;;330;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.2;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;378;272,352;Inherit;True;Make Annular;-1;;338;3505ed6aa0eeda045b3e3cf3100ae1c6;0;2;1;FLOAT;0;False;2;FLOAT;0.02;False;3;FLOAT;0;FLOAT;7;FLOAT;8
Node;AmplifyShaderEditor.FunctionNode;379;1152,784;Inherit;True;Realize SDF;-1;;340;95f36825f6dd0604ca1e8f628c37f9c2;0;2;1;FLOAT;0;False;2;FLOAT;0;False;2;FLOAT;0;FLOAT;5
Node;AmplifyShaderEditor.FunctionNode;380;0,784;Inherit;True;Realize SDF;-1;;342;95f36825f6dd0604ca1e8f628c37f9c2;0;2;1;FLOAT;0;False;2;FLOAT;0;False;2;FLOAT;0;FLOAT;5
Node;AmplifyShaderEditor.FunctionNode;449;-1904,-1184;Inherit;True;Pixelate (AA);661;;390;bb0fdc552a56b294cb3a97cf188309c6;0;2;8;SAMPLER2D;;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;450;-3488,-480;Inherit;True;Smooth Lerp;-1;;392;2b076f1368a1dad458b20e5f0c213538;0;3;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;452;-3136,-480;Inherit;True;Stairstep (Terracing);-1;;397;877080732b544ff4e9dddc86474cf10e;0;2;1;FLOAT2;0,0;False;2;FLOAT;8;False;2;FLOAT2;0;FLOAT2;7
Node;AmplifyShaderEditor.FunctionNode;454;-944,1136;Inherit;False;Smoothstep 10;-1;;399;c24375f1f1f682347bf1da27344b5d59;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;315;-2768,736;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;324;-2896,896;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;325;-2736,928;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;322;-2768,816;Inherit;False;1;0;FLOAT;90;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;451;-2560,736;Inherit;True;Repeat Domain;-1;;414;51a921dc32a4b1e44b5115fb70691db9;0;6;8;FLOAT2;4,4;False;9;FLOAT2;0,0;False;10;FLOAT2;0,0;False;17;FLOAT2;0.5,0.5;False;11;FLOAT;0;False;15;FLOAT;0;False;2;FLOAT2;0;FLOAT2;54
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;347;-2544,1056;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;345;-2416,1056;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;2;False;2;COLOR;0.2,0.7215686,0.9843137,1;False;3;COLOR;0.9843137,0.8509804,0.3529412,1;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;344;-2288,1056;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;COLOR;0.0627451,0.9882353,0.6588235,1;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;343;-2160,1056;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0.9607843,0.07058824,0.3254902,1;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SwizzleNode;463;-2688,1056;Inherit;False;FLOAT;0;1;2;3;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;351;-1776,784;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;464;-3680,160;Inherit;True;Square Shape;-1;;420;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;5;FLOAT2;0.25,0.25;False;3;FLOAT;52;FLOAT;0;FLOAT;50
Node;AmplifyShaderEditor.FunctionNode;465;-288,352;Inherit;True;Square Shape;-1;;422;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;5;FLOAT2;0.25,0.25;False;3;FLOAT;52;FLOAT;0;FLOAT;50
Node;AmplifyShaderEditor.FunctionNode;466;-544,1056;Inherit;True;Square Shape;-1;;424;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;5;FLOAT2;0.25,0.25;False;3;FLOAT;52;FLOAT;0;FLOAT;50
Node;AmplifyShaderEditor.FunctionNode;467;544,800;Inherit;True;Square Shape;-1;;426;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;5;FLOAT2;0.25,0.25;False;3;FLOAT;52;FLOAT;0;FLOAT;50
Node;AmplifyShaderEditor.FunctionNode;468;640,336;Inherit;True;Square Shape;-1;;428;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;5;FLOAT2;0.25,0.25;False;3;FLOAT;52;FLOAT;0;FLOAT;50
Node;AmplifyShaderEditor.FunctionNode;455;992,352;Inherit;True;Analytical Dot Matrix;-1;;432;b7436b6dab7aad14d8c1bd50d43c5c69;0;2;2;FLOAT2;0,0;False;1;FLOAT2;16,16;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;241;528,176;Inherit;False;Constant;_Float9;Float 9;3;0;Create;True;0;0;0;False;0;False;-0.03;0;-0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;459;848,-64;Inherit;True;Combine SDFs;-1;;437;4b4969416de73314ebd94b9fb8fe7c3a;0;3;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;2;FLOAT;17;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;243;-240,-352;Inherit;True;Checkers Anti Aliased;-1;;439;aac1f3acf1f39104aa2463a59dfeaa49;0;3;1;FLOAT2;0,0;False;3;FLOAT2;8,8;False;50;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;200;-544,-336;Inherit;True;Circle Normal Map;-1;;442;d8f444558408a464c8e559d7077a6f89;0;3;1;FLOAT2;0,0;False;27;FLOAT2;0.5,0.5;False;25;FLOAT;0.5;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;204;-960,-256;Inherit;False;2;0;FLOAT;0.5;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;197;-736,-224;Inherit;False;Constant;_Float6;Float 6;3;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;254;-1088,368;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;253;-1232,336;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;262;-1424,496;Inherit;False;1;0;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;261;-1248,496;Inherit;False;Point on Circle;-1;;443;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.GammaToLinearNode;462;-2016,1056;Inherit;True;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;469;-2192,736;Inherit;True;Square Shape;-1;;464;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;5;FLOAT2;0.5,0.5;False;3;FLOAT;52;FLOAT;0;FLOAT;50
Node;AmplifyShaderEditor.FunctionNode;477;-1360,-800;Inherit;True;RGB to BW;-1;;472;0fddb491295b9a34d96857bb21288b49;0;1;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;484;-3200,1408;Inherit;True;Box Side Mask;-1;;496;91547e968b03bd14e8384e9acd07ec75;0;2;5;FLOAT3;0,0,0;False;76;FLOAT2;0,0;False;3;FLOAT3;49;FLOAT2;75;FLOAT;52
Node;AmplifyShaderEditor.FunctionNode;486;-2816,1392;Inherit;True;Project To Box;-1;;502;41af6a45d74cb6d41b7745db47b7ae2e;0;5;7;FLOAT3;0,0,0;False;9;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT;37
Node;AmplifyShaderEditor.FunctionNode;489;-4224,1072;Inherit;True;Sample Pixel in Middle;-1;;505;ca734264f5810ca4b94fea7366b727ea;0;2;1;FLOAT2;0,0;False;3;FLOAT2;1024,1024;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;491;-2432,1392;Inherit;True;Spherical Coordinates;-1;;506;9e80b6d1b6be17d4ebb57a33a859464b;0;1;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;493;-2256,-1488;Inherit;True;ST Remapping;-1;;507;f7cdb202740308345a4bd9daa828fb38;0;2;3;FLOAT2;0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;495;-1984,-1488;Inherit;True;Property;_TextureSample4;Texture Sample 4;663;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.Vector4Node;494;-2464,-1456;Inherit;False;Constant;_Vector8;Vector 8;6;0;Create;True;0;0;0;False;0;False;0.5,0.5,0.2,-0.3;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;517;-1840,-464;Inherit;True;Direction to Signed Cube;-1;;532;b2c91a8768283334c8066c55fef248ed;0;2;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0;FLOAT3;8;FLOAT;10
Node;AmplifyShaderEditor.FunctionNode;531;-3840,1408;Inherit;True;UV to Tunnel;-1;;554;73328b624325aba44a813e19fd82949b;0;2;1;FLOAT2;0,0;False;27;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;22
Node;AmplifyShaderEditor.FunctionNode;453;-2544,-800;Inherit;True;Filtered Cosine;-1;;556;03c220405a768864391cd325b530d439;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;456;-2288,-784;Inherit;True;Smoothstep 10;-1;;557;c24375f1f1f682347bf1da27344b5d59;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;458;-2064,-784;Inherit;True;Square Wave;-1;;558;888ead0ecd36ca3428156bb2ff78378f;0;2;1;FLOAT;0;False;2;FLOAT;0.5;False;2;FLOAT;11;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;460;-2560,-464;Inherit;True;Smooth Min;-1;;560;6c53ae6a45931c048a3fd32e4f74e638;0;3;1;FLOAT;0;False;2;FLOAT;0.25;False;3;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;461;-2208,-464;Inherit;True;Smooth Max;-1;;561;2f3646f307f112b47ad6f60398ee6483;0;3;13;FLOAT;0;False;14;FLOAT;0.25;False;10;FLOAT;0.1;False;1;FLOAT;12
Node;AmplifyShaderEditor.SamplerNode;476;-1664,-800;Inherit;True;Property;_TextureSample3;Texture Sample 3;666;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;509;-3712,-1472;Inherit;False;Min Index 2;-1;;562;b0a2b90f5b6b1344fb6a865c049f4820;0;1;2;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;511;-3408,-1472;Inherit;False;Min Index 3;-1;;563;4839ba6681b36434b8b294eed137c44a;0;1;1;FLOAT3;0,0,0;False;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;513;-3120,-1472;Inherit;False;Sort2;-1;;564;35b07fb849e782d409fac515b5351d68;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;2;FLOAT2;0;FLOAT2;11
Node;AmplifyShaderEditor.FunctionNode;501;-3712,-1872;Inherit;False;Generic Max;-1;;567;0185f4cfc515f87408393a57d069c093;0;3;1;FLOAT2;0,0;False;4;FLOAT3;0,0,0;False;9;FLOAT4;0,0,0,0;False;3;FLOAT;0;FLOAT;8;FLOAT;14
Node;AmplifyShaderEditor.FunctionNode;503;-3376,-1856;Inherit;False;Generic Min;-1;;568;1ecc4a920e0e1014280aa5f5b27b7ed6;0;3;1;FLOAT2;0,0;False;4;FLOAT3;0,0,0;False;9;FLOAT4;0,0,0,0;False;3;FLOAT;0;FLOAT;8;FLOAT;14
Node;AmplifyShaderEditor.FunctionNode;505;-3712,-1648;Inherit;False;Max Index 2;-1;;569;f3e47816a62889b46bdc9693520a7096;0;1;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;507;-3408,-1648;Inherit;False;Max Index 3;-1;;570;0599bf64e4e580741b071b9cdfb16d3e;0;1;1;FLOAT3;0,0,0;False;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;515;-3104,-1648;Inherit;False;Sort3;-1;;571;9cae953e05f1fa740af42919a9d3f727;0;2;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;47
Node;AmplifyShaderEditor.FunctionNode;525;-2752,-1872;Inherit;True;ACES Approximation;-1;;581;5fd6700dbe71b414b9c5603a628a37f9;0;1;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;527;-2416,-1872;Inherit;True;Blackbody Approximation;-1;;582;9c84ef0851189be4d8073b57045122e8;0;1;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;529;-2080,-1872;Inherit;False;Transform Properties;-1;;584;986dbfe9245efc34ea2f049e0ec43abf;0;0;2;FLOAT3;0;FLOAT3;17
Node;AmplifyShaderEditor.FunctionNode;536;-3536,1424;Inherit;True;Tunnel to UV;-1;;585;d26d8ed8313e63d4e8b1ac15e5729ec9;0;2;1;FLOAT2;0,0;False;17;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;448;-2464,-1184;Inherit;False;VR Info;-1;;586;c8ff9c6e2553b3349895137fbcf86e42;0;0;8;FLOAT;96;FLOAT;77;FLOAT;69;FLOAT;67;FLOAT;6;FLOAT;33;FLOAT;56;FLOAT;38
Node;AmplifyShaderEditor.FunctionNode;431;-3024,-1200;Inherit;False;Mirror Info;-1;;597;a29131825ee0c8542b3ae01677e5c88b;0;0;5;FLOAT;0;FLOAT;3;FLOAT;7;FLOAT;12;FLOAT3;15
Node;AmplifyShaderEditor.FunctionNode;429;-3424,-1200;Inherit;False;Camera Mask;-1;;598;af8cf65b70d414e4a9ee1127e00bd241;0;0;17;INT;7;FLOAT;0;FLOAT;11;FLOAT;14;FLOAT;19;FLOAT;23;FLOAT;26;FLOAT;32;FLOAT;36;FLOAT;39;FLOAT;44;FLOAT;48;FLOAT;50;FLOAT;56;FLOAT;60;FLOAT;63;FLOAT;68
Node;AmplifyShaderEditor.FunctionNode;474;-3744,-1200;Inherit;False;Camera Info;-1;;600;fa347273eb86c894d8c0bd7e0231bf38;0;0;4;FLOAT3;37;FLOAT;40;FLOAT;0;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;428;-3776,-944;Inherit;False;Camera Mode;-1;;601;2b52c30b734a7fd48b2d0c1b92432d16;0;0;5;FLOAT;18;FLOAT;0;FLOAT;6;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;473;-928,352;Inherit;True;Line Shape;-1;;602;e52123430190daa40b23aae88c535355;0;4;3;FLOAT2;0,0;False;1;FLOAT2;0.25,0.25;False;2;FLOAT2;0.5,0.75;False;71;FLOAT;0.02;False;11;FLOAT;69;FLOAT;136;FLOAT;138;FLOAT;53;FLOAT;58;FLOAT2;80;FLOAT2;82;FLOAT;92;FLOAT4;96;FLOAT3;131;FLOAT;105
Node;AmplifyShaderEditor.FunctionNode;539;0,-1824;Inherit;True;BakerySH;113;;614;ee80efc6828f286459adbfe8c5eb1ae2;0;3;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;9;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;554;352,-1200;Inherit;True;SampleL1;496;;859;31ab6b0974ed3b240b7c486c50a7ae67;0;1;1;FLOAT2;0,0;False;3;FLOAT3;0;FLOAT3;12;FLOAT3;15
Node;AmplifyShaderEditor.FunctionNode;556;672,-1200;Inherit;True;SampleRNMX;500;;860;036d071e2c1177346acab2dcb5c59558;0;1;11;FLOAT2;0,0;False;3;FLOAT3;0;FLOAT3;15;FLOAT3;16
Node;AmplifyShaderEditor.FunctionNode;545;352,-1520;Inherit;True;BakerySpecularSHFull;292;;888;b3c7d4065f7b46a4ab45e0af66337b79;0;7;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT2;0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;2;FLOAT3;0;COLOR;8
Node;AmplifyShaderEditor.FunctionNode;558;720,-1840;Inherit;True;BakeryDecodeLightmap RNM;91;;971;aef82ca31360dac4f9340ec54a2d24cb;0;1;1;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;560;288,-880;Inherit;True;BakeryLumaClamp;-1;;980;28dba4bb5b74d5c459a16a1fb4684a8c;0;2;9;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;562;688,-880;Inherit;True;BakeryMonoSHLightContribution;-1;;981;2a6fbf7c1b59bbe4ab9f3dddd403f4c1;0;2;10;FLOAT3;0,0,0;False;16;FLOAT3;0,0,0;False;3;FLOAT3;25;FLOAT3;24;FLOAT3;23
Node;AmplifyShaderEditor.FunctionNode;568;1536,-1200;Inherit;True;BakeryReadLightmap;22;;999;39c38a94c8dcb364f8c6735db914865e;0;1;19;FLOAT2;0,0;False;2;FLOAT3;0;FLOAT3;23
Node;AmplifyShaderEditor.FunctionNode;570;1072,-880;Inherit;True;BakerySampleSHMatrix;65;;1017;632c74833651881478fd1fc016792e44;0;2;25;FLOAT2;0,0;False;32;FLOAT3;0,0,0;False;10;FLOAT;71;FLOAT;72;FLOAT;73;FLOAT;74;FLOAT3;44;FLOAT3;45;FLOAT3;46;FLOAT3;0;FLOAT3;30;FLOAT3;31
Node;AmplifyShaderEditor.FunctionNode;572;1760,-864;Inherit;True;BakerySH4LightContribution;-1;;1029;f84e6be2a65da3b4692f10d4751a8d0d;0;4;17;FLOAT3;0,0,0;False;19;FLOAT3;0,0,0;False;20;FLOAT3;0,0,0;False;21;FLOAT3;0,0,0;False;3;FLOAT3;14;FLOAT3;15;FLOAT3;16
Node;AmplifyShaderEditor.FunctionNode;574;1408,-880;Inherit;True;BakerySH4Luma;-1;;1030;4f0ff00b0365d754f97e3bbb48d698a3;0;4;15;FLOAT3;0,0,0;False;16;FLOAT3;0,0,0;False;17;FLOAT3;0,0,0;False;18;FLOAT3;0,0,0;False;5;FLOAT;14;FLOAT3;25;FLOAT;11;FLOAT;12;FLOAT;13
Node;AmplifyShaderEditor.FunctionNode;576;1536,-1536;Inherit;True;CombineSHTerms;0;;1031;124a618a874896e41b8c77520dbff84b;0;5;15;FLOAT3;0,0,0;False;16;FLOAT3;0,0,0;False;17;FLOAT3;0,0,0;False;23;FLOAT3;0,0,0;False;24;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT;33
Node;AmplifyShaderEditor.FunctionNode;578;1104,-1200;Inherit;True;PerceptualRoughnessToMipmapLevel;-1;;1040;0deaf95a2011abf4b8f66c32311eeb9b;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;580;1424,-1840;Inherit;True;PerceptualRoughnessToRoughness;-1;;1041;f1523fd1c355aec409461f0ef8f6bf62;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;583;1088,-1840;Inherit;True;SHEvaluateL1Diffuse;-1;;1042;cb03ec1d203cc794ea589436fe9c634e;0;3;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;585;1088,-1520;Inherit;True;SmoothnessToPerceptualRoughness;-1;;1043;504a050a7ae6ffc49938c854fed29688;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;566;-16,-1536;Inherit;True;BakerySpecularMonoSHFull;204;;1044;756680ee719f65d41883a397fb95883a;0;6;5;COLOR;0,0,0,0;False;2;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT;0;False;2;FLOAT3;0;COLOR;19
Node;AmplifyShaderEditor.FunctionNode;565;352,-1840;Inherit;True;BakeryMonoSH;570;;1091;2c17d669b268eb24fa124e99362b5fcc;0;2;2;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;567;720,-1520;Inherit;True;DirectionalSpecular;452;;1123;17d2c4e154cd6be43b109df3813effbb;0;4;1;FLOAT2;0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;548;-16,-1200;Inherit;True;GGXTerm;-1;;1146;2a0d381eb421fe1429b4ec2966d494b5;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;551;-16,-880;Inherit;True;BakeryLightmapST;-1;;1148;92835087cc0d4ca44aa7c5ca68cee410;0;1;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;480;-1056,-1856;Inherit;True;Reflection Probe Data;657;;1151;7a7f6f982b1580d43969be4367932890;0;3;11;FLOAT3;0,0,0;False;31;FLOAT3;0,0,0;False;32;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;33
Node;AmplifyShaderEditor.FunctionNode;519;-1056,-1520;Inherit;False;Decode HDR;-1;;1159;22f64cb827603434293a24d161af5823;0;2;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;521;-1552,-1856;Inherit;False;Lightmap Data;636;;1160;9544411dceb2065419e5d62a80e63024;0;1;3;FLOAT2;0,0;False;12;COLOR;0;COLOR;12;COLOR;23;COLOR;30;COLOR;39;COLOR;45;COLOR;56;COLOR;62;COLOR;69;COLOR;76;COLOR;89;COLOR;92
Node;AmplifyShaderEditor.FunctionNode;523;-560,-1856;Inherit;True;Reflection Probe Data;657;;1168;7a7f6f982b1580d43969be4367932890;0;3;11;FLOAT3;0,0,0;False;31;FLOAT3;0,0,0;False;32;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT3;33
Node;AmplifyShaderEditor.FunctionNode;587;-112,-2608;Inherit;True;GGX GSF;-1;;1176;76fe3726e2d45154b8ccda48eecb8c7b;0;4;3;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;4;FLOAT;4.02;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;590;-112,-2912;Inherit;True;HalfDirection;-1;;1178;5fa0ddbb67263a241866afc9df83ce7b;0;2;2;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;595;224,-2608;Inherit;True;NdotL;-1;;1187;cb780e012a734b5418e5b98d881e0121;0;2;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;593;224,-2400;Inherit;True;LdotV;-1;;1182;089a441f1ed6bba4ca89db8053ab24e9;0;2;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;596;496,-2608;Inherit;True;NdotV;-1;;1188;12182df00fb0b2f468667c228961b671;0;2;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;592;496,-2400;Inherit;True;LdotH;-1;;1179;029a79e49804cb24b98d704c052c9b9f;0;2;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT;7
Node;AmplifyShaderEditor.FunctionNode;594;768,-2608;Inherit;True;NdotH;-1;;1184;6a242299ade6f8d468164a66cd1bff4e;0;3;12;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;597;768,-2400;Inherit;True;RdotV;-1;;1190;1c8e1a20e5d571e458d4792b880f8a1e;0;3;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;599;-128,-2288;Inherit;True;ReflectDirection;-1;;1193;751b8ee19477c6e408f919d6c0cc5230;0;2;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;601;1792,-2928;Inherit;True;SchlickFresnell;-1;;1194;cdc87002f8009f94d8a63fe8fe0a609c;0;3;4;COLOR;0,0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;603;224,-2192;Inherit;True;VdotH;-1;;1198;9bdd4ef9301a36046b4d71a148a0e0ec;0;2;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;605;1472,-2608;Inherit;True;BlinnPhong NDF;-1;;1205;bb06741406cd2ea44b9502852aea31df;0;4;8;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;11;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;608;1184,-2608;Inherit;True;Phong NDF;-1;;1217;e3a0e899b0aeaca4c811bd653b08bb25;0;4;14;FLOAT3;0,0,0;False;15;FLOAT3;0,0,0;False;16;FLOAT3;0,0,0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;604;1744,-2608;Inherit;True;Beckman NDF;-1;;1201;2df582e2dc708f3409784d4381e85d6f;0;4;25;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;9;FLOAT3;0,0,0;False;26;FLOAT;1;False;1;FLOAT;36
Node;AmplifyShaderEditor.FunctionNode;607;1184,-2400;Inherit;True;GGX NDF;-1;;1213;fe7dcfb392ed5c24a81416c1918322d8;0;4;18;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;32;FLOAT;0.5;False;1;FLOAT;33
Node;AmplifyShaderEditor.FunctionNode;606;1472,-2400;Inherit;True;Gaussian NDF;-1;;1209;82e5b816a2d7b8a4ea87b853ffb92a2a;0;4;17;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;9;FLOAT3;0,0,0;False;26;FLOAT;1;False;1;FLOAT;41
Node;AmplifyShaderEditor.FunctionNode;610;1744,-2400;Inherit;True;TrowbridgeReitz NDF;-1;;1226;0aff9d34c08ffbc48b0cd4673f348bfd;0;4;18;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;30;FLOAT;0.5;False;1;FLOAT;40
Node;AmplifyShaderEditor.FunctionNode;609;1184,-2192;Inherit;True;TrowbridgeReitz Anisotropic NDF;-1;;1221;52e7d979d78855a4cb036f275ef37e10;0;7;45;FLOAT3;0,0,0;False;27;FLOAT3;0,0,0;False;28;FLOAT3;0,0,0;False;35;FLOAT3;0,0,0;False;36;FLOAT3;0,0,0;False;1;FLOAT;0.96;False;10;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;611;1488,-2192;Inherit;True;Ward Anisotropic NDF;-1;;1230;f6b9c77efb40def4dab143b1eff9b5c4;0;7;21;FLOAT3;0,0,0;False;10;FLOAT3;0,0,0;False;9;FLOAT3;0,0,0;False;17;FLOAT3;0,0,0;False;14;FLOAT3;0,0,0;False;23;FLOAT;0.2;False;7;FLOAT;0.87;False;1;FLOAT;74
Node;AmplifyShaderEditor.FunctionNode;613;192,-2912;Inherit;True;GGX Light;-1;;1238;94c86e534cb1a6b4094fe1425627bfb1;0;5;15;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;9;FLOAT;0.3;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;615;576,-2928;Inherit;True;ShadeSH9;-1;;1249;a9b6116f90b53de45b33bc7ecf0c9694;0;1;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;616;816,-2928;Inherit;True;SHEvalLinearL0L1;-1;;1252;7d535c1540040424fbf58bd7e6021780;0;1;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;617;1120,-2928;Inherit;True;SHEvalLinearL2;-1;;1253;d7bc6c7ae889e234aa41699a95f0418a;0;1;10;FLOAT3;0,0,0;False;1;FLOAT3;13
Node;AmplifyShaderEditor.FunctionNode;618;1424,-2928;Inherit;True;SHGetBasisVectors;-1;;1254;ded0208df9d29194fa182435b26e6213;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-448,-1312;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;TestingGrounds;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;True;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;533;-3584,1360;Inherit;False;318;304;_Coordinate Mapping/Tunnel to UV;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;401;-3200,-528;Inherit;False;356;328;_Utils/Stairstep (Terracing);0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;73;608,288;Inherit;False;337;327;_2D Shapes/Square Shape;0;;1,1,1,1;0;0
WireConnection;397;0;395;0
WireConnection;397;1;449;0
WireConnection;126;0;130;0
WireConnection;126;1;132;0
WireConnection;126;3;132;13
WireConnection;126;4;132;18
WireConnection;126;7;130;1
WireConnection;117;0;120;0
WireConnection;174;1;176;0
WireConnection;174;2;177;0
WireConnection;174;3;175;0
WireConnection;174;4;178;0
WireConnection;158;1;172;17
WireConnection;158;2;159;0
WireConnection;160;2;158;0
WireConnection;160;1;159;0
WireConnection;172;1;234;0
WireConnection;234;1;157;0
WireConnection;49;2;111;0
WireConnection;49;1;94;0
WireConnection;111;1;235;18
WireConnection;111;2;94;0
WireConnection;235;1;28;0
WireConnection;120;0;354;0
WireConnection;354;0;352;4
WireConnection;108;0;106;0
WireConnection;106;0;112;0
WireConnection;112;2;354;0
WireConnection;181;0;180;0
WireConnection;181;1;174;0
WireConnection;413;0;411;0
WireConnection;415;0;413;0
WireConnection;415;1;413;0
WireConnection;203;1;236;18
WireConnection;203;2;204;0
WireConnection;245;3;251;0
WireConnection;245;23;247;4
WireConnection;251;0;247;3
WireConnection;251;1;247;3
WireConnection;239;1;238;18
WireConnection;239;2;216;0
WireConnection;214;2;239;0
WireConnection;214;1;216;0
WireConnection;215;1;216;0
WireConnection;238;1;221;0
WireConnection;50;2;5;0
WireConnection;50;1;4;0
WireConnection;273;0;271;0
WireConnection;265;0;268;0
WireConnection;279;0;280;0
WireConnection;280;0;281;0
WireConnection;281;0;283;0
WireConnection;278;0;279;0
WireConnection;277;1;278;0
WireConnection;274;0;454;0
WireConnection;268;0;273;0
WireConnection;269;0;263;0
WireConnection;269;1;466;52
WireConnection;269;2;274;0
WireConnection;299;0;298;4
WireConnection;296;0;380;5
WireConnection;296;1;297;0
WireConnection;295;0;292;0
WireConnection;295;1;293;0
WireConnection;295;2;274;0
WireConnection;297;0;295;0
WireConnection;300;1;467;52
WireConnection;300;2;307;0
WireConnection;307;0;306;4
WireConnection;307;1;308;0
WireConnection;307;2;306;4
WireConnection;263;2;265;0
WireConnection;378;1;465;52
WireConnection;378;2;299;0
WireConnection;379;1;300;0
WireConnection;380;1;269;0
WireConnection;449;8;395;0
WireConnection;450;1;406;0
WireConnection;450;2;407;0
WireConnection;450;3;415;0
WireConnection;454;1;277;0
WireConnection;325;0;324;2
WireConnection;451;10;315;0
WireConnection;451;11;322;0
WireConnection;451;15;325;0
WireConnection;347;0;463;0
WireConnection;345;0;347;0
WireConnection;344;0;347;0
WireConnection;344;3;345;0
WireConnection;343;0;347;0
WireConnection;343;3;344;0
WireConnection;463;0;451;54
WireConnection;351;0;469;50
WireConnection;351;1;462;0
WireConnection;464;5;117;0
WireConnection;466;2;265;0
WireConnection;459;1;214;0
WireConnection;459;2;215;0
WireConnection;459;3;241;0
WireConnection;200;27;203;0
WireConnection;200;25;197;0
WireConnection;204;0;197;0
WireConnection;204;1;206;0
WireConnection;254;0;253;3
WireConnection;254;1;253;3
WireConnection;261;1;262;0
WireConnection;462;0;343;0
WireConnection;469;1;451;0
WireConnection;477;1;476;0
WireConnection;493;1;494;0
WireConnection;495;1;493;0
WireConnection;473;1;254;0
WireConnection;473;2;261;18
WireConnection;0;15;566;19
ASEEND*/
//CHKSM=089C45F2FEBA588071091348FC797828A06F61A0