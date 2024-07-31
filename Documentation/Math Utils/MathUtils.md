# Math Utils

## Coarse Normal Reconstruction

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a faceted face normal from any derivable input. (typically the depth buffer.)
    </td>
    <td><p align="center"> 
        <image src="./Images/CoarseNormalReconstruction.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Input | <span style="color:#7775E8">Float3</span> | The functional input to compute the face direction for. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | <span style="color:#7775E8">Float3</span> | A crude face normal of the Input. |

## Direction To Signed Cube

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the hit position on a -S to +S 3D cube.
    </td>
    <td><p align="center"> 
        <image src="./Images/DirectionToSignedCube.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Direction | <span style="color:#7775E8">Float3</span> | The direction vector (doesn't need to be normalized.) |
| Scale | <span style="color:#7775E8">Float3</span> | The scale of the cube. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Direction On Cube | <span style="color:#7775E8">Float3</span> | The reprojected direction, hitting the surface of the cube. |
| Tangents | <span style="color:#7775E8">Float3</span> | The individual side lengths. |
| Distance | Float | The distance from the current direction vector to the surface of the cube. |

## Filtered Cosine

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the analytical model of the cosine function for band limiting.
    </td>
    <td><p align="center"> 
        <image src="./Images/FilteredCosine.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Input | Float | The cosine input. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The filtered cosine value. |

## Get Tangent Delta

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the scaling factor for a given projection angle.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetTangentDelta.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Angle (Degrees) | Float | The projection angle in degrees. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| FOV Slope | Float | The tangent derivative of the projection angle. |

## Get UV Analytic Model 

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the primitive values for a filtered procedural function.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetUVAnalyticModel.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Domain Size | <span style="color:#ECE800">Float2</span> | The UV space the pixel on your screen takes up. |
| Sample A | The left hand side sample point. |
| Sample B | The right hand side sample point. |

This follows the integral convention of
$$
\int{f(x)dx} = \lim_{w \rightarrow 0}{\frac{F(x+w) - F(x-w)}{w}}
$$
Where $x-w$ is Sample A, $x+w$ is Sample B, and $w$ is the Domain Size.

## Integral Circle Approximation

> [!NOTE]
> Basically, don't worry about this node.

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Used in Analytical Dot Matrix node, representing a circles filtered procedural function.
    </td>
    <td><p align="center"> 
        <image src="./Images/IntegralCircleApproximation.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Domain Width | <span style="color:#ECE800">Float2</span> | The UV space the pixel on your screen takes up. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| F(x, y) | <span style="color:#ECE800">Float2</span> | The evaluated integral parts. |

## Is Inside 01 Range

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Validates the bounds of a UV coordinate are within 0 to 1 range.
    </td>
    <td><p align="center"> 
        <image src="./Images/IsInside01Range.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Input | <span style="color:#EC00E8">Float4</span> | Any dimension of inputs. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Inside [0 \| 1] | Float | Returns 1 if all components are inside range, otherwise returns 0. |

## Smooth Max

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements a smoother maximum function.
    </td>
    <td><p align="center"> 
        <image src="./Images/SmoothMax.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| A | Float | The first input. |
| B | Float | The second input. |
| Smooth Term | Float | the square smoothness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | smoothmax(A, B) |

## Smooth Min

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements a smoother minimum function.
    </td>
    <td><p align="center"> 
        <image src="./Images/SmoothMin.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| A | Float | The first input. |
| B | Float | The second input. |
| Smooth Term | Float | the square smoothness value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | smoothmin(A, B) |

## Smoothstep 10

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements a better form of smoothstep(x, 1, 0)
    </td>
    <td><p align="center"> 
        <image src="./Images/Smoothstep10.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Input | Float | The input value. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | Roughly smoothstep(x, 1, 0) |

This function follows as such:

$$
\left( x^2-1 \right)^2
$$

## Stairstep (Terracing)

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Splits the UV coordinate space into steps.
    </td>
    <td><p align="center"> 
        <image src="./Images/StairstepTerracing.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Input | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Steps | Float | The amount of steps to truncate precision by. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Terraced Output | <span style="color:#ECE800">Float2</span> | The stairstepped input. |
| Continuous Domain | <span style="color:#ECE800">Float2</span> | The scaled UV without stairstepping for mipmap level selection. |

## Step AA

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the step function with anti aliasing.
    </td>
    <td><p align="center"> 
        <image src="./Images/StepAA.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Lesser (A) | <span style="color:#EC00E8">Float4</span> | The less-than component input. |
| Greater (B) | <span style="color:#EC00E8">Float4</span> | The greater-than component input. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| B >= A? | <span style="color:#EC00E8">Float4</span> | The step evaluation with anti-aliasing. |

## UV ddxy

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        All the ddx ddy values you could possibly want.
    </td>
    <td><p align="center"> 
        <image src="./Images/UVddxy.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| dx dy | <span style="color:#ECE800">Float2</span> | ddx(u), ddy(v) |
| dx dy (abs) | <span style="color:#ECE800">Float2</span> | abs(ddx(u)), abs(ddy(v)) | 
| max( dx dy ) | Float | max( abs(ddx(u)), abs(ddy(v)) ) |
| ddxy | <span style="color:#EC00E8">Float4</span> | xy: ddx(uv), zw: ddy(uv) |
| ddxy (abs) | <span style="color:#EC00E8">Float4</span> | xy: abs(ddx(uv)), zw: abs(ddy(uv)) |
| max( ddx ddy ) | <span style="color:#ECE800">Float2</span> | max( abs(ddx(uv)), abs(ddy(uv)) ) |