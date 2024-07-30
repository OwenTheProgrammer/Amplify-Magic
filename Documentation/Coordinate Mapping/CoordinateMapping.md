# Coordinate Mapping

## Point On Circle

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Makes a UV position that follows the path of a circle.
    </td>
    <td><p align="center"> 
        <image src="./Images/PointOnCircle.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Angle [0 \| 1] | Float | Angle from X+ direction, with 1 being a full rotation Counter-Clock-Wise. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| UV Point [-1 \| 1] | <span style="color:#ECE800">Float2</span> | The UV position with the minimum value -1 and the max +1. |
| UV Point [0 \| 1] | <span style="color:#ECE800">Float2</span> | The UV position with the minimum value 0 and the max 1. |

## Project To Box

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Projects a view ray onto a bounding box, typically defined by a reflection probes bounds.
    </td>
    <td><p align="center"> 
        <image src="./Images/ProjectToBox.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Ray Position | <span style="color:#7775E8">Float3</span> | The position of the ray. |
| Ray Direction | <span style="color:#7775E8">Float3</span> | The normalized direction of the ray. |
| Min Extent | <span style="color:#7775E8">Float3</span> | The minimum position of the bounding box in XYZ world space coordinates. (left,bottom,back) |
| Max Extent | <span style="color:#7775E8">Float3</span> | The maximum position of the bounding box in XYZ world space coordinates. (right,top,front) |
| Box Origin | <span style="color:#7775E8">Float3</span> | The center of the bounding box in world space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Hit Position | <span style="color:#7775E8">Float3</span> | The resulting ray projected position in the bounding box's coordinates. |
| Ray Distance | Float | The distance from the ray position to the projected hit position. |

## Project To Square

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Projects a UV position onto the unit square (centered at 0,0)
    </td>
    <td><p align="center"> 
        <image src="./Images/ProjectToSquare.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Distance | Float | The scaling factor to project your UV coordinate to the unit square. |
| Hit Point [-1 \| 1] | <span style="color:#ECE800">Float2</span> | The projection point with -1 to 1 range. |
| Hit Point [0 \| 1] | <span style="color:#ECE800">Float2</span> | The projection point with 0 to 1 range. |

## Repeat Domain

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Wraps the UV space / domain of an SDF function.
    </td>
    <td><p align="center"> 
        <image src="./Images/RepeatDomain.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Tiling | <span style="color:#ECE800">Float2</span> | How many times the domain is to be looped. |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Global Offset | <span style="color:#ECE800">Float2</span> | The UV coordinate offset for the entire space. |
| Cell Offset | <span style="color:#ECE800">Float2</span> | The coordinate offset for each cells space. |
| Cell Rotation (Degrees) | Float | The cell rotation angle in degrees. |
| Global Rotation (Degrees) | Float | The UV coordinate rotation angle in degrees. |

> [!NOTE]
> Angles are Counter-Clock-Wise starting from X+


| Output | Type | Description |
| :----: | :--: | :---------  |
| Domain UV | <span style="color:#ECE800">Float2</span> | The resulting UV coordinates. |
| Cell ID | <span style="color:#ECE800">Float2</span> | A 0 to 1 ranged ID for each cell, with steps 1/Tiling for each cell. |

## Rotate UV

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Simply rotates the UV coordinate space Counter-Clock-Wise starting at X+
    </td>
    <td><p align="center"> 
        <image src="./Images/RotateUV.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Angle (Degrees) | Float | Rotation angle in degrees. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | <span style="color:#ECE800">Float2</span> | The rotated UV coordinate. |


## Sample Pixel In Middle

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Shifts the UV coordinate space such that the center of each pixel is on normal steps. (0,0) will be the center of the bottom left pixel.
    </td>
    <td><p align="center"> 
        <image src="./Images/SamplePixelInMiddle.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Resolution | <span style="color:#ECE800">Float2</span> | The texture resolution. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | <span style="color:#ECE800">Float2</span> | The pixel-centered UV coordinates. |

## Smooth Gradual Pixelation

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a pixelated UV coordinate with its paired ddx ddy values.
    </td>
    <td><p align="center"> 
        <image src="./Images/SmoothGradualPixelation.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Resolution | <span style="color:#ECE800">Float2</span> | The pixelation resolution. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The pixelated UV coordinates. |
| ddx ddy | <span style="color:#EC00E8">Float4</span> | xy: ddx values, zw: ddy values. |

## Smooth UV Grid

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a grid of UV coordinates with smoother transitions.
    </td>
    <td><p align="center"> 
        <image src="./Images/SmoothUVGrid.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Grid Size | <span style="color:#ECE800">Float2</span> | The width and height of the grid. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| TexCoord | <span style="color:#ECE800">Float2</span> | The resulting UV coordinates. |
| ddx | <span style="color:#ECE800">Float2</span> | The ddx values for the grid. |
| ddy | <span style="color:#ECE800">Float2</span> | The ddy values for the grid. |

