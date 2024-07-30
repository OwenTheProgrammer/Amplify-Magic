# Lighting Functions

## Half Direction

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the direction vector halfway between two vectors A and B.
    </td>
    <td><p align="center"> 
        <image src="./Images/HalfDirection.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| A | <span style="color:#7775E8">Float3</span> | The first vector, Vector A. |
| B | <span style="color:#7775E8">Float3</span> | The second vector, Vector B. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Half Direction | <span style="color:#7775E8">Float3</span> | The halfway vector between Vector A and B. |

## L dot H

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the <b>L</b>ight direction and the <b>H</b>alf-way direction between the View and Light direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/LdotH.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| LdotH | Float | The dot product value. |

## L dot V

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the <b>L</b>ight direction and the <b>V</b>iew direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/LdotV.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| LdotV | Float | the dot product value. |

## N dot H

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the surface <b>N</b>ormal and the <b>H</b>alfway vector between the View direction and the Light direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/NdotH.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| NdotH | Float | the dot product value. |

## N dot L

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the surface <b>N</b>ormal and the <b>L</b>ight direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/NdotL.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| NdotL | Float | the dot product value. |

## N dot V

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the surface <b>N</b>ormal and the <b>V</b>iew direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/NdotV.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| NdotV | Float | the dot product value. |

## R dot V

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the <b>R</b>eflection direction and the <b>V</b>iew direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/RdotV.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| Normal Direction | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| RdotV | Float | the dot product value. |


## Reflect Direction

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the direction a light ray would reflect against a surface.
    </td>
    <td><p align="center"> 
        <image src="./Images/ReflectDirection.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| Normal Direction | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Light Direction | <span style="color:#7775E8">Float3</span> | The reflection direction. |

## Schlick Fresnel

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Schlick Fresnel specular term.
    </td>
    <td><p align="center"> 
        <image src="./Images/SchlickFresnel.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Specular Colour | <span style="color:#EE00E8">Color</span> | The Colour of the surface. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Schlick Fresnel | <span style="color:#EE00E8">Color</span> | The fresnel colour. |

## ShadeSH9

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Unity ShadeSH9 function. This allows for real time lighting usage in shading.
    </td>
    <td><p align="center"> 
        <image src="./Images/ShadeSH9.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| SH Shading | <span style="color:#7775E8">Float3</span> | The Shading values. |

## SHEvalLinearL0L1

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Unity SHEvalLinearL0L1 function. This combines the Spherical Harmonics matrix's L0 and L1 coefficients.
    </td>
    <td><p align="center"> 
        <image src="./Images/SHEvalLinearL0L1.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Spherical Harmonics | <span style="color:#7775E8">Float3</span> | The L0 and L1 coefficient combination. |

## SHEvalLinearL2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Unity SHEvalLinearL2 function. This is the highest frequency band of the Spherical Harmonics.
    </td>
    <td><p align="center"> 
        <image src="./Images/SHEvalLinearL2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Spherical Harmonics | <span style="color:#7775E8">Float3</span> | The L2 Spherical Harmonics band. |

## SH Get Basis Vectors

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gets the local XYZ coordinate space of Unity's Spherical Harmonics matrix (SHa terms).
    </td>
    <td><p align="center"> 
        <image src="./Images/SHGetBasisVectors.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Harmonic XYZ | <span style="color:#7775E8">Float3</span> | The basis vectors of the Harmonics. |

## V dot H

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the dot product between the <b>V</b>iew vector and the <b>H</b>alfway vector between the View and Light direction.
    </td>
    <td><p align="center"> 
        <image src="./Images/VdotH.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| VdotH | Float | the dot product value. |