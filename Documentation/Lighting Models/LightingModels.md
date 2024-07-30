# Lighting Models

## Beckmann NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Beckmann Normal Distribution Function.
    </td>
    <td><p align="center"> 
        <image src="./Images/BeckmannNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| World Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Roughness | Float | The surface roughness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## Blinn-Phong NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Blinn-Phong Normal Distribution Function.
    </td>
    <td><p align="center"> 
        <image src="./Images/BlinnPhongNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| World Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Glossiness | Float | The surface Glossiness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## Gaussian NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Gaussian Normal Distribution Function.
    </td>
    <td><p align="center"> 
        <image src="./Images/GaussianNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| World Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Roughness | Float | The surface Roughness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## GGX Light

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the GGX Lighting distribution term.
    </td>
    <td><p align="center"> 
        <image src="./Images/GGXLight.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Specular Colour | <span style="color:#EE00E8">Color</span> | The surface colour. |
| World Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Roughness | Float | The surface Roughness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| GGX Light | <span style="color:#EE00E8">Color</span> | The evaluated GGX surface light colour. |

## GGX NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the GGX Normal Distribution Function.
    </td>
    <td><p align="center"> 
        <image src="./Images/GGXNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| World Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Roughness | Float | The surface Roughness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## Phong NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Phong Normal Distribution Function.
    </td>
    <td><p align="center"> 
        <image src="./Images/PhongNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| Normal Direction | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Glossiness | Float | The surface Glossiness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## Trowbridge-Reitz Anisotropic NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Trowbridge-Reitz Anisotropic Normal Distribution Function. Looks like shiny metal!
    </td>
    <td><p align="center"> 
        <image src="./Images/TrowbridgeReitzAnisotropicNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal Direction | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Tangent Direction | <span style="color:#7775E8">Float3</span> | The surface tangent in world space. |
| Bitangent Direction | <span style="color:#7775E8">Float3</span> | The surface bitangent in world space. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| Anisotropic | Float | The Anisotropic value. |
| Glossiness | Float | The surface Glossiness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## Trowbridge-Reitz NDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Trowbridge-Reitz Normal Distribution Function,
    </td>
    <td><p align="center"> 
        <image src="./Images/TrowbridgeReitzNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| World Normal | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Roughness | Float | The surface roughness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |

## Ward Anisotropic NDF

> [!CAUTION]
> This is probably broken, but I don't know what it's supposed to look like.

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the Ward Anisotropic Normal Distribution Function,
    </td>
    <td><p align="center"> 
        <image src="./Images/WardAnisotropicNDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal Direction | <span style="color:#7775E8">Float3</span> | The surface normal in world space. |
| Tangent Direction | <span style="color:#7775E8">Float3</span> | The surface tangent in world space. |
| Bitangent Direction | <span style="color:#7775E8">Float3</span> | The surface bitangent in world space. |
| View Direction | <span style="color:#7775E8">Float3</span> | The camera view direction. |
| Light Direction | <span style="color:#7775E8">Float3</span> | The light direction. |
| Anisotropic | Float | The Anisotropic value. |
| Glossiness | Float | The surface Glossiness value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Specular | Float | The specular distribution term. |