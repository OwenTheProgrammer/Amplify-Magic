# Shadow Functions

## GGX GSF

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Implements the GGX Geometric Shadow Function.
    </td>
    <td><p align="center"> 
        <image src="./Images/GGXGSF.png"/> 
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
| Output | Float | The Geometric Shadow Factor. |
