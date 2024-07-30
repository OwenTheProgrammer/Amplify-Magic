# Extensions

## Generic Max

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements max for multi-component inputs.
    </td>
    <td><p align="center"> 
        <image src="./Images/GenericMax.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Vector2 | <span style="color:#ECE800">Float2</span> | An XY input. |
| Vector3 | <span style="color:#7775E8">Float3</span> | An XYZ input. |
| Vector4 | <span style="color:#EC00E8">Float4</span> | An XYZW input. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Max XY | Float | The maximum value of the Vector2's components. |
| Max XYZ | Float | The maximum value of the Vector3's components. |
| Max XYZW | Float | The maximum value of the Vector4's components. |

## Generic Min

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements min for multi-component inputs.
    </td>
    <td><p align="center"> 
        <image src="./Images/GenericMin.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Vector2 | <span style="color:#ECE800">Float2</span> | An XY input. |
| Vector3 | <span style="color:#7775E8">Float3</span> | An XYZ input. |
| Vector4 | <span style="color:#EC00E8">Float4</span> | An XYZW input. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Max XY | Float | The minimum value of the Vector2's components. |
| Max XYZ | Float | The minimum value of the Vector3's components. |
| Max XYZW | Float | The minimum value of the Vector4's components. |

## If Statement

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns true if the input is anything but zero.
    </td>
    <td><p align="center"> 
        <image src="./Images/IfStatement.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Expression | Float | The comparison expression input. (your value.) |
| True | Float | The value to return when true. |
| False | Float | The value to return when false. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The result. |

## Max Index 2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the component index of the maximum value.
    </td>
    <td><p align="center"> 
        <image src="./Images/MaxIndex2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Values | <span style="color:#ECE800">Float2</span> | The values to compare. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Max Index | Float | Returns 1 if Values.x > Values.y, otherwise returns 0. |

## Max Index 3

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the component index of the maximum value.
    </td>
    <td><p align="center"> 
        <image src="./Images/MaxIndex3.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Values | <span style="color:#7775E8">Float3</span> | The values to compare. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Max Index | Float | Returns the maximum component index. 0 if Values.x is largest, 1 if Values.y is largest, 2 if Values.z is largest. |

## Min Index 2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the component index of the minimum value.
    </td>
    <td><p align="center"> 
        <image src="./Images/MinIndex2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Values | <span style="color:#ECE800">Float2</span> | The values to compare. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Min Index | Float | Returns 1 if Values.x < Values.y, otherwise returns 0. |

## Min Index 3

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the component index of the minimum value.
    </td>
    <td><p align="center"> 
        <image src="./Images/MinIndex3.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Values | <span style="color:#7775E8">Float3</span> | The values to compare. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Min Index | Float | Returns the minimum component index. 0 if Values.x is smallest, 1 if Values.y is smallest, 2 if Values.z is smallest. |

## Sort 2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Sorts an XY vector while keeping track of the indices. Sorts from largest to smallest.
    </td>
    <td><p align="center"> 
        <image src="./Images/Sort2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Values | <span style="color:#ECE800">Float2</span> | The values to sort. |
| Indices | <span style="color:#ECE800">Float2</span> | The original index values, default (0,1). |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | <span style="color:#ECE800">Float2</span> | The sorted components. |
| Sorting Indices | <span style="color:#ECE800">Float2</span> | The new index ordering. |

## Sort 3

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Sorts an XYZ vector while keeping track of the indices. Sorts from largest to smallest.
    </td>
    <td><p align="center"> 
        <image src="./Images/Sort3.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Values | <span style="color:#7775E8">Float3</span> | The values to sort. |
| Indices | <span style="color:#7775E8">Float3</span> | The original index values, default (0,1,2). |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | <span style="color:#7775E8">Float3</span> | The sorted components. |
| Sorting Indices | <span style="color:#7775E8">Float3</span> | The new index ordering. |

## Value At Index

> [!CAUTION]
> I will be replacing this node shortly with a custom API implementation, as I don't fully trust this stupid node.

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Returns the component at a given index value.
    </td>
    <td><p align="center"> 
        <image src="./Images/ValueAtIndex.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Value | <span style="color:#EC00E8">Float4</span> | The value to index into. |
| Index | <span style="color:#ECE8E8">UInt</span> | The component index. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Output | Float | The component value at the index. |
