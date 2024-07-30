# Unity Globals

## Decode HDR

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Unity DecodeHDR macro.
    </td>
    <td><p align="center"> 
        <image src="./Images/DecodeHDR.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Data | <span style="color:#EC00E8">Float4</span> | The HDR texture colour. |
| HDR Instructions | <span style="color:#EC00E8">Float4</span> | the global HDR values of the input texture, typically _TEXTURENAME_HDR. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Decoded HDR | <span style="color:#7775E8">Float3</span> | The decoded HDR values in the correct color range. |

## Lightmap Data

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        FUCKING EVERYTHING from the unity lightmaps.
    </td>
    <td><p align="center"> 
        <image src="./Images/LightmapData.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Sampler UV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Lightmap (Raw) | <span style="color:#EE00E8">Color</span> | A direct sample into the unity_Lightmap texture given your input UV. |
| Lightmap (Current) | <span style="color:#EE00E8">Color</span> | The unity_Lightmap values from the current object's lightmap UV coordinates. |
| Directional Lightmap (Raw) | <span style="color:#EE00E8">Color</span> | A direct sample into the unity_LightmapInd texture given your input UV. |
| Directional Lightmap (Current) | <span style="color:#EE00E8">Color</span> | The unity_LightmapInd values from the current object's lightmap UV coordinates. |
| ShadowMask (Raw) | <span style="color:#EE00E8">Color</span> | A direct sample into the unity_ShadowMask texture given your input UV. |
| ShadowMask (Current) | <span style="color:#EE00E8">Color</span> | The unity_ShadowMask values from the current object's lightmap UV coordinates. |
| Dynamic Lightmap (Raw) | <span style="color:#EE00E8">Color</span> | A direct sample into the unity_DynamicLightmap texture given your input UV. |
| Dynamic Lightmap (Current) | <span style="color:#EE00E8">Color</span> | The unity_DynamicLightmap values from the current object's lightmap UV coordinates. |
| Dynamic Directionality (Raw) | <span style="color:#EE00E8">Color</span> | A direct sample into the unity_DynamicDirectionality texture given your input UV. |
| Dynamic Directionality (Current) | <span style="color:#EE00E8">Color</span> | The unity_DynamicDirectionality values from the current object's lightmap UV coordinates. |
| Dynamic Normal (Raw) | <span style="color:#EE00E8">Color</span> | A direct sample into the unity_DynamicNormal texture given your input UV. |
| Dynamic Normal (Current) | <span style="color:#EE00E8">Color</span> | The unity_DynamicNormal values from the current object's lightmap UV coordinates. |

| Map Name | Its Usage |
| :------: | :-------- |
| unity_Lightmap | Lightmap for baked lighting data. |
| unity_LightmapInd | Lightmap for light directionality AKA the direction light map and where light is coming from. |
| unity_ShadowMask | Lightmap for baked shadows. |
| unity_DynamicLightmap | The same as unity_Lightmap but for real-time lights. |
| unity_DynamicDirectionality | The same as unity_LightmapInd but for real-time lights. |
| unity_DynamicNormal | The real-time surface normal map. |

## Reflection Probe Data

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Lets you sample a reflection probe.
    </td>
    <td><p align="center"> 
        <image src="./Images/ReflectionProbeData.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Sample Direction | <span style="color:#7775E8">Float3</span> | As stated, the direction the sample is to be made. |
| Sample Position | <span style="color:#7775E8">Float3</span> | The sample origin from the ray. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Reflection Probe (Reflected) | <span style="color:#7775E8">Float3</span> | The sampler result from the ray to surface reflection direction. |
| Reflection Probe (Directional) | <span style="color:#7775E8">Float3</span> | No reflection, the sampled ray direction. |