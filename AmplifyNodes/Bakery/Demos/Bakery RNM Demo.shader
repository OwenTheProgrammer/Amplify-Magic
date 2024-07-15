// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Bakery RNM Demo"
{
	Properties
	{
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		_Metallic("Metallic", Range( 0 , 1)) = 0.5
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("MainTex", 2D) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
		#define NOURP
		struct Input
		{
			float2 uv3_texcoord3;
			float3 worldNormal;
			float3 viewDir;
			float2 uv_texcoord;
		};

		uniform sampler2D _RNM0;
		uniform sampler2D _RNM1;
		uniform sampler2D _RNM2;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform sampler2D _MainTex;
		uniform float4 _Color;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float4 temp_output_1_0_g1398 = unity_LightmapST;
			float2 uv14_g1383 = ( ( i.uv3_texcoord3 * (temp_output_1_0_g1398).xy ) + (temp_output_1_0_g1398).zw );
			float3 decodeLightMap49 = DecodeLightmap(UNITY_SAMPLE_TEX2D( unity_Lightmap, uv14_g1383 ));
			float3 L017_g1312 = decodeLightMap49;
			float3 L03_g1332 = L017_g1312;
			float3 L020_g1347 = L03_g1332;
			float4 temp_output_1_0_g1382 = unity_LightmapST;
			float2 temp_output_293_0_g1312 = ( ( i.uv3_texcoord3 * (temp_output_1_0_g1382).xy ) + (temp_output_1_0_g1382).zw );
			float2 lightmapUV19_g1312 = temp_output_293_0_g1312;
			float2 lightmapUV11_g1332 = lightmapUV19_g1312;
			float2 lightmapUV27_g1337 = lightmapUV11_g1332;
			float3 temp_cast_1 = (1.0).xxx;
			float3 nL1x22_g1337 = ( ( tex2D( _RNM0, lightmapUV27_g1337 ).rgb * 2.0 ) - temp_cast_1 );
			float3 nL1x22_g1339 = nL1x22_g1337;
			float3 L034_g1337 = L03_g1332;
			float3 L018_g1339 = L034_g1337;
			float3 temp_output_8_0_g1339 = ( L018_g1339 * 2.0 );
			float3 L1x67_g1337 = ( nL1x22_g1339 * temp_output_8_0_g1339 );
			float3 L1x49_g1332 = L1x67_g1337;
			float3 L1x18_g1347 = L1x49_g1332;
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float3 worldNormal18_g1312 = ase_normWorldNormal;
			float3 worldNormal8_g1332 = worldNormal18_g1312;
			float3 Direction19_g1347 = worldNormal8_g1332;
			float3 temp_cast_2 = (1.0).xxx;
			float3 nL1y23_g1337 = ( ( tex2D( _RNM1, lightmapUV27_g1337 ).rgb * 2.0 ) - temp_cast_2 );
			float3 nL1y23_g1339 = nL1y23_g1337;
			float3 L1y68_g1337 = ( nL1y23_g1339 * temp_output_8_0_g1339 );
			float3 L1y50_g1332 = L1y68_g1337;
			float3 L1y22_g1347 = L1y50_g1332;
			float3 temp_cast_3 = (1.0).xxx;
			float3 nL1z24_g1337 = ( ( tex2D( _RNM2, lightmapUV27_g1337 ).rgb * 2.0 ) - temp_cast_3 );
			float3 nL1z24_g1339 = nL1z24_g1337;
			float3 L1z69_g1337 = ( nL1z24_g1339 * temp_output_8_0_g1339 );
			float3 L1z51_g1332 = L1z69_g1337;
			float3 L1z25_g1347 = L1z51_g1332;
			float3 temp_output_9_0_g1347 = ( L020_g1347 + ( L1x18_g1347 * (Direction19_g1347).x ) + ( L1y22_g1347 * (Direction19_g1347).y ) + ( L1z25_g1347 * (Direction19_g1347).z ) );
			float3 temp_cast_4 = (1.0).xxx;
			float dotResult2_g1338 = dot( L034_g1337 , temp_cast_4 );
			float lumaL062_g1332 = dotResult2_g1338;
			float L06_g1334 = lumaL062_g1332;
			float3 temp_cast_5 = (1.0).xxx;
			float dotResult3_g1338 = dot( L1x67_g1337 , temp_cast_5 );
			float lumaL1x63_g1332 = dotResult3_g1338;
			float3 temp_cast_6 = (1.0).xxx;
			float dotResult4_g1338 = dot( L1y68_g1337 , temp_cast_6 );
			float lumaL1y64_g1332 = dotResult4_g1338;
			float3 temp_cast_7 = (1.0).xxx;
			float dotResult5_g1338 = dot( L1z69_g1337 , temp_cast_7 );
			float lumaL1z65_g1332 = dotResult5_g1338;
			float3 appendResult69_g1332 = (float3(lumaL1x63_g1332 , lumaL1y64_g1332 , lumaL1z65_g1332));
			float3 L17_g1334 = appendResult69_g1332;
			float3 R112_g1334 = ( 0.5 * L17_g1334 );
			float lenR117_g1334 = length( R112_g1334 );
			float temp_output_48_0_g1334 = ( lenR117_g1334 / L06_g1334 );
			float a_const52_g1334 = ( ( 1.0 - temp_output_48_0_g1334 ) / ( temp_output_48_0_g1334 + 1.0 ) );
			float power42_g1334 = ( ( ( lenR117_g1334 / L06_g1334 ) * 2.0 ) + 1.0 );
			float3 normalizeResult24_g1334 = normalize( R112_g1334 );
			float3 n8_g1334 = worldNormal8_g1332;
			float dotResult19_g1334 = dot( normalizeResult24_g1334 , n8_g1334 );
			float phi28_g1334 = ( ( dotResult19_g1334 * 0.5 ) + 0.5 );
			float lumaSH76_g1332 = ( L06_g1334 * ( 1.0 - a_const52_g1334 ) * ( power42_g1334 + 1.0 ) * pow( phi28_g1334 , power42_g1334 ) );
			float3 temp_cast_8 = (1.0).xxx;
			float dotResult31_g1347 = dot( temp_output_9_0_g1347 , temp_cast_8 );
			float temp_output_10_0_g1333 = dotResult31_g1347;
			float lerpResult7_g1333 = lerp( 1.0 , ( lumaSH76_g1332 / temp_output_10_0_g1333 ) , saturate( ( temp_output_10_0_g1333 * 16.0 ) ));
			float3 temp_cast_9 = (0.0).xxx;
			float temp_output_238_0_g1312 = ( 1.0 - 0.04 );
			float metallic23_g1312 = _Metallic;
			float oneMinusReflectivity241_g1312 = ( temp_output_238_0_g1312 - ( temp_output_238_0_g1312 * metallic23_g1312 ) );
			float3 temp_cast_10 = (0.0).xxx;
			o.Albedo = max( ( max( ( temp_output_9_0_g1347 * lerpResult7_g1333 ) , temp_cast_9 ) * oneMinusReflectivity241_g1312 ) , temp_cast_10 );
			float3 L020_g1313 = L017_g1312;
			float2 lightmapUV27_g1322 = lightmapUV19_g1312;
			float3 temp_cast_11 = (1.0).xxx;
			float3 nL1x22_g1322 = ( ( tex2D( _RNM0, lightmapUV27_g1322 ).rgb * 2.0 ) - temp_cast_11 );
			float3 nL1x22_g1324 = nL1x22_g1322;
			float3 L034_g1322 = L017_g1312;
			float3 L018_g1324 = L034_g1322;
			float3 temp_output_8_0_g1324 = ( L018_g1324 * 2.0 );
			float3 L1x67_g1322 = ( nL1x22_g1324 * temp_output_8_0_g1324 );
			float3 L1x164_g1312 = L1x67_g1322;
			float3 L1x18_g1313 = L1x164_g1312;
			float3 nL1x151_g1312 = nL1x22_g1322;
			float3 _lumaConv = float3(0.2125,0.7154,0.0721);
			float dotResult123_g1312 = dot( nL1x151_g1312 , _lumaConv );
			float3 temp_cast_12 = (1.0).xxx;
			float3 nL1y23_g1322 = ( ( tex2D( _RNM1, lightmapUV27_g1322 ).rgb * 2.0 ) - temp_cast_12 );
			float3 nL1y152_g1312 = nL1y23_g1322;
			float dotResult124_g1312 = dot( nL1y152_g1312 , _lumaConv );
			float3 temp_cast_13 = (1.0).xxx;
			float3 nL1z24_g1322 = ( ( tex2D( _RNM2, lightmapUV27_g1322 ).rgb * 2.0 ) - temp_cast_13 );
			float3 nL1z153_g1312 = nL1z24_g1322;
			float dotResult125_g1312 = dot( nL1z153_g1312 , _lumaConv );
			float3 appendResult167_g1312 = (float3(dotResult123_g1312 , dotResult124_g1312 , dotResult125_g1312));
			float3 dominantDir168_g1312 = appendResult167_g1312;
			float3 Direction19_g1313 = dominantDir168_g1312;
			float3 nL1y23_g1324 = nL1y23_g1322;
			float3 L1y68_g1322 = ( nL1y23_g1324 * temp_output_8_0_g1324 );
			float3 L1y165_g1312 = L1y68_g1322;
			float3 L1y22_g1313 = L1y165_g1312;
			float3 nL1z24_g1324 = nL1z24_g1322;
			float3 L1z69_g1322 = ( nL1z24_g1324 * temp_output_8_0_g1324 );
			float3 L1z166_g1312 = L1z69_g1322;
			float3 L1z25_g1313 = L1z166_g1312;
			float3 temp_output_9_0_g1313 = ( L020_g1313 + ( L1x18_g1313 * (Direction19_g1313).x ) + ( L1y22_g1313 * (Direction19_g1313).y ) + ( L1z25_g1313 * (Direction19_g1313).z ) );
			float smoothness21_g1312 = _Smoothness;
			float perceptualRoughness194_g1312 = ( 1.0 - smoothness21_g1312 );
			float temp_output_1_0_g1371 = perceptualRoughness194_g1312;
			float roughness196_g1312 = ( temp_output_1_0_g1371 * temp_output_1_0_g1371 );
			float temp_output_1_0_g1373 = roughness196_g1312;
			float temp_output_7_0_g1372 = ( temp_output_1_0_g1373 * temp_output_1_0_g1373 );
			float3 normalizeResult178_g1312 = normalize( dominantDir168_g1312 );
			float3 viewDir20_g1312 = i.viewDir;
			float3 normalizeResult179_g1312 = normalize( ( normalizeResult178_g1312 + viewDir20_g1312 ) );
			float3 halfDir181_g1312 = normalizeResult179_g1312;
			float dotResult183_g1312 = dot( worldNormal18_g1312 , halfDir181_g1312 );
			float ndoth187_g1312 = saturate( dotResult183_g1312 );
			float ndoth11_g1372 = ndoth187_g1312;
			float temp_output_15_0_g1372 = ( ( ndoth11_g1372 * ( ( ndoth11_g1372 * temp_output_7_0_g1372 ) - ndoth11_g1372 ) ) + 1.0 );
			float spec201_g1312 = ( ( temp_output_7_0_g1372 * 0.3183099 ) / ( ( temp_output_15_0_g1372 * temp_output_15_0_g1372 ) + 1E-07 ) );
			float3 temp_cast_14 = (0.0).xxx;
			float3 specularSH229_g1312 = max( ( temp_output_9_0_g1313 * spec201_g1312 ) , temp_cast_14 );
			float4 temp_cast_16 = (0.04).xxxx;
			float4 temp_output_41_0 = ( tex2D( _MainTex, i.uv_texcoord ) * _Color );
			float4 albedo22_g1312 = temp_output_41_0;
			float4 lerpResult231_g1312 = lerp( temp_cast_16 , albedo22_g1312 , metallic23_g1312);
			float4 specularColor236_g1312 = lerpResult231_g1312;
			float3 break5_g1321 = specularColor236_g1312.rgb;
			float grazingTerm264_g1312 = saturate( ( max( max( break5_g1321.x , break5_g1321.y ) , break5_g1321.z ) + smoothness21_g1312 ) );
			float4 temp_cast_18 = (grazingTerm264_g1312).xxxx;
			float dotResult242_g1312 = dot( worldNormal18_g1312 , viewDir20_g1312 );
			float nv247_g1312 = ( 1.0 - saturate( dotResult242_g1312 ) );
			float fresnel255_g1312 = pow( nv247_g1312 , 5.0 );
			float4 lerpResult266_g1312 = lerp( specularColor236_g1312 , temp_cast_18 , fresnel255_g1312);
			float4 temp_cast_19 = (0.0).xxxx;
			o.Specular = max( ( float4( specularSH229_g1312 , 0.0 ) * lerpResult266_g1312 ) , temp_cast_19 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardSpecular keepalpha fullforwardshadows 

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
				float4 customPack1 : TEXCOORD1;
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
				o.customPack1.zw = customInputData.uv_texcoord;
				o.customPack1.zw = v.texcoord;
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
				surfIN.uv_texcoord = IN.customPack1.zw;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = worldViewDir;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutputStandardSpecular o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandardSpecular, o )
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
Node;AmplifyShaderEditor.TextureCoordinatesNode;50;-1360,-624;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;39;-1360,-64;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;38;-1360,-256;Inherit;True;Property;_MainTex;MainTex;89;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;52;-1152,-624;Inherit;False;LightmapUV;-1;;1397;92835087cc0d4ca44aa7c5ca68cee410;0;1;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;37;-1104,-256;Inherit;True;Property;_TextureSample0;Texture Sample 0;14;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;40;-1040,-64;Inherit;False;Property;_Color;Color;15;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;48;-912,-624;Inherit;False;Lightmap Data;1;;1383;9544411dceb2065419e5d62a80e63024;0;1;3;FLOAT2;0,0;False;12;COLOR;0;COLOR;12;COLOR;23;COLOR;30;COLOR;39;COLOR;45;COLOR;56;COLOR;62;COLOR;69;COLOR;76;COLOR;89;COLOR;92
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-544,-80;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-768,272;Inherit;False;Property;_Smoothness;Smoothness;12;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-768,336;Inherit;False;Property;_Metallic;Metallic;13;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DecodeLightmapHlpNode;49;-512,-624;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;47;-240,-272;Inherit;True;BakerySpecularSHFull;22;;1312;b3c7d4065f7b46a4ab45e0af66337b79;0;7;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT2;0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;6;COLOR;0,0,0,0;False;7;FLOAT;0;False;2;FLOAT3;0;COLOR;8
Node;AmplifyShaderEditor.TextureCoordinatesNode;44;-816,32;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;46;-240,16;Inherit;True;BakerySpecularMonoSHFull;182;;1271;756680ee719f65d41883a397fb95883a;0;6;5;COLOR;0,0,0,0;False;2;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT;0;False;2;FLOAT3;0;COLOR;19
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;3;176,-272;Float;False;True;-1;2;ASEMaterialInspector;0;0;StandardSpecular;Bakery RNM Demo;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;1;Define;NOURP;False;;Custom;False;0;0;;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;52;4;50;0
WireConnection;37;0;38;0
WireConnection;37;1;39;0
WireConnection;48;3;52;0
WireConnection;41;0;37;0
WireConnection;41;1;40;0
WireConnection;49;0;48;0
WireConnection;47;1;49;0
WireConnection;47;5;35;0
WireConnection;47;6;41;0
WireConnection;47;7;36;0
WireConnection;46;5;41;0
WireConnection;46;2;44;0
WireConnection;46;4;35;0
WireConnection;46;6;36;0
WireConnection;3;0;47;0
WireConnection;3;3;47;8
ASEEND*/
//CHKSM=9434B4504B811BA9F97F624A8765D3F9B53E4D4A