# Utils

## ACES Approximation

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Approximates the ACES color space.
    </td>
    <td><p align="center"> 
        <image src="./Images/ACESApproximation.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Color | <span style="color:#EE00E8">Color</span> | The input colour. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| ACES Color | <span style="color:#EE00E8">Color</span> | The ACES mapped colour. |


## Blackbody Approximation

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Approximates the temperature of lightbulbs as RGB values.
    </td>
    <td><p align="center"> 
        <image src="./Images/BlackbodyApproximation.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Temp (Kelvin) | Float | The radiation temperature in kelvin. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Colour | <span style="color:#EE00E8">Color</span> | The blackbody radiation colour. |

## Box Side Mask

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a mask for the grid/cardinal directions.
    </td>
    <td><p align="center"> 
        <image src="./Images/BoxSideMask.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Direction | <span style="color:#7775E8">Float3</span> | The direction to evaluate. |
| UV Size | <span style="color:#ECE800">Float2</span> | The scale of the sidemask UVs. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Side Masks | <span style="color:#7775E8">Float3</span> | A mask for each XYZ direction, with range -1 to 1. |
| UV | <span style="color:#ECE800">Float2</span> | The UV coordinates of each side. |
| Distance | Float | The projection distance from the input direction to the surface. |

## Kelvin Converter

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Utility function that converts both celsius and fahrenheit to kelvin.
    </td>
    <td><p align="center"> 
        <image src="./Images/KelvinConverter.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Celsius | Float | The good input. |
| Fahrenheit | Float | The bad input. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Kelvin (C) | Float | Celsius -> Kelvin. |
| Kelvin (F) | Float | Fahrenheight -> Kelvin. |

## RGB to BW

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Converts an RGB value to its grayscale value.
    </td>
    <td><p align="center"> 
        <image src="./Images/RGBToBW.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| RGB | <span style="color:#EE00E8">Color</span> | Input RGB Colour. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| BW | Float | The resulting monochrome/luminance value. |

## Stereo Eye Index

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the eye index from within VR.
    </td>
    <td><p align="center"> 
        <image src="./Images/StereoEyeIndex.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| EyeIndex | Float | Returns 0 when rendering the left eye and 1 when rendering the right. |

## Transform Properties

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gets some of the object transform values.
    </td>
    <td><p align="center"> 
        <image src="./Images/TransformProperties.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Transform.Position | <span style="color:#7775E8">Float3</span> | The object worldspace position. |
| Transform.Scale | <span style="color:#7775E8">Float3</span> | The object worldspace scale. |