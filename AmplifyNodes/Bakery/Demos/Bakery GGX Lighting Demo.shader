// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "GGX Lighting Demo"
{
	Properties
	{
		_Roughness("Roughness", Range( 0 , 1)) = 0.5
		_SpecularColor("SpecularColor", Color) = (1,1,1)
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
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
			float3 worldNormal;
			float2 vertexToFrag1;
			float3 viewDir;
			float2 uv2_texcoord2;
		};

		uniform float _Roughness;
		uniform float3 _SpecularColor;
		float4 unity_Lightmap_TexelSize;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 temp_output_1_0_g117 = unity_LightmapST;
			o.vertexToFrag1 = ( ( (v.texcoord1.xy*(unity_LightmapST).xy + (unity_LightmapST).zw) * (temp_output_1_0_g117).xy ) + (temp_output_1_0_g117).zw );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 appendResult6_g115 = (float3(unity_SHAr.x , unity_SHAg.y , unity_SHAb.z));
			float3 normalizeResult3_g119 = normalize( appendResult6_g115 );
			float3 normalizeResult12_g120 = normalize( normalizeResult3_g119 );
			float4 appendResult9_g120 = (float4(normalizeResult12_g120 , 1.0));
			float dotResult6_g120 = dot( appendResult9_g120 , unity_SHAr );
			float dotResult7_g120 = dot( appendResult9_g120 , unity_SHAg );
			float dotResult8_g120 = dot( appendResult9_g120 , unity_SHAb );
			float3 appendResult11_g120 = (float3(dotResult6_g120 , dotResult7_g120 , dotResult8_g120));
			float3 normalizeResult9_g121 = normalize( normalizeResult3_g119 );
			float4 appendResult1_g121 = (float4(normalizeResult9_g121 , 1.0));
			float4 normal24_g121 = appendResult1_g121;
			float temp_output_29_0_g121 = (normal24_g121).x;
			float temp_output_30_0_g121 = (normal24_g121).y;
			float vC34_g121 = ( ( temp_output_29_0_g121 * temp_output_29_0_g121 ) - ( temp_output_30_0_g121 * temp_output_30_0_g121 ) );
			float4 temp_output_17_0_g121 = ( (normal24_g121).xyzz * (normal24_g121).yzzx );
			float dotResult18_g121 = dot( temp_output_17_0_g121 , unity_SHBr );
			float dotResult19_g121 = dot( temp_output_17_0_g121 , unity_SHBg );
			float dotResult20_g121 = dot( temp_output_17_0_g121 , unity_SHBb );
			float3 appendResult21_g121 = (float3(dotResult18_g121 , dotResult19_g121 , dotResult20_g121));
			float3 x123_g121 = appendResult21_g121;
			float3 temp_output_7_0_g119 = ( appendResult11_g120 + ( ( (unity_SHC).xyz * vC34_g121 ) + x123_g121 ) );
			float3 linearToGamma10_g119 = LinearToGammaSpace( temp_output_7_0_g119 );
			#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch9_g119 = linearToGamma10_g119;
			#else
				float3 staticSwitch9_g119 = temp_output_7_0_g119;
			#endif
			float3 temp_output_21_0 = max( staticSwitch9_g119 , float3( 0,0,0 ) );
			float temp_output_9_0_g146 = _Roughness;
			float roughness19_g147 = temp_output_9_0_g146;
			float roughnessSqr31_g147 = ( roughness19_g147 * roughness19_g147 );
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float3 temp_output_3_0_g146 = ase_normWorldNormal;
			float3 worldNormal12_g147 = temp_output_3_0_g146;
			float2 lightmapUV22_g122 = i.vertexToFrag1;
			float2 uv14_g123 = lightmapUV22_g122;
			float4 temp_output_1_0_g125 = unity_LightmapST;
			#ifdef LIGHTMAP_OFF
				float3 staticSwitch24 = temp_output_21_0;
			#else
				float3 staticSwitch24 = ( ( (UNITY_SAMPLE_TEX2D_SAMPLER( unity_LightmapInd,unity_Lightmap, ( ( uv14_g123 * (temp_output_1_0_g125).xy ) + (temp_output_1_0_g125).zw ) )).rgb * 2.0 ) - 1.0 );
			#endif
			float3 temp_output_5_0_g146 = staticSwitch24;
			float3 lightDir9_g147 = temp_output_5_0_g146;
			float3 temp_output_7_0_g146 = i.viewDir;
			float3 viewDir6_g147 = temp_output_7_0_g146;
			float3 normalizeResult6_g149 = normalize( ( lightDir9_g147 + viewDir6_g147 ) );
			float dotResult6_g150 = dot( worldNormal12_g147 , normalizeResult6_g149 );
			float NdotH16_g147 = max( dotResult6_g150 , 0.0 );
			float NdotHSqr43_g147 = ( NdotH16_g147 * NdotH16_g147 );
			float distribution51_g147 = ( ( NdotHSqr43_g147 * ( roughnessSqr31_g147 - 1.0 ) ) + 1.0 );
			float3 temp_output_3_0_g151 = temp_output_3_0_g146;
			float dotResult6_g152 = dot( temp_output_3_0_g151 , temp_output_5_0_g146 );
			float temp_output_8_0_g151 = max( dotResult6_g152 , 0.0 );
			float temp_output_12_0_g151 = ( temp_output_9_0_g146 * 0.5 );
			float dotResult9_g151 = dot( temp_output_7_0_g146 , temp_output_3_0_g151 );
			float temp_output_10_0_g151 = abs( dotResult9_g151 );
			float4 temp_output_4_0_g153 = float4( _SpecularColor , 0.0 );
			float3 temp_output_4_0_g154 = temp_output_5_0_g146;
			float3 normalizeResult6_g155 = normalize( ( temp_output_7_0_g146 + temp_output_4_0_g154 ) );
			float dotResult6_g156 = dot( temp_output_4_0_g154 , normalizeResult6_g155 );
			float4 temp_cast_2 = (0.0).xxxx;
			float4 temp_output_25_0 = max( ( ( roughnessSqr31_g147 / ( distribution51_g147 * distribution51_g147 * UNITY_PI ) ) * ( ( temp_output_8_0_g151 / ( ( temp_output_8_0_g151 * ( 1.0 - temp_output_12_0_g151 ) ) + temp_output_12_0_g151 ) ) * ( temp_output_10_0_g151 / ( ( temp_output_10_0_g151 * ( 1.0 - temp_output_12_0_g151 ) ) + temp_output_12_0_g151 ) ) ) * ( temp_output_4_0_g153 + ( ( 1.0 - temp_output_4_0_g153 ) * pow( saturate( ( 1.0 - max( dotResult6_g156 , 0.0 ) ) ) , 5.0 ) ) ) ) , temp_cast_2 );
			float4 temp_output_27_0 = ( float4( temp_output_21_0 , 0.0 ) * temp_output_25_0 );
			float localStochasticTiling2_g141 = ( 0.0 );
			float2 UV2_g141 = (i.uv2_texcoord2*(unity_LightmapST).xy + (unity_LightmapST).zw);
			float4 TexelSize2_g141 = unity_Lightmap_TexelSize;
			float4 Offsets2_g141 = float4( 0,0,0,0 );
			float2 Weights2_g141 = float2( 0,0 );
			{
			UV2_g141 = UV2_g141 * TexelSize2_g141.zw - 0.5;
			float2 f = frac( UV2_g141 );
			UV2_g141 -= f;
			float4 xn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.xxxx;
			float4 yn = float4( 1.0, 2.0, 3.0, 4.0 ) - f.yyyy;
			float4 xs = xn * xn * xn;
			float4 ys = yn * yn * yn;
			float3 xv = float3( xs.x, xs.y - 4.0 * xs.x, xs.z - 4.0 * xs.y + 6.0 * xs.x );
			float3 yv = float3( ys.x, ys.y - 4.0 * ys.x, ys.z - 4.0 * ys.y + 6.0 * ys.x );
			float4 xc = float4( xv.xyz, 6.0 - xv.x - xv.y - xv.z );
			float4 yc = float4( yv.xyz, 6.0 - yv.x - yv.y - yv.z );
			float4 c = float4( UV2_g141.x - 0.5, UV2_g141.x + 1.5, UV2_g141.y - 0.5, UV2_g141.y + 1.5 );
			float4 s = float4( xc.x + xc.y, xc.z + xc.w, yc.x + yc.y, yc.z + yc.w );
			float w0 = s.x / ( s.x + s.y );
			float w1 = s.z / ( s.z + s.w );
			Offsets2_g141 = ( c + float4( xc.y, xc.w, yc.y, yc.w ) / s ) * TexelSize2_g141.xyxy;
			Weights2_g141 = float2( w0, w1 );
			}
			float4 Input_FetchOffsets197_g145 = Offsets2_g141;
			float2 Input_FetchWeights200_g145 = Weights2_g141;
			float2 break187_g145 = Input_FetchWeights200_g145;
			float4 lerpResult181_g145 = lerp( UNITY_SAMPLE_TEX2D( unity_Lightmap, (Input_FetchOffsets197_g145).yw ) , UNITY_SAMPLE_TEX2D( unity_Lightmap, (Input_FetchOffsets197_g145).xw ) , break187_g145.x);
			float4 lerpResult182_g145 = lerp( UNITY_SAMPLE_TEX2D( unity_Lightmap, (Input_FetchOffsets197_g145).yz ) , UNITY_SAMPLE_TEX2D( unity_Lightmap, (Input_FetchOffsets197_g145).xz ) , break187_g145.x);
			float4 lerpResult176_g145 = lerp( lerpResult181_g145 , lerpResult182_g145 , break187_g145.y);
			float4 Output_Fetch2D202_g145 = lerpResult176_g145;
			#ifdef LIGHTMAP_OFF
				float4 staticSwitch33 = ( temp_output_27_0 + ( Output_Fetch2D202_g145 * temp_output_25_0 * UNITY_SAMPLE_TEX2D_SAMPLER( unity_LightmapInd,unity_Lightmap, i.vertexToFrag1 ).a ) );
			#else
				float4 staticSwitch33 = temp_output_27_0;
			#endif
			o.Albedo = staticSwitch33.rgb;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows vertex:vertexDataFunc 

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
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.vertexToFrag1;
				o.customPack1.zw = customInputData.uv2_texcoord2;
				o.customPack1.zw = v.texcoord1;
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
				surfIN.vertexToFrag1 = IN.customPack1.xy;
				surfIN.uv2_texcoord2 = IN.customPack1.zw;
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
Node;AmplifyShaderEditor.CommentaryNode;22;-720,0;Inherit;False;644;187;Realtime Shading;3;19;20;21;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;19;-672,48;Inherit;False;SHGetBasisVectors;-1;;115;ded0208df9d29194fa182435b26e6213;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3;-1440,-144;Inherit;False;BakeryLightmapST;-1;;116;92835087cc0d4ca44aa7c5ca68cee410;0;1;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;10;-1778,-34;Inherit;False;1044;403;Bicubic Fetch Lightmap;5;4;8;9;6;7;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;20;-464,48;Inherit;False;ShadeSH9;-1;;119;a9b6116f90b53de45b33bc7ecf0c9694;0;1;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexToFragmentNode;1;-1232,-144;Inherit;False;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;4;-1728,80;Inherit;True;Global;unity_Lightmap;unity_Lightmap;0;0;Fetch;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;11;-1776,384;Inherit;False;1044;403;Bicubic Fetch LightmapInd;5;16;15;14;13;5;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;17;-1024,-144;Inherit;False;BakeryReadLightmap;2;;122;39c38a94c8dcb364f8c6735db914865e;0;1;19;FLOAT2;0,0;False;2;FLOAT3;0;FLOAT3;23
Node;AmplifyShaderEditor.SimpleMaxOpNode;21;-224,48;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;8;-1696,16;Inherit;False;Lightmap UV;-1;;140;1940f027d0458684eb0ad486f669d7d5;1,1,0;0;1;FLOAT2;0
Node;AmplifyShaderEditor.TexelSizeNode;9;-1488,160;Inherit;False;-1;1;0;SAMPLER2D;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;6;-1232,16;Inherit;False;Bicubic Precompute;-1;;141;818835145cc522e4da1f9915d8b8a984;0;2;5;FLOAT2;0,0;False;55;FLOAT4;0,0,0,0;False;2;FLOAT4;34;FLOAT2;54
Node;AmplifyShaderEditor.TexturePropertyNode;5;-1728,512;Inherit;True;Global;unity_LightmapInd;unity_LightmapInd;1;0;Fetch;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.StaticSwitch;24;-64,-112;Inherit;False;Property;_LIGHTMAP_OFF;LIGHTMAP_OFF;2;0;Create;True;0;0;0;False;0;False;0;0;0;False;LIGHTMAP_OFF;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;34;-139.8701,258.156;Inherit;False;Property;_SpecularColor;SpecularColor;46;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;35;-208,400;Inherit;False;Property;_Roughness;Roughness;45;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;7;-976,16;Inherit;False;Bicubic Sample;-1;;145;ce0e14d5ad5eac645b2e5892ab3506ff;2,92,2,72,2;7;99;SAMPLER2D;0;False;91;SAMPLER2DARRAY;0;False;93;FLOAT;0;False;97;FLOAT2;0,0;False;198;FLOAT4;0,0,0,0;False;199;FLOAT2;0,0;False;94;SAMPLERSTATE;0;False;5;COLOR;86;FLOAT;84;FLOAT;85;FLOAT;82;FLOAT;83
Node;AmplifyShaderEditor.SamplerNode;29;-672,544;Inherit;True;Property;_TextureSample27;Texture Sample 27;2;0;Create;True;0;0;0;False;0;False;5;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;25;256,240;Inherit;True;GGX Light;-1;;146;94c86e534cb1a6b4094fe1425627bfb1;0;5;15;COLOR;0,0,0,0;False;3;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;9;FLOAT;0.96;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;608,48;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;608,208;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;32;800,176;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;13;-1696,432;Inherit;False;Lightmap UV;-1;;157;1940f027d0458684eb0ad486f669d7d5;1,1,0;0;1;FLOAT2;0
Node;AmplifyShaderEditor.TexelSizeNode;14;-1488,576;Inherit;False;-1;1;0;SAMPLER2D;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;15;-1232,432;Inherit;False;Bicubic Precompute;-1;;158;818835145cc522e4da1f9915d8b8a984;0;2;5;FLOAT2;0,0;False;55;FLOAT4;0,0,0,0;False;2;FLOAT4;34;FLOAT2;54
Node;AmplifyShaderEditor.FunctionNode;16;-976,432;Inherit;False;Bicubic Sample;-1;;159;ce0e14d5ad5eac645b2e5892ab3506ff;2,92,2,72,2;7;99;SAMPLER2D;0;False;91;SAMPLER2DARRAY;0;False;93;FLOAT;0;False;97;FLOAT2;0,0;False;198;FLOAT4;0,0,0,0;False;199;FLOAT2;0,0;False;94;SAMPLERSTATE;0;False;5;COLOR;86;FLOAT;84;FLOAT;85;FLOAT;82;FLOAT;83
Node;AmplifyShaderEditor.StaticSwitch;33;960,48;Inherit;False;Property;_LIGHTMAP_OFF1;LIGHTMAP_OFF;2;0;Create;True;0;0;0;False;0;False;0;0;0;False;LIGHTMAP_OFF;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1280,48;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;GGX Lighting Demo;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;20;1;19;0
WireConnection;1;0;3;0
WireConnection;17;19;1;0
WireConnection;21;0;20;0
WireConnection;9;0;4;0
WireConnection;6;5;8;0
WireConnection;6;55;9;0
WireConnection;24;1;17;23
WireConnection;24;0;21;0
WireConnection;7;99;4;0
WireConnection;7;198;6;34
WireConnection;7;199;6;54
WireConnection;7;94;4;1
WireConnection;29;0;5;0
WireConnection;29;1;1;0
WireConnection;25;15;34;0
WireConnection;25;5;24;0
WireConnection;25;9;35;0
WireConnection;27;0;21;0
WireConnection;27;1;25;0
WireConnection;28;0;7;86
WireConnection;28;1;25;0
WireConnection;28;2;29;4
WireConnection;32;0;27;0
WireConnection;32;1;28;0
WireConnection;14;0;5;0
WireConnection;15;5;13;0
WireConnection;15;55;14;0
WireConnection;16;99;5;0
WireConnection;16;198;15;34
WireConnection;16;199;15;54
WireConnection;16;94;5;1
WireConnection;33;1;27;0
WireConnection;33;0;32;0
WireConnection;0;0;33;0
ASEEND*/
//CHKSM=01E915B02FDA19C46186F9F89528DB2185FFEE35