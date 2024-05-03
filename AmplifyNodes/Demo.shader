// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TestingGrounds"
{
	Properties
	{
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
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
			float2 temp_output_15_0_g430 = ( float2( 0.5,0.5 ) * 0.5 );
			float2 break9_g416 = i.uv_texcoord;
			float temp_output_4_0_g416 = radians( ( _SinTime.y * 180.0 ) );
			float temp_output_6_0_g416 = cos( temp_output_4_0_g416 );
			float temp_output_7_0_g416 = sin( temp_output_4_0_g416 );
			float2 appendResult15_g416 = (float2(( ( break9_g416.x * temp_output_6_0_g416 ) - ( break9_g416.y * temp_output_7_0_g416 ) ) , ( ( break9_g416.x * temp_output_7_0_g416 ) + ( break9_g416.y * temp_output_6_0_g416 ) )));
			float2 texCoord33_g414 = appendResult15_g416;
			float2 GridSize34_g414 = float2( 4,4 );
			float2 temp_cast_0 = (_Time.y).xx;
			float2 OffsetGlobal37_g414 = temp_cast_0;
			float2 break9_g415 = ( frac( ( frac( ( texCoord33_g414 * GridSize34_g414 ) ) + OffsetGlobal37_g414 ) ) - float2( 0.5,0.5 ) );
			float mulTime322 = _Time.y * 90.0;
			float temp_output_4_0_g415 = radians( mulTime322 );
			float temp_output_6_0_g415 = cos( temp_output_4_0_g415 );
			float temp_output_7_0_g415 = sin( temp_output_4_0_g415 );
			float2 appendResult15_g415 = (float2(( ( break9_g415.x * temp_output_6_0_g415 ) - ( break9_g415.y * temp_output_7_0_g415 ) ) , ( ( break9_g415.x * temp_output_7_0_g415 ) + ( break9_g415.y * temp_output_6_0_g415 ) )));
			float2 temp_output_12_0_g430 = abs( ( float2( 0,0 ) - appendResult15_g415 ) );
			float2 temp_output_3_0_g431 = ( temp_output_15_0_g430 - temp_output_12_0_g430 );
			float2 temp_output_4_0_g431 = fwidth( temp_output_3_0_g431 );
			float2 break51_g430 = saturate( ( temp_output_3_0_g431 / temp_output_4_0_g431 ) );
			float2 temp_output_2_0_g417 = GridSize34_g414;
			float2 temp_output_5_0_g417 = ( ( texCoord33_g414 + ( OffsetGlobal37_g414 / GridSize34_g414 ) ) * temp_output_2_0_g417 );
			float temp_output_347_0 = ( (frac( ( floor( temp_output_5_0_g417 ) / temp_output_2_0_g417 ) )).x * 4.0 );
			float3 gammaToLinear462 = GammaToLinearSpace( ( temp_output_347_0 == 0.0 ? float4( 0.9607843,0.07058824,0.3254902,1 ) : ( temp_output_347_0 == 1.0 ? float4( 0.0627451,0.9882353,0.6588235,1 ) : ( temp_output_347_0 == 2.0 ? float4( 0.2,0.7215686,0.9843137,1 ) : float4( 0.9843137,0.8509804,0.3529412,1 ) ) ) ).rgb );
			o.Emission = ( ( break51_g430.x * break51_g430.y ) * gammaToLinear462 ) + 1E-5;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.CommentaryNode;424;-3072,-1248;Inherit;False;324;259;_VRChat/Mirror Info;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;422;-3808,-1008;Inherit;False;312;256;_VRChat/CameraMode;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;420;-3474,-1250;Inherit;False;388;547;_VRChat/Camera Mask;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;418;-3792,-1248;Inherit;False;292;235;_VRChat/Camera Info;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;416;-3968,-528;Inherit;False;757;363;_Utils/Smooth Lerp;5;407;406;413;415;411;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;401;-3200,-528;Inherit;False;356;328;_Utils/Stairstep (Terracing);0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;398;-2144,-1232;Inherit;False;816;276;_Shader Trixx/ Pixelate (AA);2;395;397;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;388;-2512,-1232;Inherit;False;356;331;_Shader Trixx/VR Info;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;373;-2480,-368;Inherit;False;307;285;_Math Utils/Smooth Min;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;371;-2128,-368;Inherit;False;297;276;_Math Utils/Smooth Max;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;363;-2480,-704;Inherit;False;221;269;_Math Utils/Filtered Cosine;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;329;-2912,688;Inherit;False;1326.3;604.3003;_Coordinate Mapping/Repeat Domain;9;351;322;325;324;315;350;451;463;469;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;350;-2560,1008;Inherit;False;756;280;Demo Colours;5;343;344;345;347;462;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;320;-4208,688;Inherit;False;380;304;_Coordinate Mapping/Rotate UV;1;319;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;309;496,736;Inherit;False;933.8081;459;_2D Shapes/Round Out Shape;5;300;307;306;308;379;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;291;-1296,736;Inherit;False;1768;616;_2D Shape/Realize SDF;13;296;293;292;295;269;268;263;265;273;271;285;297;380;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;285;-1232,992;Inherit;False;629;244;Crazy Lerp Mask;7;274;277;278;281;280;279;283;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;147;-1296,288;Inherit;False;820;384;_2D Shapes/Line Shape;5;253;254;262;261;376;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;252;-1296,-32;Inherit;False;673;304;_2D Shapes/Grid Anti Aliased;3;245;247;251;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;242;48,-400;Inherit;False;1104.27;660.6033;_2D Shapes/Combine SDFs;7;241;215;214;216;239;221;238;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;207;-1200,-400;Inherit;False;910.9182;325.3818;_2D Shapes/Circle Normal Map;6;197;206;204;200;203;236;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;194;-272,-400;Inherit;False;297;286;_2D Shapes/Checkers Anti Aliased;1;243;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;190;976,288;Inherit;False;336;285;_2D Shapes/Analytical Dot Matrix;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;182;-2704,64;Inherit;False;1098;531;_Coordinate Mapping/UV Remapping;7;174;175;176;177;178;181;180;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;173;-3920,1024;Inherit;False;982;321;_Coordinate Mapping/Project to Square;6;157;234;172;159;160;158;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;155;-464,288;Inherit;False;1044.621;328.6392;_2D Shapes/Make Annular;3;298;299;378;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;131;-3344,64;Inherit;False;614;498;_Coordinate Mapping/Smooth UV Grid;3;132;130;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;121;-4208,64;Inherit;False;856.8926;617.2144;_Coordinate Mapping/UV Padding;6;112;106;108;352;354;118;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;118;-3856,112;Inherit;False;495.8215;338.6786;Padding Viewer;2;120;117;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;84;-1984,-704;Inherit;False;365;322;_Utils/Square Wave;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;73;608,288;Inherit;False;337;327;_2D Shapes/Square Shape;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;34;-3808,688;Inherit;False;873.442;323.9419;_Coordinate Mapping/Point on Circle;5;28;235;94;111;49;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-2240,-704;Inherit;False;234.8733;286;_Math Utils/Smoothstep 10;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;14;-560,-64;Inherit;False;586;320;_2D Shapes/Circle Shape;3;4;5;50;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;397;-1616,-1184;Inherit;True;Property;_TextureSample2;Texture Sample 2;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;395;-2128,-1184;Inherit;True;Property;_Texture1;Texture 1;4;0;Create;True;0;0;0;False;0;False;e86ba70d2363b9443beac28a6a370b87;e86ba70d2363b9443beac28a6a370b87;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;126;-3040,304;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Derivative;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;117;-3840,160;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;130;-3296,128;Inherit;True;Property;_MainTex;_MainTex;0;0;Create;True;0;0;0;False;0;False;e24b2c680edaa90458d31f11544d79ca;e24b2c680edaa90458d31f11544d79ca;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
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
Node;AmplifyShaderEditor.TexturePropertyNode;180;-2176,112;Inherit;True;Property;_Texture0;Texture 0;3;0;Create;True;0;0;0;False;0;False;e24b2c680edaa90458d31f11544d79ca;e24b2c680edaa90458d31f11544d79ca;False;white;LockedToTexture2D;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;181;-1904,112;Inherit;True;Property;_TextureSample1;Texture Sample 1;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;132;-3328,320;Inherit;True;Smooth UV Grid;-1;;259;97583f406bc6ec545adaf71cae9af065;0;2;1;FLOAT2;0,0;False;2;FLOAT2;16,16;False;3;FLOAT2;0;FLOAT2;13;FLOAT2;18
Node;AmplifyShaderEditor.ColorNode;407;-3712,-480;Inherit;False;Constant;_Color3;Color 3;4;0;Create;True;0;0;0;False;0;False;0.9843137,0,0.3529412,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;406;-3920,-480;Inherit;False;Constant;_Color2;Color 2;4;0;Create;True;0;0;0;False;0;False;0.2,0.7215686,0.9843137,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;413;-3760,-304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;415;-3648,-304;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;411;-3920,-304;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;200;-544,-336;Inherit;True;Circle Normal Map;-1;;311;d8f444558408a464c8e559d7077a6f89;0;3;1;FLOAT2;0,0;False;27;FLOAT2;0.5,0.5;False;25;FLOAT;0.5;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;204;-960,-256;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-1120,-256;Inherit;False;Constant;_Float7;Float 7;3;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;197;-736,-224;Inherit;False;Constant;_Float6;Float 6;3;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;5;-528,16;Inherit;False;Constant;_Vector0;Vector 0;0;0;Create;True;0;0;0;False;0;False;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;4;-528,144;Inherit;False;Constant;_Float0;Float 0;0;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;236;-1152,-352;Inherit;False;Point on Circle;-1;;312;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.FunctionNode;203;-832,-336;Inherit;False;UV Padding;-1;;313;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;243;-240,-352;Inherit;True;Checkers Anti Aliased;-1;;314;aac1f3acf1f39104aa2463a59dfeaa49;0;3;1;FLOAT2;0,0;False;3;FLOAT2;8,8;False;50;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;245;-944,16;Inherit;True;Grid Anti Aliased;-1;;317;78e8261f160bf9f45b077ddb8c6055b0;0;4;1;FLOAT2;0,0;False;3;FLOAT;0.9;False;22;FLOAT2;4,4;False;23;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;247;-1248,16;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;-1104,32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;239;576,-320;Inherit;False;UV Padding;-1;;320;e808cf67b3d2e6148bbadf469b864123;0;2;1;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;214;832,-336;Inherit;True;Circle Shape;-1;;321;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.1;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;215;496,-96;Inherit;True;Circle Shape;-1;;323;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.1;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.RangedFloatNode;241;528,176;Inherit;False;Constant;_Float9;Float 9;3;0;Create;True;0;0;0;False;0;False;0.05931375;0;-0.03;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;216;304,-176;Inherit;False;Constant;_Float8;Float 8;3;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;238;272,-336;Inherit;False;Point on Circle;-1;;325;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.SimpleTimeNode;221;96,-336;Inherit;False;1;0;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;261;-1104,528;Inherit;False;Point on Circle;-1;;326;03330499ca46d1345847ce0e1a47b4ef;0;1;1;FLOAT;0;False;2;FLOAT2;0;FLOAT2;18
Node;AmplifyShaderEditor.SimpleTimeNode;262;-1280,544;Inherit;False;1;0;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;254;-944,384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;253;-1104,368;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;50;-288,-16;Inherit;True;Circle Shape;-1;;327;6501d6360b2b325478805adac1925aca;0;3;3;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;1;FLOAT;0.5;False;3;FLOAT;0;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.SimpleTimeNode;271;-1232,816;Inherit;False;1;0;FLOAT;2.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CosOpNode;273;-1056,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;265;-752,816;Inherit;False;FLOAT2;4;0;FLOAT;0.5;False;1;FLOAT;0.5;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;283;-1232,1040;Inherit;False;1;0;FLOAT;0.284;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;279;-768,1040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;280;-944,1040;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;281;-1056,1040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;278;-1232,1120;Inherit;False;2;2;0;FLOAT;8;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;277;-1088,1120;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;274;-768,1136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;268;-944,816;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.2;False;4;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;269;-224,784;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;293;-48,1168;Inherit;False;Constant;_Color1;Color 1;3;0;Create;True;0;0;0;False;0;False;0.9607843,0.07058824,0.3254902,1;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;292;-240,1168;Inherit;False;Constant;_Color0;Color 0;3;0;Create;True;0;0;0;False;0;False;0.2,0.7215686,0.9843137,1;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
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
Node;AmplifyShaderEditor.FunctionNode;376;-784,368;Inherit;True;Line Shape;-1;;334;e52123430190daa40b23aae88c535355;0;4;3;FLOAT2;0,0;False;1;FLOAT2;0.25,0.25;False;2;FLOAT2;0.5,0.75;False;30;FLOAT;0.025;False;4;FLOAT;0;FLOAT;32;FLOAT;33;FLOAT2;19
Node;AmplifyShaderEditor.FunctionNode;378;272,352;Inherit;True;Make Annular;-1;;338;3505ed6aa0eeda045b3e3cf3100ae1c6;0;2;1;FLOAT;0;False;2;FLOAT;0.02;False;3;FLOAT;0;FLOAT;7;FLOAT;8
Node;AmplifyShaderEditor.FunctionNode;379;1152,784;Inherit;True;Realize SDF;-1;;340;95f36825f6dd0604ca1e8f628c37f9c2;0;2;1;FLOAT;0;False;2;FLOAT;0;False;2;FLOAT;0;FLOAT;5
Node;AmplifyShaderEditor.FunctionNode;380;0,784;Inherit;True;Realize SDF;-1;;342;95f36825f6dd0604ca1e8f628c37f9c2;0;2;1;FLOAT;0;False;2;FLOAT;0;False;2;FLOAT;0;FLOAT;5
Node;AmplifyShaderEditor.FunctionNode;425;-3744,-1200;Inherit;False;Camera Info;-1;;348;fa347273eb86c894d8c0bd7e0231bf38;0;0;4;FLOAT3;37;FLOAT;40;FLOAT;0;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;428;-3776,-944;Inherit;False;Camera Mode;-1;;357;2b52c30b734a7fd48b2d0c1b92432d16;0;0;5;FLOAT;18;FLOAT;0;FLOAT;6;FLOAT;11;FLOAT;16
Node;AmplifyShaderEditor.FunctionNode;429;-3424,-1200;Inherit;False;Camera Mask;-1;;358;af8cf65b70d414e4a9ee1127e00bd241;0;0;17;INT;7;FLOAT;0;FLOAT;11;FLOAT;14;FLOAT;19;FLOAT;23;FLOAT;26;FLOAT;32;FLOAT;36;FLOAT;39;FLOAT;44;FLOAT;48;FLOAT;50;FLOAT;56;FLOAT;60;FLOAT;63;FLOAT;68
Node;AmplifyShaderEditor.FunctionNode;431;-3024,-1200;Inherit;False;Mirror Info;-1;;371;a29131825ee0c8542b3ae01677e5c88b;0;0;5;FLOAT;0;FLOAT;3;FLOAT;7;FLOAT;12;FLOAT3;15
Node;AmplifyShaderEditor.FunctionNode;448;-2464,-1184;Inherit;False;VR Info;-1;;379;c8ff9c6e2553b3349895137fbcf86e42;0;0;8;FLOAT;96;FLOAT;77;FLOAT;69;FLOAT;67;FLOAT;6;FLOAT;33;FLOAT;56;FLOAT;38
Node;AmplifyShaderEditor.FunctionNode;449;-1904,-1184;Inherit;True;Pixelate (AA);1;;390;bb0fdc552a56b294cb3a97cf188309c6;0;2;8;SAMPLER2D;;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;450;-3488,-480;Inherit;True;Smooth Lerp;-1;;392;2b076f1368a1dad458b20e5f0c213538;0;3;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;452;-3136,-480;Inherit;True;Stairstep (Terracing);-1;;397;877080732b544ff4e9dddc86474cf10e;0;2;1;FLOAT2;0,0;False;2;FLOAT;8;False;2;FLOAT2;0;FLOAT2;7
Node;AmplifyShaderEditor.FunctionNode;453;-2448,-656;Inherit;True;Filtered Cosine;-1;;398;03c220405a768864391cd325b530d439;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;454;-944,1136;Inherit;False;Smoothstep 10;-1;;399;c24375f1f1f682347bf1da27344b5d59;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;455;992,352;Inherit;True;Analytical Dot Matrix;-1;;400;b7436b6dab7aad14d8c1bd50d43c5c69;0;2;2;FLOAT2;0,0;False;1;FLOAT2;16,16;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;456;-2192,-640;Inherit;True;Smoothstep 10;-1;;405;c24375f1f1f682347bf1da27344b5d59;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;458;-1968,-640;Inherit;True;Square Wave;-1;;408;888ead0ecd36ca3428156bb2ff78378f;0;2;1;FLOAT;0;False;2;FLOAT;0.5;False;2;FLOAT;11;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;459;848,-64;Inherit;True;Combine SDFs;-1;;410;4b4969416de73314ebd94b9fb8fe7c3a;0;3;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;2;FLOAT;17;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;460;-2464,-320;Inherit;True;Smooth Min;-1;;412;6c53ae6a45931c048a3fd32e4f74e638;0;3;1;FLOAT;0;False;2;FLOAT;0.25;False;3;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;461;-2112,-320;Inherit;True;Smooth Max;-1;;413;2f3646f307f112b47ad6f60398ee6483;0;3;13;FLOAT;0;False;14;FLOAT;0.25;False;10;FLOAT;0.1;False;1;FLOAT;12
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1248,-896;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;TestingGrounds;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SimpleTimeNode;315;-2768,736;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;324;-2896,896;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;325;-2736,928;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;322;-2768,816;Inherit;False;1;0;FLOAT;90;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;451;-2560,736;Inherit;True;Repeat Domain;-1;;414;51a921dc32a4b1e44b5115fb70691db9;0;6;8;FLOAT2;4,4;False;9;FLOAT2;0,0;False;10;FLOAT2;0,0;False;17;FLOAT2;0.5,0.5;False;11;FLOAT;0;False;15;FLOAT;0;False;2;FLOAT2;0;FLOAT2;54
Node;AmplifyShaderEditor.GammaToLinearNode;462;-2016,1056;Inherit;True;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
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
Node;AmplifyShaderEditor.FunctionNode;469;-2192,736;Inherit;True;Square Shape;-1;;430;55f7f7f8b5f050641a2c5ef76c40089d;0;3;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;5;FLOAT2;0.5,0.5;False;3;FLOAT;52;FLOAT;0;FLOAT;50
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
WireConnection;200;27;203;0
WireConnection;200;25;197;0
WireConnection;204;0;197;0
WireConnection;204;1;206;0
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
WireConnection;261;1;262;0
WireConnection;254;0;253;3
WireConnection;254;1;253;3
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
WireConnection;376;1;254;0
WireConnection;376;2;261;18
WireConnection;378;1;465;52
WireConnection;378;2;299;0
WireConnection;379;1;300;0
WireConnection;380;1;269;0
WireConnection;449;8;395;0
WireConnection;450;1;406;0
WireConnection;450;2;407;0
WireConnection;450;3;415;0
WireConnection;454;1;277;0
WireConnection;459;1;214;0
WireConnection;459;2;215;0
WireConnection;459;3;241;0
WireConnection;0;15;351;0
WireConnection;325;0;324;2
WireConnection;451;10;315;0
WireConnection;451;11;322;0
WireConnection;451;15;325;0
WireConnection;462;0;343;0
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
WireConnection;469;1;451;0
ASEEND*/
//CHKSM=2DDE9CC106C3F10BBBD8707FB1DF484971450BBB