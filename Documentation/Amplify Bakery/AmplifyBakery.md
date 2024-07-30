# Amplify Bakery

## Bakery Decode Lightmap RNM

> [!WARNING]
> This function is raw as hell, basically don't use it outside of SAMPLERRNM#_float samplers.

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Bakery's custom DecodeLightmap function, used when decoding the lightmap textures.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakeryDecodeLightmapRNM.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lightmap | <span style="color:#EC00E8">Float4</span> | The current object lightmap data. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Result | <span style="color:#7775E8">Float3</span> | The decoded Radiocity Normal Map values. |

## Bakery Lightmap ST

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Equivalent to a Tiling/Offset setup, just for Bakery lightmapping textures.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakeryLightmapST.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| uv | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinate. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The remapped lightmap UV coordinate, based on unity_LightmapST. |

## Bakery Luma Clamp

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Clamps the luminance values of a Spherical Harmonic transform.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakeryLumaClamp.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lumaSH | Float | The L1 Spherical Harmonic luminance. |
| regularLumaSH | Float | The combined Spherical Harmonics luminance to scale by. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Luma | Float | The evaluated luminance scalar term. |

## Bakery MonoSH

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Samples Bakery's MonoSH lightmap data. Spherical Harmonics contain diffuse lighting.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakeryMonoSH.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| worldNormal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| MonoSH | <span style="color:#7775E8">Float3</span> | The sampled Spherical Harmonics data. (RGB) |

## Bakery Read Lightmap

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Reads the lightmap data, returning the L0 and nL1 vectors.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakeryReadLightmap.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| L0 (Ambient) | <span style="color:#7775E8">Float3</span> | The average lightmap colour as RGB, also known as the "Ambient" L0 band coefficient or base term. |
| nL1 (Light Direction) | <span style="color:#7775E8">Float3</span> | The dominant light direction from the lightmap. |

## Bakery Sample SH Matrix

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Samples the Spherical Harmonics matrix, obtaining the luminance, directionality an dominant light direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakerySampleSHMatrix.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |
| L0 | <span style="color:#7775E8">Float3</span> | The ambient lightmap data from Lightmap L0. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| LumaL0 | Float | The luminance value of the "ambient" or average Spherical Harmonics band. |
| lumaL1x | Float | The luminance value from the X direction of the L1 Spherical Harmonic band. |
| lumaL1y | Float | The luminance value from the Y direction of the L1 Spherical Harmonic band. |
| lumaL1z | Float | The luminance value from the Z direction of the L1 Spherical Harmonic band. |
| L1x | <span style="color:#7775E8">Float3</span> | The X contribution term of the L1 Spherical Harmonic band. |
| L1y | <span style="color:#7775E8">Float3</span> | The Y contribution term of the L1 Spherical Harmonic band. |
| L1z | <span style="color:#7775E8">Float3</span> | The Z contribution term of the L1 Spherical Harmonic band. |
| nL1x | <span style="color:#7775E8">Float3</span> | The normalized X contribution, regaurding the dominant light directions contribution term. |
| nL1y | <span style="color:#7775E8">Float3</span> | The normalized X contribution, regaurding the dominant light directions contribution term. |
| nL1z | <span style="color:#7775E8">Float3</span> | The normalized X contribution, regaurding the dominant light directions contribution term. |

## Bakery SH

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Samples the Bakery Spherical Harmonics maps.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakerySH.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| L0 | <span style="color:#7775E8">Float3</span> | The ambient lightmap data from Lightmap L0. |
| normalWorld | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| SH | <span style="color:#7775E8">Float3</span> | The sampled Spherical Harmonics data. |

## Bakery SH4 Light Contribution

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Combines the full SH4 terms into a directional contribution map.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakerySH4LightContribution.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| L0 (Ambient) | <span style="color:#7775E8">Float3</span> | The ambient lightmap data from Lightmap L0. |
| nL1x | <span style="color:#7775E8">Float3</span> | The normalized dominant light direction's X contribution. |
| nL1y | <span style="color:#7775E8">Float3</span> | The normalized dominant light direction's Y contribution. |
| nL1z | <span style="color:#7775E8">Float3</span> | The normalized dominant light direction's Z contribution. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| L1x | <span style="color:#7775E8">Float3</span> | The light contribution in the X direction. |
| L1y | <span style="color:#7775E8">Float3</span> | The light contribution in the Y direction. |
| L1z | <span style="color:#7775E8">Float3</span> | The light contribution in the Z direction. |

## Bakery SH4 Luma

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the luminance values of SH4 values.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakerySH4Luma.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| L0 | <span style="color:#7775E8">Float3</span> | The ambient lightmap data from Lightmap L0. |
| L1x | <span style="color:#7775E8">Float3</span> | The X contribution term of the L1 Spherical Harmonic band. |
| L1y | <span style="color:#7775E8">Float3</span> | The Y contribution term of the L1 Spherical Harmonic band. |
| L1z | <span style="color:#7775E8">Float3</span> | The Z contribution term of the L1 Spherical Harmonic band. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| lumaL0 | Float | The luminance value of the "ambient" or average Spherical Harmonics band. |
| lumaL1xyz | <span style="color:#7775E8">Float3</span> | All luma values combined into a Float3. |
| lumaL1x | Float | The luminance value from the X direction of the L1 Spherical Harmonic band. |
| lumaL1y | Float | The luminance value from the Y direction of the L1 Spherical Harmonic band. |
| lumaL1z | Float | The luminance value from the Z direction of the L1 Spherical Harmonic band. |

