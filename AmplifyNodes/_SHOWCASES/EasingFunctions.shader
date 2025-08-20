// Made with Amplify Shader Editor v1.9.9.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EasingFunctions"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.5
		#define ASE_VERSION 19903
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			half filler;
		};

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19903
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;190;-1568,-112;Inherit;False;954.7324;356.6484;EaseInOutNth;3;185;189;188;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;181;2544,1264;Inherit;False;616.0172;348;EaseInOutBounce;1;179;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;176;1952,896;Inherit;False;585;355;EaseOutElastic;2;158;426;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;175;1952,1264;Inherit;False;583;350;EaseOutBounce;1;173;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;170;1360,1264;Inherit;False;585;355;EaseInBounce;2;168;425;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;165;2544,896;Inherit;False;617;355;EaseInOutElastic;2;163;424;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;155;1360,896;Inherit;False;585;355;EaseInElastic;2;153;439;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;150;2544,528;Inherit;False;617;355;EaseInOutBack;1;147;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;144;1952,528;Inherit;False;585;355;EaseOutBack;1;142;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;139;1360,528;Inherit;False;585;355;EaseInBack;1;137;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;134;2544,160;Inherit;False;614.8999;357.6001;EaseInOutCirc;1;132;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;129;1952,160;Inherit;False;585;355;EaseOutCirc;3;125;126;127;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;124;1360,160;Inherit;False;585;355;EaseInCirc;1;122;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;119;1952,-208;Inherit;False;585;355;EaseOutExpo;1;117;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;114;2544,-208;Inherit;False;617;355;EaseInOutExpo;1;112;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;109;1360,-208;Inherit;False;585;355;EaseInExpo;3;105;106;107;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;104;624,1264;Inherit;False;617;355;EaseInOutQuint;1;102;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;99;32,1264;Inherit;False;585;355;EaseOutQuint;1;97;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;-560,1264;Inherit;False;585;355;EaseInQuint;3;90;91;92;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;624,896;Inherit;False;617;355;EaseInOutQuart;1;87;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;84;32,896;Inherit;False;585;355;EaseOutQuart;2;82;429;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;79;-560,896;Inherit;False;585;355;EaseInQuart;1;77;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;74;624,528;Inherit;False;617;355;EaseInOutCubic;1;72;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;69;32,528;Inherit;False;585;355;EaseOutCubic;3;65;66;67;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;64;-560,528;Inherit;False;585;355;EaseInCubic;3;60;61;62;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;59;624,160;Inherit;False;617;355;EaseInOutQuad;1;57;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;54;32,160;Inherit;False;585;355;EaseOutQuad;1;52;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;49;-560,160;Inherit;False;585;355;EaseInQuad;1;47;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;624,-208;Inherit;False;615;355;EaseInOutSine;1;42;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;39;32,-208;Inherit;False;585;355;EaseOutSine;3;35;34;37;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;32;-560,-208;Inherit;False;586;355;EaseInSine;1;30;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;-512,-32;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;35;80,-96;Inherit;False;EaseOutSine;-1;;145;436dd14d2e38dec41a7b3680c5809848;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;34;80,-160;Inherit;False;EaseOutSine;-1;;146;436dd14d2e38dec41a7b3680c5809848;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;37;80,-32;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;47;-512,336;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;52;80,336;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;57;704,336;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;704,-32;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;60;-512,576;Inherit;False;EaseInCubic;-1;;244;75fc1c97799042d4ea7b071ce9cef81a;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;61;-512,640;Inherit;False;EaseInCubic;-1;;245;75fc1c97799042d4ea7b071ce9cef81a;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;62;-512,704;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;65;80,576;Inherit;False;EaseOutCubic;-1;;252;b8d376702bac1454ab2c34e7cf38bdd5;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;66;80,640;Inherit;False;EaseOutCubic;-1;;253;b8d376702bac1454ab2c34e7cf38bdd5;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;67;80,704;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;72;704,704;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;77;-512,1072;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;704,1072;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;102;704,1440;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;105;1408,-160;Inherit;False;EaseInExpo;-1;;396;29e37224cef492d4bb225307eba98fa5;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;106;1408,-96;Inherit;False;EaseInExpo;-1;;397;29e37224cef492d4bb225307eba98fa5;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;107;1408,-32;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;112;2624,-32;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;117;2000,-32;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;122;1408,336;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;125;2000,208;Inherit;False;EaseOutCirc;-1;;468;32eb35761182ee641b0f10777cc6f128;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;126;2000,272;Inherit;False;EaseOutCirc;-1;;469;32eb35761182ee641b0f10777cc6f128;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;127;2000,336;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;132;2624,336;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;137;1408,704;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;142;2000,704;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;147;2624,704;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;153;1408,1072;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;163;2624,1072;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;168;1408,1440;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;173;2032,1440;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;158;2000,1072;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;179;2624,1440;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;82;80,1088;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;90;-512,1312;Inherit;False;EaseInQuint;-1;;686;ab0df8c3adee654489b6fe0d0238c239;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;91;-512,1376;Inherit;False;EaseInQuint;-1;;687;ab0df8c3adee654489b6fe0d0238c239;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;92;-512,1440;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;97;96,1440;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;189;-1376,-48;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;188;-1520,-48;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;185;-1152,112;Inherit;False;29;t;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;6;1024,-400;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5;848,-400;Inherit;False;1;0;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;1136,-400;Inherit;False;t;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;191;864,-320;Float;False;Property;_Float2;Float 2;0;0;Create;True;0;0;0;False;0;False;0.775418;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;409;304,-160;Inherit;True;GraphedLine;-1;;2522;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;410;304,208;Inherit;True;GraphedLine;-1;;2532;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;411;928,208;Inherit;True;GraphedLine;-1;;2542;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;412;-288,208;Inherit;True;GraphedLine;-1;;2552;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;413;304,576;Inherit;True;GraphedLine;-1;;2562;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;414;928,576;Inherit;True;GraphedLine;-1;;2572;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;415;-288,576;Inherit;True;GraphedLine;-1;;2582;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;416;928,944;Inherit;True;GraphedLine;-1;;2592;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;417;928,1312;Inherit;True;GraphedLine;-1;;2602;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;418;2848,-160;Inherit;True;GraphedLine;-1;;2612;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;419;2224,208;Inherit;True;GraphedLine;-1;;2622;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;420;2848,208;Inherit;True;GraphedLine;-1;;2632;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;421;1632,208;Inherit;True;GraphedLine;-1;;2642;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;422;2224,576;Inherit;True;GraphedLine;-1;;2652;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;423;2848,576;Inherit;True;GraphedLine;-1;;2662;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;430;-288,944;Inherit;True;GraphedLine;-1;;2732;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;431;320,1312;Inherit;True;GraphedLine;-1;;2742;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;432;-288,1312;Inherit;True;GraphedLine;-1;;2752;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;433;-288,-160;Inherit;True;GraphedLine;-1;;2762;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;434;-928,-64;Inherit;True;GraphedLine;-1;;2772;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;435;928,-160;Inherit;True;GraphedLine;-1;;2782;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;436;2224,-160;Inherit;True;GraphedLine;-1;;2792;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;437;1632,-160;Inherit;True;GraphedLine;-1;;2802;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;438;1632,576;Inherit;True;GraphedLine;-1;;2812;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;429;304,944;Inherit;True;GraphedLine;-1;;2822;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.25;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;444;-512,-160;Inherit;False;EaseInSine;-1;;2832;8447dfc0124fb9349ad4f77978e3a7d4;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;445;-512,-96;Inherit;False;EaseInSine;-1;;2833;8447dfc0124fb9349ad4f77978e3a7d4;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;446;-512,208;Inherit;False;EaseInQuad;-1;;2834;5a6e27f7116d7db49812e2d344682db3;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;447;-512,272;Inherit;False;EaseInQuad;-1;;2835;5a6e27f7116d7db49812e2d344682db3;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;448;80,208;Inherit;False;EaseOutQuad;-1;;2836;41752ba6a8c619e49ad93e66d13f7472;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;449;80,272;Inherit;False;EaseOutQuad;-1;;2837;41752ba6a8c619e49ad93e66d13f7472;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;450;672,208;Inherit;False;EaseInOutQuad;-1;;2838;1b6af29e1b077284caf60fb93f4443c2;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;451;672,272;Inherit;False;EaseInOutQuad;-1;;2839;1b6af29e1b077284caf60fb93f4443c2;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;452;704,-160;Inherit;False;EaseInOutSine;-1;;2840;be30c6fd260645f4a93570860be67550;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;453;704,-96;Inherit;False;EaseInOutSine;-1;;2841;be30c6fd260645f4a93570860be67550;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;454;672,640;Inherit;False;EaseInOutCubic;-1;;2842;456959209180e4441aa017e7819d6417;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;455;672,576;Inherit;False;EaseInOutCubic;-1;;2843;456959209180e4441aa017e7819d6417;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;456;-512,944;Inherit;False;EaseInQuart;-1;;2844;4c2f53d6bdc33834dabf4ca86d09ffce;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;457;-512,1008;Inherit;False;EaseInQuart;-1;;2845;4c2f53d6bdc33834dabf4ca86d09ffce;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;458;80,960;Inherit;False;EaseOutQuart;-1;;2846;bd108f2e3d22b45469e9165bf8e81d8b;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;459;80,1024;Inherit;False;EaseOutQuart;-1;;2847;bd108f2e3d22b45469e9165bf8e81d8b;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;460;672,944;Inherit;False;EaseInOutQuart;-1;;2848;6b126330cc4f78943ad62d0383cdecdd;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;461;672,1008;Inherit;False;EaseInOutQuart;-1;;2849;6b126330cc4f78943ad62d0383cdecdd;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;462;672,1312;Inherit;False;EaseInOutQuint;-1;;2850;776de27edfb0765408a5b09b05e5d66b;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;463;672,1376;Inherit;False;EaseInOutQuint;-1;;2851;776de27edfb0765408a5b09b05e5d66b;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;464;2592,-160;Inherit;False;EaseInOutExpo;-1;;2852;67a1c9258e33da34ca255d6d70857e38;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;465;2592,-96;Inherit;False;EaseInOutExpo;-1;;2853;67a1c9258e33da34ca255d6d70857e38;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;466;2000,-160;Inherit;False;EaseOutExpo;-1;;2854;a9ed4ee522c1d8749b76f6e0dad17710;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;467;2000,-96;Inherit;False;EaseOutExpo;-1;;2855;a9ed4ee522c1d8749b76f6e0dad17710;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;468;1408,208;Inherit;False;EaseInCirc;-1;;2856;20170489d80df76409184c4998afd313;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;469;1408,272;Inherit;False;EaseInCirc;-1;;2857;20170489d80df76409184c4998afd313;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;470;2624,208;Inherit;False;EaseInOutCirc;-1;;2858;b3bc05bd55a15804b8e7a10cf1fca96e;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;471;2624,272;Inherit;False;EaseInOutCirc;-1;;2859;b3bc05bd55a15804b8e7a10cf1fca96e;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;472;1408,576;Inherit;False;EaseInBack;-1;;2860;3135aec410a637f49aca9c58278b36a2;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;473;1408,640;Inherit;False;EaseInBack;-1;;2861;3135aec410a637f49aca9c58278b36a2;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;474;2000,640;Inherit;False;EaseOutBack;-1;;2862;e57c173e514cd8c4f9cf07b47e53d1cb;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;475;2000,576;Inherit;False;EaseOutBack;-1;;2863;e57c173e514cd8c4f9cf07b47e53d1cb;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;476;2592,576;Inherit;False;EaseInOutBack;-1;;2864;a8e8c7275efed5140a428c8938fb5862;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;477;2592,640;Inherit;False;EaseInOutBack;-1;;2865;a8e8c7275efed5140a428c8938fb5862;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;478;1408,1008;Inherit;False;EaseInElastic;-1;;2866;408628185df06eb45862f17eca67b63a;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;479;2592,1008;Inherit;False;EaseInOutElastic;-1;;2867;22387c5ddd9abdf45a53c14812d4bbe0;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;480;2592,944;Inherit;False;EaseInOutElastic;-1;;2868;22387c5ddd9abdf45a53c14812d4bbe0;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;481;1408,1312;Inherit;False;EaseInBounce;-1;;2869;c6b700d5ac42c5643b6c9ae90f61798f;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;482;1408,1376;Inherit;False;EaseInBounce;-1;;2870;c6b700d5ac42c5643b6c9ae90f61798f;0;1;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;483;2000,1312;Inherit;False;EaseOutBounce;-1;;2871;2a8f5b0251db80d44b9c3881bc9f4080;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;484;2000,1376;Inherit;False;EaseOutBounce;-1;;2872;2a8f5b0251db80d44b9c3881bc9f4080;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;485;2000,944;Inherit;False;EaseOutElastic;-1;;2873;529c435c1a17d1d42b209c9827777509;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;486;2000,1008;Inherit;False;EaseOutElastic;-1;;2874;529c435c1a17d1d42b209c9827777509;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;487;2592,1312;Inherit;False;EaseInOutBounce;-1;;2875;3f5b2c18c6df38f41a9fb76c951895d9;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;488;2592,1376;Inherit;False;EaseInOutBounce;-1;;2877;3f5b2c18c6df38f41a9fb76c951895d9;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;489;96,1312;Inherit;False;EaseOutQuint;-1;;2879;b4f21c6e01f029749bbd8e4f6c0160a3;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;490;96,1376;Inherit;False;EaseOutQuint;-1;;2880;b4f21c6e01f029749bbd8e4f6c0160a3;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;491;-1184,-64;Inherit;False;EaseInOutNth;-1;;2881;a26625d68d3bbe44ea2a52a365cbeadd;0;2;1;FLOAT;0;False;12;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;492;-1184,16;Inherit;False;EaseInOutNth;-1;;2882;a26625d68d3bbe44ea2a52a365cbeadd;0;2;1;FLOAT;0;False;12;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;493;1408,944;Inherit;False;EaseInElastic;-1;;2883;408628185df06eb45862f17eca67b63a;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;426;2224,944;Inherit;True;GraphedLine;-1;;2884;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;2;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;439;1632,944;Inherit;True;GraphedLine;-1;;2894;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;2;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;424;2848,944;Inherit;True;GraphedLine;-1;;2904;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1.5;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;425;1632,1312;Inherit;True;GraphedLine;-1;;2914;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;428;2256,1312;Inherit;True;GraphedLine;-1;;2924;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;427;2848,1312;Inherit;True;GraphedLine;-1;;2934;b2476cd12205c074d9028e31537a1c43;0;11;4;FLOAT;0;False;73;FLOAT;1;False;63;FLOAT;1;False;5;FLOAT;0;False;6;FLOAT;0;False;62;FLOAT;0.25;False;7;FLOAT;0.25;False;8;FLOAT;0.5;False;9;FLOAT;0.5;False;10;COLOR;0.9607843,0.07058824,0.3254902,0;False;11;COLOR;0.2,0.7215686,0.9843137,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;3344,176;Float;False;True;-1;3;AmplifyShaderEditor.MaterialInspector;0;0;Standard;EasingFunctions;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;35;1;37;0
WireConnection;61;1;62;0
WireConnection;66;1;67;0
WireConnection;106;1;107;0
WireConnection;126;1;127;0
WireConnection;91;1;92;0
WireConnection;189;0;188;3
WireConnection;6;0;5;0
WireConnection;29;0;6;0
WireConnection;409;4;34;0
WireConnection;409;5;35;0
WireConnection;409;6;37;0
WireConnection;410;4;448;0
WireConnection;410;5;449;0
WireConnection;410;6;52;0
WireConnection;411;4;450;0
WireConnection;411;5;451;0
WireConnection;411;6;57;0
WireConnection;412;4;446;0
WireConnection;412;5;447;0
WireConnection;412;6;47;0
WireConnection;413;4;65;0
WireConnection;413;5;66;0
WireConnection;413;6;67;0
WireConnection;414;4;455;0
WireConnection;414;5;454;0
WireConnection;414;6;72;0
WireConnection;415;4;60;0
WireConnection;415;5;61;0
WireConnection;415;6;62;0
WireConnection;416;4;460;0
WireConnection;416;5;461;0
WireConnection;416;6;87;0
WireConnection;417;4;462;0
WireConnection;417;5;463;0
WireConnection;417;6;102;0
WireConnection;418;4;464;0
WireConnection;418;5;465;0
WireConnection;418;6;112;0
WireConnection;419;4;125;0
WireConnection;419;5;126;0
WireConnection;419;6;127;0
WireConnection;420;4;470;0
WireConnection;420;5;471;0
WireConnection;420;6;132;0
WireConnection;421;4;468;0
WireConnection;421;5;469;0
WireConnection;421;6;122;0
WireConnection;422;4;475;0
WireConnection;422;5;474;0
WireConnection;422;6;142;0
WireConnection;423;4;476;0
WireConnection;423;5;477;0
WireConnection;423;6;147;0
WireConnection;430;4;456;0
WireConnection;430;5;457;0
WireConnection;430;6;77;0
WireConnection;431;4;489;0
WireConnection;431;5;490;0
WireConnection;431;6;97;0
WireConnection;432;4;90;0
WireConnection;432;5;91;0
WireConnection;432;6;92;0
WireConnection;433;4;444;0
WireConnection;433;5;445;0
WireConnection;433;6;30;0
WireConnection;434;4;491;0
WireConnection;434;5;492;0
WireConnection;434;6;185;0
WireConnection;435;4;452;0
WireConnection;435;5;453;0
WireConnection;435;6;42;0
WireConnection;436;4;466;0
WireConnection;436;5;467;0
WireConnection;436;6;117;0
WireConnection;437;4;105;0
WireConnection;437;5;106;0
WireConnection;437;6;107;0
WireConnection;438;4;472;0
WireConnection;438;5;473;0
WireConnection;438;6;137;0
WireConnection;429;4;458;0
WireConnection;429;5;459;0
WireConnection;429;6;82;0
WireConnection;445;1;30;0
WireConnection;447;1;47;0
WireConnection;449;1;52;0
WireConnection;451;1;57;0
WireConnection;453;1;42;0
WireConnection;454;1;72;0
WireConnection;457;1;77;0
WireConnection;459;1;82;0
WireConnection;461;1;87;0
WireConnection;463;1;102;0
WireConnection;465;1;112;0
WireConnection;467;1;117;0
WireConnection;469;1;122;0
WireConnection;471;1;132;0
WireConnection;473;1;137;0
WireConnection;474;1;142;0
WireConnection;477;1;147;0
WireConnection;478;1;153;0
WireConnection;479;1;163;0
WireConnection;482;2;168;0
WireConnection;484;1;173;0
WireConnection;486;1;158;0
WireConnection;488;1;179;0
WireConnection;490;1;97;0
WireConnection;491;12;189;0
WireConnection;492;1;185;0
WireConnection;492;12;189;0
WireConnection;426;4;485;0
WireConnection;426;5;486;0
WireConnection;426;6;158;0
WireConnection;439;4;493;0
WireConnection;439;5;478;0
WireConnection;439;6;153;0
WireConnection;424;4;480;0
WireConnection;424;5;479;0
WireConnection;424;6;163;0
WireConnection;425;4;481;0
WireConnection;425;5;482;0
WireConnection;425;6;168;0
WireConnection;428;4;483;0
WireConnection;428;5;484;0
WireConnection;428;6;173;0
WireConnection;427;4;487;0
WireConnection;427;5;488;0
WireConnection;427;6;179;0
ASEEND*/
//CHKSM=6B3D832FF4DAFE25CE46AF1CD7D1F8CD9A20F70C