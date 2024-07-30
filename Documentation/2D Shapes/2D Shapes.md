
# 2D Shapes

## Analytical Dot Matrix

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a black and white grid of dots based off the product of cosine waves. This node can be used as a soft pixel shader, since the dots fade away as you'd expect in real life.
    </td>
    <td><p align="center"> 
        <image src="./Images/AnalyticalDotMatrix.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate |
| Screen Resolution | <span style="color:#ECE800">Float2</span> | The amount of dots within the UV space |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Dot Grid | Float | The monochrome output, range 0 to 1. |

## Checkers Anti Aliased

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Generates a black and white checkers pattern. This node is also a filtered procedural, meaning it gets anti-aliased within the shader code.
    </td>
    <td><p align="center"> 
        <image src="./Images/CheckersAntiAliased.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate |
| Tiling | <span style="color:#ECE800">Float2</span> | The amount of squares, where (1,1) is a single black square. |
| Offset | <span style="color:#ECE800">Float2</span> | Offsets the texture coordinates by (X,Y) Squares, meaning a Tiling value of (4,4) would make Offset (1,0) move one square over. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The black and white output, range 0 to 1. |

## Circle Normal Map

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
    Generates an approximate normal mapping of a circle in linear space.
    </td>
    <td><p align="center"> 
        <image src="./Images/CircleNormalMap.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate |
| Position | <span style="color:#ECE800">Float2</span> | The position of the normal maps center in UV space (range 0 to 1) |
| Scale | Float | The diameter of the circle. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Circle Normal | <span style="color:#EE00E8">Color</span> | RGB: The normal map output, A: The normal map mask (0 on the background) |

## Circle Shape

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
    Generates a circle as a Signed Distance Field.
    </td>
    <td><p align="center"> 
        <image src="./Images/CircleShape.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate |
| Circle Position | <span style="color:#ECE800">Float2</span> | The circle's center position |
| Radius | Float | As you'd expect, the radius of the circle in UV scale |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Distance | Float | The signed distance from the pixel position to the surface of the circle. Signed because the distance is negative inside the circle and positive outside the circle. |
| Circle Mask | Float | A boolean black and white mask where the circle should be drawn. |
| Circle Mask (AA) | Float | The circle mask output but with anti aliased edges. |

## Combine SDFs

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Merges the distance values of any two SDF nodes into a single distance field.
    </td>
    <td><p align="center"> 
        <image src="./Images/CombineSDFs.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| SDF A | Float | The first SDF input value |
| SDF B | Float | The second SDF input value |
| Smoothness | Float | The blending smoothness term (smooth min internally) |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Combined SDF | Float | The merger of the two SDF inputs. |
| Mask ID | Float (Boolean) | The transition point / closest point / "domain-dominant" SDF. Returns 0 if SDF A is the closest, returns 1 if SDF B is the closest. |

## Grid Anti Aliased

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
    A basic black and white grid as a filtered procedural shader.
    </td>
    <td><p align="center"> 
        <image src="./Images/GridAntiAliased.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Grid Coverage | Float | The percentage of each grid cell being covered. 0 meaning all black, 1 meaning all white. |
| Tiling | <span style="color:#ECE800">Float2</span> | As you'd expect, the amount of tiles in the UV coordinate space. |
| Offset | <span style="color:#ECE800">Float2</span> | Offsets the texture coordinates by (X,Y) grid cells, meaning a Tiling value of (4,4) would make Offset (1,0) move one grid space over. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The evaluated monochrome value. |

## Line Shape

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
    An uber node and a half, giving you absolutely everything a line segment has to offer.
    </td>
    <td><p align="center"> 
        <image src="./Images/LineShape.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Point A | <span style="color:#ECE800">Float2</span> | The starting position in UV space of your line segment. |
