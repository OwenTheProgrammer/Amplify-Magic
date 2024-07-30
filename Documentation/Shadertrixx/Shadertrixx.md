# Shadertrixx

These nodes are based off [CNLohr's](https://github.com/cnlohr) public [shadertrixx github project](https://github.com/cnlohr/shadertrixx). I've contributed some of the things there, along with plenty others that are incredibly smart. I recommend checking it out!

## Camera Forward (Object Space)

[How to compute camera foward in object space](https://github.com/cnlohr/shadertrixx?tab=readme-ov-file#how-to-compute-camera-forward-in-object-space)

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gets the camera forward direction in object space.
    </td>
    <td><p align="center"> 
        <image src="./Images/CameraForwardObjectSpace.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Object Space CamFwd | <span style="color:#7775E8">Float3</span> | Camera forward direction in object space. |

## Get VR Eye Depth

[Best practice for getting depth of a given pixel from the depth texture](https://github.com/cnlohr/shadertrixx?tab=readme-ov-file#best-practice-for-getting-depth-of-a-given-pixel-from-the-depth-texture)

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the camera eye depth while keeping mirrors happy.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetVREyeDepth.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Depth Buffer Value | Float | The camera depth buffer value. |
| Screen UV | <span style="color:#ECE800">Float2</span> | The screen UV coordinates. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Eye Depth | Float | The proper VR and mirror compatible eye depth. |

## Pixelate (AA)

[Lyuma beautiful retro pixels technique](https://github.com/cnlohr/shadertrixx?tab=readme-ov-file#lyuma-beautiful-retro-pixels-technique)

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Love this shit, an integral pixelation method.
    </td>
    <td><p align="center"> 
        <image src="./Images/PixelateAA.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Texture | <span style="color:#EC7500">Sampler</span> | The texture to sample. |
| UV | <span style="color:#ECE800">Float2</span> | The texture coordinate. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Pixelated UV (AA) | <span style="color:#ECE800">Float2</span> | The pixelated UV coordinate. |

## Stereo Screen Position

Can be found further in 
[Best practice for getting depth of a given pixel from the depth texture](https://github.com/cnlohr/shadertrixx?tab=readme-ov-file#best-practice-for-getting-depth-of-a-given-pixel-from-the-depth-texture)

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Computes the screen space position for each eye in VR.
    </td>
    <td><p align="center"> 
        <image src="./Images/StereoScreenPosition.png"/> 
    </p></td>
</tr>
</table>


| Output | Type | Description |
| :----: | :--: | :---------  |
| Screen Space position | <span style="color:#ECE800">Float2</span> | The screen space position in VR. |

## VR Info

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        A collection of information from within VR/VRChat.
    </td>
    <td><p align="center"> 
        <image src="./Images/VRInfo.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Is Panorama | Float | Returns 1 if the current camera is a VRChat panorama camera, otherwise returns 0. |
| Is VR Hand Camera Preview | Float | Returns 1 if the current camera is a VRChat handheld camera's preview display, otherwise returns 0. |
| Is VR Hand Camera | Returns 1 if the current camera is a VRChat handheld camera, otherwise returns 0. |
| Is Desktop | Float | Returns 1 if the VRChat user is currently on PC and not in VR, otherwise returns 0. |
| Is Mirror | Float | Returns 1 if the current camera is a VRChat mirror, otherwise returns 0. |
| Is Left Eye | Float | Returns 1 if the current eye is the left eye, otherwise returns 0. |
| Is Right Eye | Float | Returns 1 if the current eye is the right eye, otherwise returns 0. |
