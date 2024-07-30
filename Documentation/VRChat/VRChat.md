# VRChat

## Camera Info

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gives some information about the VRChat cameras.
    </td>
    <td><p align="center"> 
        <image src="./Images/CameraInfo.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Eye Center Position | <span style="color:#7775E8">Float3</span> | The world space position between your eyes. |
| Stereo IPD | Float | The inter-pupulary distance in world units. |
| Horizontal FOV (degrees) | The current cameras Horizontal Field Of View in degrees. |
| Vertical FOV (degrees) | The current cameras Vertical Field Of View in degrees. |

## Camera Mask

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gives some information about the VRChat camera layer mask.
    </td>
    <td><p align="center"> 
        <image src="./Images/CameraMask.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Value | <span style="color:#ECE8E8">Int</span> | The raw _VRChatCameraMask value. |
| Parameter Available | Float | Returns 1 if the camera mask data is available. |
| Layer\[0\]: Default | Float | Returns 1 if the camera layer is on the default layer. |
| Layer\[1\]: TransparentFX | Float | Returns 1 if the camera layer is on the TransparentFX layer. |
| Layer\[2\]: Ignore Raycast | Float | Returns 1 if the camera layer is on the Ignore Raycast layer. |
| Layer\[4\]: Water \| VRCMirror | Float | Returns 1 if the camera layer is on either the water layer or VRChats mirror layer. |
| Layer\[5\]: UI | Float | Returns 1 if the camera layer is on the UI layer. |
| Layer\[8\]: Interactive | Float | Returns 1 if the camera layer is on the Interactive layer where things are interactible. |
| Layer\[9\]: Player (Except you) | Float | Returns 1 if the camera layer is on the Player layer that has every player except you. |
| Layer\[10\]: PlayerLocal (only you) | Float | Returns 1 if the camera layer is on the PlayerLocal layer, which only holds you. |
| Layer\[11\]: Environment | Float | Returns 1 if the camera layer is on the Environment layer. |
| Layer\[12\]: UIMenu | Float | Returns 1 if the camera layer is on the VRChat UIMenu layer. |
| Layer\[14\]: PickupNoEnvironment | Float | Returns 1 if the camera layer is on the PickupNoEnvironment layer, where dynamic pickups live. |
| Layer\[15\]: StereoLeft | Float | Returns 1 if the camera layer is on the left VR eye. |
| Layer\[16\]: StereoRight | Float | Returns 1 if the camera layer is on the right VR eye. |
| Layer\[17\]: Walkthrough | Float | Returns 1 if the camera layer is on the layer where players can walkthrough things. |
| Layer\[18\]: MirrorReflection | Float | Returns 1 if the camera layer is on the MirrorReflection layer, where things in the mirror are. |

## Camera Mode

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        The type of VRChat camera.
    </td>
    <td><p align="center"> 
        <image src="./Images/CameraMode.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Value | Float | Returns the raw _VRChatCameraMode value. |
| \[0\] Is Normal | Float | Returns 1 if the camera is nothing special. |
| \[1\] Is Handheld (VR) | Float | Returns 1 if the camera is a VR handheld camera. |
| \[2\] Is Handheld (Desktop) | Float | Returns 1 if the camera is a Desktop handheld camera. |
| \[3\] Is Screenshot | Float | Returns 1 if the camera is the one used for screenshots. |

## Mirror Info

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gives some information about the VRChat mirrors.
    </td>
    <td><p align="center"> 
        <image src="./Images/MirrorInfo.png"/> 
    </p></td>
</tr>
</table>

| Output | Type | Description |
| :----: | :--: | :---------  |
| Value | Float | Gives the raw _VRChatMirrorMode value. |
| \[0\] Not In Mirror | Float | Returns 1 if currently outside a mirror. |
| \[1\] In Mirror (VR) | Float | Returns 1 if in view of a mirror in VR. |
| \[2\] In Mirror (Desktop) | Float | Returns 1 if in view of a mirror on Desktop. |
| Mirror Camera Position | <span style="color:#7775E8">Float3</span> | The world space position of the mirrors camera. |