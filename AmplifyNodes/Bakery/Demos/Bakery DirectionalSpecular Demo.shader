// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Bakery DominantDir Demo"
{
	Properties
	{
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGINCLUDE
		#include "UnityCG.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float2 uv3_texcoord3;
			float3 worldNormal;
			float3 viewDir;
		};

		uniform float _Smoothness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 lightmapUV28_g156 = i.uv3_texcoord3;
			float2 lightmapUV22_g159 = lightmapUV28_g156;
			float2 uv14_g167 = lightmapUV22_g159;
			float4 temp_output_1_0_g168 = unity_LightmapST;
			float3 decodeLightMap8_g159 = DecodeLightmap(UNITY_SAMPLE_TEX2D( unity_Lightmap, ( ( uv14_g167 * (temp_output_1_0_g168).xy ) + (temp_output_1_0_g168).zw ) ));
			float3 lmColor16_g156 = decodeLightMap8_g159;
			float smoothness37_g156 = _Smoothness;
			float perceptualRoughness51_g156 = ( 1.0 - smoothness37_g156 );
			float temp_output_1_0_g158 = perceptualRoughness51_g156;
			float roughness57_g156 = ( temp_output_1_0_g158 * temp_output_1_0_g158 );
			float temp_output_1_0_g175 = roughness57_g156;
			float temp_output_7_0_g174 = ( temp_output_1_0_g175 * temp_output_1_0_g175 );
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float3 normalWorld36_g156 = ase_normWorldNormal;
			float2 uv14_g160 = lightmapUV22_g159;
			float4 temp_output_1_0_g162 = unity_LightmapST;
			float3 temp_cast_1 = (1.0).xxx;
			float3 lmDir26_g156 = ( ( (UNITY_SAMPLE_TEX2D_SAMPLER( unity_LightmapInd,unity_Lightmap, ( ( uv14_g160 * (temp_output_1_0_g162).xy ) + (temp_output_1_0_g162).zw ) )).rgb * 2.0 ) - temp_cast_1 );
			float3 normalizeResult31_g156 = normalize( lmDir26_g156 );
			float3 viewDir35_g156 = i.viewDir;
			float3 normalizeResult38_g156 = normalize( ( normalizeResult31_g156 + viewDir35_g156 ) );
			float3 halfDir39_g156 = normalizeResult38_g156;
			float dotResult41_g156 = dot( normalWorld36_g156 , halfDir39_g156 );
			float ndotl46_g156 = saturate( dotResult41_g156 );
			float ndoth11_g174 = ndotl46_g156;
			float temp_output_15_0_g174 = ( ( ndoth11_g174 * ( ( ndoth11_g174 * temp_output_7_0_g174 ) - ndoth11_g174 ) ) + 1.0 );
			float spec62_g156 = ( ( temp_output_7_0_g174 * 0.3183099 ) / ( ( temp_output_15_0_g174 * temp_output_15_0_g174 ) + 1E-07 ) );
			float3 fragColor68_g156 = ( lmColor16_g156 * spec62_g156 * 0.99999 );
			o.Albedo = fragColor68_g156;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

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
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
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
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv3_texcoord3;
				o.customPack1.xy = v.texcoord2;
				o.worldPos = worldPos;
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
				surfIN.uv3_texcoord3 = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = worldViewDir;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
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
Node;AmplifyShaderEditor.RangedFloatNode;3;-840.5,102.5;Inherit;False;Property;_Smoothness;Smoothness;44;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2;-416,0;Inherit;True;DirectionalSpecular;0;;156;17d2c4e154cd6be43b109df3813effbb;0;4;1;FLOAT2;0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Bakery DominantDir Demo;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;5;3;0
WireConnection;0;0;2;0
ASEEND*/
//CHKSM=6C9B72A05624C186E2601BA9D36833681EC12A1D