| Point B | <span style="color:#ECE800">Float2</span> | The ending position of your line segment in UV space. |
| Line thickness | Float | The thickness of the line in UV coordinate space, 1 covers the entire space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Distance | Float | The Signed Distance Field of the line segment. |
| Line Mask | Float | The evaluated black and white mask where the line segment is to be rendered. |
| Line Mask (AA) | Float | The line mask but anti aliased. |
| Point-Line lerp term | Float | The linear interpolation "t" value that projects a UV position onto the line segment. This value is unclamped. |
| Point-Line lerp term (clamped) | Float | The same as the previous, just clamped to 0-1 range to clamp the projection value to the line segment end points. |
| Voronoi Quadrants* | <span style="color:#ECE800">Float2</span> | The voronoi diagram that defines the regions around the start and end points. See the definition table below. |
| Voronoi Quadrants (AA) | <span style="color:#ECE800">Float2</span> | The same as above, just anti aliased. |
| Direct Projection Mask | Float | Returns 1 if the UV position is within the region of the line segment, hitting the left or right side directly. This is the mask of the line segment if you extruded the left and right side outward infinitely. |
| Direct Projection Mask (AA) | Float | The same as above, but with anti aliasing. |
| Above Line? | <span style="color:#7775E8">Float3</span> (Float) | Returns 1 where the UV coordinate is considered "above the line." This takes into account the line tangent and only evaluates in UV space, not local to the line itself. |
| Field Index* | Float | A three step value that defines what side of the line's path the UV coordinate would land on. see the field index table below for more details. |


| Voronoi Value | Meaning |
| :-----------: | :------ |
| (0, 0) | Black means the current UV position would project onto Point A. |
| (1, 0) | Red means the current UV position would project onto the line segment from the right side. |
| (0, 1) | Green means the current UV position would project onto the line segment from the left side. |
| (1, 1) | Yellow means the current UV position would project onto Point B. |

| Field Index | Meaning |
| :---------: | :------ |
| 0.0 | Returns 0 if the position local to the line segment is below Point A. |
| 0.5 | returns 1/2 if the position local to the line segment on the line. |
| 1.0 | returns 1 if the position local to the line segment is above Point B. |

## Make Annular

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Converts a Signed Distance Field into an annular ring. This node punches a hole through any SDF input. This can also be thought as beveling the edges of an SDF, as if it was a wireframe.
    </td>
    <td><p align="center"> 
        <image src="./Images/MakeAnnular.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Distance | Float | The SDF input to annularize. |
| Width | Float | The edge-to-annular width in UV coordinate space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Annular Distance | Float | The new signed distance of the annularized SDF. |
| Annular Mask | Float | The black and white mask where the SDF is to be rendered. |
| Annular Mask (AA) | Float | Same as above, just monochrome anti aliased. |

## Realize SDF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Finalizes an SDF into its boundary defined black and white result.
    </td>
    <td><p align="center"> 
        <image src="./Images/RealizeSDF.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| SDF | Float | The SDF input to convert. |
| Cutoff | Float | The threshold point between white and black. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| SDF Shape | Float | The result. |
| SDF Shape (AA) | Float | Same as above, just anti aliased. |

## Round Out Shape

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Does exactly what you'd expect. Rounds the sides out of a Signed distance field.
    </td>
    <td><p align="center"> 
        <image src="./Images/RoundOutShape.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Distance | Float | The SDF distance input. |
| Rounding Term | Float | The rounding radius in UV space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Rounded SDF | Float | The new rounded SDF value. |

## Square Shape

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        A primitive SDF shape: the square. Defines the SDF of a rectangle.
    </td>
    <td><p align="center"> 
        <image src="./Images/SquareShape.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |
| Position | <span style="color:#ECE800">Float2</span> | The center position of the square in UV space. |
| Width/Height | <span style="color:#ECE800">Float2</span> | The width and height values of the square in UV space. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Distance | Float | The distance to the shape from the current UV coordinate. Negative when the coordinate is inside the shape, positive when it's outside the shape. |
| Square Mask | Float | The black and white region that defines where the SDF should be rendered, or just the shape itself. |
| Square Mask (AA) | Float | The same as above, just anti-aliased. |


