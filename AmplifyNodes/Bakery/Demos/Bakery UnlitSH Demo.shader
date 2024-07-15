// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Bakery UnlitSH Demo"
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
			#define NOURP


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform sampler2D _RNM0;
			uniform sampler2D _RNM1;
			uniform sampler2D _RNM2;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				
				o.ase_texcoord1.xy = v.ase_texcoord2.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
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
				float2 texCoord29 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g501 = unity_LightmapST;
				float2 LightmapUV31 = ( ( texCoord29 * (temp_output_1_0_g501).xy ) + (temp_output_1_0_g501).zw );
				float2 uv14_g502 = LightmapUV31;
				float3 decodeLightMap34 = DecodeLightmap(UNITY_SAMPLE_TEX2D( unity_Lightmap, uv14_g502 ));
				float3 L03_g470 = decodeLightMap34;
				float3 L020_g483 = L03_g470;
				float2 lightmapUV11_g470 = LightmapUV31;
				float2 lightmapUV27_g473 = lightmapUV11_g470;
				float3 temp_cast_1 = (1.0).xxx;
				float3 nL1x22_g473 = ( ( tex2D( _RNM0, lightmapUV27_g473 ).rgb * 2.0 ) - temp_cast_1 );
				float3 nL1x22_g475 = nL1x22_g473;
				float3 L034_g473 = L03_g470;
				float3 L018_g475 = L034_g473;
				float3 temp_output_8_0_g475 = ( L018_g475 * 2.0 );
				float3 L1x67_g473 = ( nL1x22_g475 * temp_output_8_0_g475 );
				float3 L1x49_g470 = L1x67_g473;
				float3 L1x18_g483 = L1x49_g470;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 worldNormal8_g470 = normalizedWorldNormal;
				float3 Direction19_g483 = worldNormal8_g470;
				float3 temp_cast_2 = (1.0).xxx;
				float3 nL1y23_g473 = ( ( tex2D( _RNM1, lightmapUV27_g473 ).rgb * 2.0 ) - temp_cast_2 );
				float3 nL1y23_g475 = nL1y23_g473;
				float3 L1y68_g473 = ( nL1y23_g475 * temp_output_8_0_g475 );
				float3 L1y50_g470 = L1y68_g473;
				float3 L1y22_g483 = L1y50_g470;
				float3 temp_cast_3 = (1.0).xxx;
				float3 nL1z24_g473 = ( ( tex2D( _RNM2, lightmapUV27_g473 ).rgb * 2.0 ) - temp_cast_3 );
				float3 nL1z24_g475 = nL1z24_g473;
				float3 L1z69_g473 = ( nL1z24_g475 * temp_output_8_0_g475 );
				float3 L1z51_g470 = L1z69_g473;
				float3 L1z25_g483 = L1z51_g470;
				float3 temp_output_9_0_g483 = ( L020_g483 + ( L1x18_g483 * (Direction19_g483).x ) + ( L1y22_g483 * (Direction19_g483).y ) + ( L1z25_g483 * (Direction19_g483).z ) );
				float3 temp_cast_4 = (1.0).xxx;
				float dotResult2_g474 = dot( L034_g473 , temp_cast_4 );
				float lumaL062_g470 = dotResult2_g474;
				float L06_g472 = lumaL062_g470;
				float3 temp_cast_5 = (1.0).xxx;
				float dotResult3_g474 = dot( L1x67_g473 , temp_cast_5 );
				float lumaL1x63_g470 = dotResult3_g474;
				float3 temp_cast_6 = (1.0).xxx;
				float dotResult4_g474 = dot( L1y68_g473 , temp_cast_6 );
				float lumaL1y64_g470 = dotResult4_g474;
				float3 temp_cast_7 = (1.0).xxx;
				float dotResult5_g474 = dot( L1z69_g473 , temp_cast_7 );
				float lumaL1z65_g470 = dotResult5_g474;
				float3 appendResult69_g470 = (float3(lumaL1x63_g470 , lumaL1y64_g470 , lumaL1z65_g470));
				float3 L17_g472 = appendResult69_g470;
				float3 R112_g472 = ( 0.5 * L17_g472 );
				float lenR117_g472 = length( R112_g472 );
				float temp_output_48_0_g472 = ( lenR117_g472 / L06_g472 );
				float a_const52_g472 = ( ( 1.0 - temp_output_48_0_g472 ) / ( temp_output_48_0_g472 + 1.0 ) );
				float power42_g472 = ( ( ( lenR117_g472 / L06_g472 ) * 2.0 ) + 1.0 );
				float3 normalizeResult24_g472 = normalize( R112_g472 );
				float3 n8_g472 = worldNormal8_g470;
				float dotResult19_g472 = dot( normalizeResult24_g472 , n8_g472 );
				float phi28_g472 = ( ( dotResult19_g472 * 0.5 ) + 0.5 );
				float lumaSH76_g470 = ( L06_g472 * ( 1.0 - a_const52_g472 ) * ( power42_g472 + 1.0 ) * pow( phi28_g472 , power42_g472 ) );
				float3 temp_cast_8 = (1.0).xxx;
				float dotResult31_g483 = dot( temp_output_9_0_g483 , temp_cast_8 );
				float temp_output_10_0_g471 = dotResult31_g483;
				float lerpResult7_g471 = lerp( 1.0 , ( lumaSH76_g470 / temp_output_10_0_g471 ) , saturate( ( temp_output_10_0_g471 * 16.0 ) ));
				float3 temp_cast_9 = (0.0).xxx;
				
				
				finalColor = float4( max( ( temp_output_9_0_g483 * lerpResult7_g471 ) , temp_cast_9 ) , 0.0 );
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
Node;AmplifyShaderEditor.TextureCoordinatesNode;29;-1792,-368;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;30;-1568,-368;Inherit;False;LightmapUV;-1;;500;92835087cc0d4ca44aa7c5ca68cee410;0;1;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;31;-1344,-368;Inherit;False;LightmapUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;32;-1120,-368;Inherit;False;Lightmap Data;69;;502;9544411dceb2065419e5d62a80e63024;0;1;3;FLOAT2;0,0;False;12;COLOR;0;COLOR;12;COLOR;23;COLOR;30;COLOR;39;COLOR;45;COLOR;56;COLOR;62;COLOR;69;COLOR;76;COLOR;89;COLOR;92
Node;AmplifyShaderEditor.GetLocalVarNode;33;-656,-272;Inherit;False;31;LightmapUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DecodeLightmapHlpNode;34;-688,-368;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;28;-448,-368;Inherit;False;BakerySH;0;;470;ee80efc6828f286459adbfe8c5eb1ae2;0;3;1;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;9;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;-224,-368;Float;False;True;-1;2;ASEMaterialInspector;100;5;Bakery UnlitSH Demo;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Opaque=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;2;Include;;False;;Native;False;0;0;;Define;NOURP;False;;Custom;False;0;0;;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;30;4;29;0
WireConnection;31;0;30;0
WireConnection;32;3;31;0
WireConnection;34;0;32;0
WireConnection;28;1;34;0
WireConnection;28;9;33;0
WireConnection;5;0;28;0
ASEEND*/
//CHKSM=2A5A0C9D217EE98919B630985AFC1E638A396EE9