## Bakery Specular MonoSH Full

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Samples the Bakery MonoSH values and produces a diffuse-specular lighting model.
    </td>
    <td><p align="center"> 
        <image src="./Images/BakerySpecularMonoSHFull.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| albedo | <span style="color:#EE00E8">Color</span> | The surface albedo colour. |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |
| normalWorld | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| viewDir | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| smoothness | Float | The surface smoothness value. |
| metallic | Float | The surface metal-ness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| DiffuseSH | <span style="color:#7775E8">Float3</span> | The SH diffuse lighting term. |
| SpecularSH | <span style="color:#EE00E8">Color</span> | The final surface colour. |

## Combine SH Terms

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Applies A Spherical Harmonics transformation to a given direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/CombineSHTerms.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| L0 | <span style="color:#7775E8">Float3</span> | The ambient lightmap data from Lightmap L0. |
| Direction | <span style="color:#7775E8">Float3</span> | The direction vector to apply the transformation to. |
| L1x | <span style="color:#7775E8">Float3</span> | The X contribution term of the L1 Spherical Harmonic band. |
| L1y | <span style="color:#7775E8">Float3</span> | The Y contribution term of the L1 Spherical Harmonic band. |
| L1z | <span style="color:#7775E8">Float3</span> | The Z contribution term of the L1 Spherical Harmonic band. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| SH Combination | <span style="color:#7775E8">Float3</span> | The transformed vector direction. |
| Luma | Float | The luminance value in the combined direction. |

## Directional Specular

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a direction specular based on Bakery's lightmapping data.
    </td>
    <td><p align="center"> 
        <image src="./Images/DirectionalSpecular.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |
| normalWorld | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| viewDir | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| smoothness | Float | The surface smoothness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Color | <span style="color:#7775E8">Float3</span> | The sampled specular colour. (RGB) |

## GGX Term

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the GGX Specular term commonly used in lighting models.
    </td>
    <td><p align="center"> 
        <image src="./Images/GGXTerm.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| NdotH | Float | The surface <b>N</b>ormal <b>dot</b> producted with the <b>H</b>alf-way direction vector between the light direction and the camera view vector. |
| roughness | Float | The surface roughness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| GGX | Float | The calculated GGX specular coefficient term. |

## Perceptual Roughness To Mipmap Level

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Converts a surface roughness value to a sampler mipmap level, typically used for reflection probe cubemaps.
    </td>
    <td><p align="center"> 
        <image src="./Images/PerceptualRoughnessToMipmapLevel.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| PerceptualRoughness | Float | The surface roughness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Level | Float | The mipmap level to sample a cubemap with. |

## Perceptual Roughness To Roughness

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        As Bakery states: "Copied from the original Unity standard shader for compatibility."
    </td>
    <td><p align="center"> 
        <image src="./Images/PerceptualRoughnessToRoughness.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| PerceptualRoughness | Float | The surface roughness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Roughness | Float | The new roughness value. |

## Sample L1

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Samples the SH lightmap L1 coefficients, AKA the lighting data.
    </td>
    <td><p align="center"> 
        <image src="./Images/SampleL1.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| L1x | <span style="color:#7775E8">Float3</span> | The diffusivity of the Spherical Harmonic L1 coefficient, in the X direction. |
| L1y | <span style="color:#7775E8">Float3</span> | The diffusivity of the Spherical Harmonic L1 coefficient, in the Y direction. |
| L1z | <span style="color:#7775E8">Float3</span> | The diffusivity of the Spherical Harmonic L1 coefficient, in the Z direction. |

## Sample RNM#

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Samples the raw Spherical Harmonics L1 basis vectors (directional coefficients.)
    </td>
    <td><p align="center"> 
        <image src="./Images/SampleRNMX.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| lightmapUV | <span style="color:#ECE800">Float2</span> | The lightmap UV coordinates of this mesh. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| RNM0 (X basis vector) | <span style="color:#7775E8">Float3</span> | The Radiocity Normal Map's X basis vector. |
| RNM1 (Y basis vector) | <span style="color:#7775E8">Float3</span> | The Radiocity Normal Map's Y basis vector. |
| RNM2 (z basis vector) | <span style="color:#7775E8">Float3</span> | The Radiocity Normal Map's Z basis vector. |

> [!TIP]
> _RNM[0-2] are global texture samplers when Bakery has baked lighting, feel free to sample them with a lightmap UV!


## SH Evaluate L1 Diffuse

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Evaluates the diffusion terms from the L1 coefficients, calculating the SH lumocity parts.
    </td>
    <td><p align="center"> 
        <image src="./Images/SHEvaluateL1Diffuse.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| L0 | Float | The luminance of the L0 SH coefficient, Typically calculated from BakerySH4 Luma's "lumaL0" output. |
| L1 | <span style="color:#7775E8">Float3</span> | The illumination terms for the Spherical Harmonic L1 term. Typically calculated using the BakerySH4Luma nodes "lumaL1xyz" output. |
| n | <span style="color:#7775E8">Float3</span> | Thes surface normal in world space. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The Spherical Harmonics diffusion luminance. |

## Smoothness To Perceptual Roughness

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Converts a smoothness value to its roughness factor.
    </td>
    <td><p align="center"> 
        <image src="./Images/SmoothnessToPerceptualRoughness.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| smoothness | Float | The surface smoothness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The converted roughness value. |