## Spherical Coordinates

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Converts a 3D position to its spherical coordinate representation.
    </td>
    <td><p align="center"> 
        <image src="./Images/SphericalCoordinates.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Position | <span style="color:#7775E8">Float3</span> | The position to convert. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| R, $\theta$, $\phi$ | <span style="color:#7775E8">Float3</span> | The radial distance (R), polar angle ($\theta$), and the azimuthal angle ($\phi$) in XYZ. |

## ST Remapping

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implementation of Unity's TRANSFORM_TEX macro.
    </td>
    <td><p align="center"> 
        <image src="./Images/STRemapping.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Texture ST | <span style="color:#EC00E8">Float4</span> | The Tiling/Offset values. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Mapped UV | <span style="color:#ECE800">Float2</span> | The remapped UV. |

## Tilesheet Selector

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Selects a single tiled texture from a grid of textures.
    </td>
    <td><p align="center"> 
        <image src="./Images/TilesheetSelector.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Grid Dimensions | <span style="color:#ECE800">Float2</span> | The Amount of textures to expect in the UV space. |
| Index | <span style="color:#ECE8E8">UInt</span> | The cell index starting from the bottom left, going to the right and upward. |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Mask Bleed | <span style="color:#ECE800">Float2</span> | A 0-1 range for cutting off 0% to 100% from the slice borders. |
| Input (Optional) | <span style="color:#EC7500">Sampler</span> | An input texture to sample with. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Slice Color | <span style="color:#EE00E8">Color</span> | The sampled slice colour given the slice position. |
| Masked Grid | <span style="color:#7775E8">Float3</span> | The slice singled out with masking but without scaling the UV coordinates. |
| Slice UV | <span style="color:#ECE800">Float2</span> | The evaluated slice coordinates. |
| Scale | <span style="color:#ECE800">Float2</span> | The UV tiling value. |
| Offset | <span style="color:#ECE800">Float2</span> | The UV offset value. |
| Slice Pivot | <span style="color:#ECE800">Float2</span> | The center point of the slice in UV space. |
| Slice Mask | Float | The UV unscaled black and white mask that covers the selected slice. |
| Slice Mask (AA) | Float | The same as above, just anti aliased. |

## Tunnel To UV

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Unwraps a UVToTunnel node or Resolume UV with the tunnel effect applied.
    </td>
    <td><p align="center"> 
        <image src="./Images/TunnelToUV.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| $\theta$, $\phi$ | <span style="color:#ECE800">Float2</span> | The angle ($\theta$) and the distance ($\phi$) |
| Center | <span style="color:#ECE800">Float2</span> | The center of the tunnel effect. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The unwrapped UV coordinate. |

## UV Bounds Verifier

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        A handy debug tool that highlights when the UV space is within 0-1 range.
    </td>
    <td><p align="center"> 
        <image src="./Images/UVBoundsVerifier.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Texture | <span style="color:#EC7500">Sampler</span> | The input texture. |
| uv | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| High Brightness | Float | The brightness level when the UV is within 0-1 range. |
| Low Brightness | Float | The brightness level when the UV is outside the 0-1 range. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Masked | <span style="color:#EE00E8">Color</span> | The sampled texture colour with the masking applied. |
| Intensity | Float | The brightness mask. |

## UV Padding

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Scales the UV coordinates towards the middle, padding the edges outward.
    </td>
    <td><p align="center"> 
        <image src="./Images/UVPadding.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Padding | <span style="color:#ECE800">Float2</span> | The amount of padding to add from each side in UV coordinates. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Padded UV | <span style="color:#ECE800">Float2</span> | The resulting padded UV. |

## UV Remapping

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Allows you to move the UV corners to different locations.
    </td>
    <td><p align="center"> 
        <image src="./Images/UVRemapping.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Bottom Left | <span style="color:#ECE800">Float2</span> | The new bottom left coordinate in UV space. |
| Bottom Right | <span style="color:#ECE800">Float2</span> | The new bottom right coordinate in UV space. |
| Top Left | <span style="color:#ECE800">Float2</span> | The new top left coordinate in UV space. |
| Top Right | <span style="color:#ECE800">Float2</span> | The new top right coordinate in UV space. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Mapped UV | <span style="color:#ECE800">Float2</span> | The remapped UV coordinates. |

## UV To Tunnel

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Wraps the UV coordinates around a point, converting it to polar coordinates.
    </td>
    <td><p align="center"> 
        <image src="./Images/UVToTunnel.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Center | <span style="color:#ECE800">Float2</span> | The center point to wrap the UV coordinates around. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| $\theta$, $\phi$ | <span style="color:#ECE800">Float2</span> | The angle ($\theta$) and the distance ($\phi$) |
| ddx/ddy | <span style="color:#ECE800">Float2</span> | The tangent corrected ddx ddy values

> [!NOTE]
> The ddx/ddy values don't have the seam problem.

