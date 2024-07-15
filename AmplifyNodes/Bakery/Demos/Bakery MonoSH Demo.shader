// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Bakery MonoSH Demo"
{
	Properties
	{
		
	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord1.xy = v.ase_texcoord2.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float2 texCoord3_g552 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 lightmapUV6_g552 = texCoord3_g552;
				float2 lightmapUV22_g565 = lightmapUV6_g552;
				float2 uv14_g573 = lightmapUV22_g565;
				float4 temp_output_1_0_g574 = unity_LightmapST;
				float3 decodeLightMap8_g565 = DecodeLightmap(UNITY_SAMPLE_TEX2D( unity_Lightmap, ( ( uv14_g573 * (temp_output_1_0_g574).xy ) + (temp_output_1_0_g574).zw ) ));
				float3 L014_g552 = decodeLightMap8_g565;
				float3 L020_g557 = L014_g552;
				float2 uv14_g566 = lightmapUV22_g565;
				float4 temp_output_1_0_g568 = unity_LightmapST;
				float3 temp_cast_1 = (1.0).xxx;
				float3 nL124_g552 = ( ( (UNITY_SAMPLE_TEX2D_SAMPLER( unity_LightmapInd,unity_Lightmap, ( ( uv14_g566 * (temp_output_1_0_g568).xy ) + (temp_output_1_0_g568).zw ) )).rgb * 2.0 ) - temp_cast_1 );
				float3 nL112_g553 = nL124_g552;
				float3 L011_g553 = L014_g552;
				float3 temp_output_6_0_g553 = ( L011_g553 * 2.0 );
				float3 L1x38_g552 = ( (nL112_g553).x * temp_output_6_0_g553 );
				float3 L1x18_g557 = L1x38_g552;
				float2 texCoord23 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g334 = unity_LightmapST;
				float2 uv14_g433 = ( ( texCoord23 * (temp_output_1_0_g334).xy ) + (temp_output_1_0_g334).zw );
				float3 decodeLightMap20 = DecodeLightmap(UNITY_SAMPLE_TEX2D( unity_Lightmap, uv14_g433 ));
				float3 normalWorld5_g552 = decodeLightMap20;
				float3 Direction19_g557 = normalWorld5_g552;
				float3 L1y39_g552 = ( (nL112_g553).y * temp_output_6_0_g553 );
				float3 L1y22_g557 = L1y39_g552;
				float3 L1z40_g552 = ( (nL112_g553).z * temp_output_6_0_g553 );
				float3 L1z25_g557 = L1z40_g552;
				float3 temp_output_9_0_g557 = ( L020_g557 + ( L1x18_g557 * (Direction19_g557).x ) + ( L1y22_g557 * (Direction19_g557).y ) + ( L1z25_g557 * (Direction19_g557).z ) );
				float3 temp_cast_3 = (1.0).xxx;
				float dotResult2_g555 = dot( L014_g552 , temp_cast_3 );
				float lumaL051_g552 = dotResult2_g555;
				float L06_g554 = lumaL051_g552;
				float3 temp_cast_4 = (1.0).xxx;
				float dotResult3_g555 = dot( L1x38_g552 , temp_cast_4 );
				float3 temp_cast_5 = (1.0).xxx;
				float dotResult4_g555 = dot( L1y39_g552 , temp_cast_5 );
				float3 temp_cast_6 = (1.0).xxx;
				float dotResult5_g555 = dot( L1z40_g552 , temp_cast_6 );
				float3 appendResult23_g555 = (float3(dotResult3_g555 , dotResult4_g555 , dotResult5_g555));
				float3 lumaL152_g552 = appendResult23_g555;
				float3 L17_g554 = lumaL152_g552;
				float3 R112_g554 = ( 0.5 * L17_g554 );
				float lenR117_g554 = length( R112_g554 );
				float temp_output_48_0_g554 = ( lenR117_g554 / L06_g554 );
				float a_const52_g554 = ( ( 1.0 - temp_output_48_0_g554 ) / ( temp_output_48_0_g554 + 1.0 ) );
				float power42_g554 = ( ( ( lenR117_g554 / L06_g554 ) * 2.0 ) + 1.0 );
				float3 normalizeResult24_g554 = normalize( R112_g554 );
				float3 n8_g554 = normalWorld5_g552;
				float dotResult19_g554 = dot( normalizeResult24_g554 , n8_g554 );
				float phi28_g554 = ( ( dotResult19_g554 * 0.5 ) + 0.5 );
				float lumaSH63_g552 = ( L06_g554 * ( 1.0 - a_const52_g554 ) * ( power42_g554 + 1.0 ) * pow( phi28_g554 , power42_g554 ) );
				float3 temp_cast_7 = (1.0).xxx;
				float dotResult31_g557 = dot( temp_output_9_0_g557 , temp_cast_7 );
				float temp_output_10_0_g556 = dotResult31_g557;
				float lerpResult7_g556 = lerp( 1.0 , ( lumaSH63_g552 / temp_output_10_0_g556 ) , saturate( ( temp_output_10_0_g556 * 16.0 ) ));
				float3 temp_cast_8 = (0.0).xxx;
				float3 temp_output_94_0_g552 = max( ( temp_output_9_0_g557 * lerpResult7_g556 ) , temp_cast_8 );
				
				
				finalColor = float4( temp_output_94_0_g552 , 0.0 );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19501
Node;AmplifyShaderEditor.TextureCoordinatesNode;23;-1392,-288;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;22;-1184,-288;Inherit;False;LightmapUV;-1;;333;92835087cc0d4ca44aa7c5ca68cee410;0;1;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;30;-976,-288;Inherit;False;Lightmap Data;66;;433;9544411dceb2065419e5d62a80e63024;0;1;3;FLOAT2;0,0;False;12;COLOR;0;COLOR;12;COLOR;23;COLOR;30;COLOR;39;COLOR;45;COLOR;56;COLOR;62;COLOR;69;COLOR;76;COLOR;89;COLOR;92
Node;AmplifyShaderEditor.DecodeLightmapHlpNode;20;-576,-288;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;39;-240,-288;Inherit;False;BakeryMonoSH;0;;552;2c17d669b268eb24fa124e99362b5fcc;0;2;2;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;40;0,-288;Float;False;True;-1;2;ASEMaterialInspector;100;5;Bakery MonoSH Demo;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Opaque=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;22;4;23;0
WireConnection;30;3;22;0
WireConnection;20;0;30;0
WireConnection;39;2;20;0
WireConnection;40;0;39;0
ASEEND*/
//CHKSM=0E6D5C66FC15DA2469AE826F8AB6417DCE9037C3