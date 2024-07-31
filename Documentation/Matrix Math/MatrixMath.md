# Matrix Math

# Conventions:
Using any Matrix2x2, the convention for notation is as follows.

$$
    \begin{bmatrix}
        A & B \\
        C & D \\
    \end{bmatrix} 
    \text{  or  }
    \begin{bmatrix}
        0 & 1 \\
        2 & 3 \\
    \end{bmatrix} 
    \text{  or  }
    \begin{bmatrix}
        \_m00 & \_m01 \\
        \_m10 & \_m11 \\
    \end{bmatrix}
    \text{  or  }
    \begin{bmatrix}
        TL & TR \\
        BL & BR \\
    \end{bmatrix} 
$$

with the $\_m\left[\text{ROW}\right]\left[\text{COLUMN}\right]$ notation being default.

## Apply Mat2x2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Applies a Matrix2x2's actions and transformations onto a vector.
    </td>
    <td><p align="center"> 
        <image src="./Images/ApplyMat2x2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |
| Vector | <span style="color:#ECE800">Float2</span> | The vector to apply the matrix on. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| mul(Mat2x2, Vector) | <span style="color:#ECE800">Float2</span> | The result. |

## As Mat2x2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Defines a 2x2 Matrix given individial values.
    </td>
    <td><p align="center"> 
        <image src="./Images/AsMat2x2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| _m00 | Float | The top left input. |
| _m01 | Float | The top right input. |
| _m10 | Float | The bottom left input. |
| _m11 | Float | The bottom right input. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Mat2x2 | <span style="color:#77E875">Matrix2x2</span> | The initialized 2x2 matrix. |

## As Scalar Mat2x2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a scalar 2x2 matrix from a scalar Vector2.
    </td>
    <td><p align="center"> 
        <image src="./Images/AsScalarMat2x2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Scalar | <span style="color:#ECE800">Float2</span> | The XY Scale terms. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Scalar Matrix | <span style="color:#77E875">Matrix2x2</span> | The initialized 2x2 matrix. |

## As Scalar Mat3x3

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Creates a scalar 3x3 matrix from a scalar Vector3.
    </td>
    <td><p align="center"> 
        <image src="./Images/AsScalarMat3x3.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Scalar | <span style="color:#7775E8">Float3</span> | The XYZ Scale terms. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Scalar Matrix | <span style="color:#77E875">3x3 Matrix</span> | The initialized 3x3 matrix. |

## Get Mat2x2 Component

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Selects an individual value from a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetMat2x2Component.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |
| Component Index | <span style="color:#ECE8E8">Int</span> | The index from 0 to 3. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Value | Float | The component value at the given index. |

## Get Mat2x2 Inverse Scale

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Computes a 2x2 matrix's reciprocal scalar.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetMat2x2InverseScale.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| 1/Scale | <span style="color:#ECE800">Float2</span> | The 1/xy scale terms. |
| Inverse Scale Matrix | <span style="color:#77E875">Matrix2x2</span> | The inverse scale in matrix form. |

## Get Mat2x2 Scale

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Computes a 2x2 matrix's scale factor.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetMat2x2Scale.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Scalar Term | <span style="color:#ECE800">Float2</span> | The XY scale terms. |
| Scalar (Matrix Form) | <span style="color:#77E875">Matrix2x2</span> | The scale terms in matrix form. |

## Get Mat3x3 Scale

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Computes a 3x3 matrix's scale factor.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetMat3x3Scale.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix | <span style="color:#77E875">3x3 Matrix</span> | The input 3x3 matrix. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Scalar Term | <span style="color:#7775E8">Float3</span> | The XYZ scale terms. |

## Get Vec2 Tangent

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the tangent vector of an input Vector2.
    </td>
    <td><p align="center"> 
        <image src="./Images/GetVec2Tangent.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Normal | <span style="color:#ECE800">Float2</span> | The original direction vector. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Tangent | <span style="color:#ECE800">Float2</span> | The vector tangential to the input vector. |

## Linearize Quad Projection

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        The NDC perspective divide of ObjectGI.
    </td>
    <td><p align="center"> 
        <image src="./Images/LinearizeQuadProjection.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Projection Pos | <span style="color:#EC00E8">Float4</span> | The clipspace projection position. |
| FOV (Degrees) | Float | The projection angle of the original clipspace. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Linear Z Depth | Float | The linearized depth value. |
| Linear Projected Pos | <span style="color:#7775E8">Float3</span> | The clipspace -> NDC space. |

## Mat2x2 Adjugate

> [!NOTE]
> This node will be pretty much useless to users, but it's used internally.

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Computes the adjugate matrix of a 2x2.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Adjugate.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Adj(Matrix2x2) | <span style="color:#77E875">Matrix2x2</span> | The adjugate of the input. |

## Mat2x2 Break

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Splits out the components of a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Break.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| _m00 (TL\|A) | Float | The top left value. |
| _m01 (TR\|B) | Float | The top right value. |
| _m10 (BL\|C) | Float | The bottom left value. |
| _m11 (BR\|D) | Float | The bottom right value. |

## Mat2x2 Determinant

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the area scale factor of a 2x2 matrix's transform.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Determinant.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Det(Matrix2x2) | Float | The determinant. |

## Mat2x2 Get Basis Vectors

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Gets the basis vectors of a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2GetBasisVectors.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Basis Vector (X) | <span style="color:#ECE800">Float2</span> | The 2x2 matrix's local "right" direction. |
| Basis Vector (Y) | <span style="color:#ECE800">Float2</span> | The 2x2 matrix's local "up" direction. |

## Mat2x2 Get Column

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Splits out the column vectors of a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2GetColumn.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| _m00_m10 (lhs) | <span style="color:#ECE800">Float2</span> | The Left-Hand-Side column of the matrix. |
| _m01_m11 (rhs) | <span style="color:#ECE800">Float2</span> | The Right-Hand-Side column of the matrix. |

## Mat2x2 Get Diagonal

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Splits out the diagonal components as a vector from a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2GetDiagonal.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| _m00_m11 | <span style="color:#ECE800">Float2</span> | The matrix diagonal vector. |

## Mat2x2 Get Rotation Angle

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Calculates the rotation angle of a matrix from 0 to tau.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2GetRotationAngle.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Rotation Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Angle \[0-2pi\] | Float | The rotation angle this matrix used in radians. |


## Mat2x2 Get Row

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Splits out the top and bottom rows of a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2GetRow.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| _m00_m01 (top) | <span style="color:#ECE800">Float2</span> | The top row. |
| _m10_m11 (btm) | <span style="color:#ECE800">Float2</span> | The bottom row. |

## Mat2x2 Identity

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        The 2x2 matrix that encodes no action. (It does nothing.)
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Identity.png"/> 
    </p></td>
</tr>
</table>


| Output | Type | Description |
| :----: | :--: | :---------  |
| Identity Matrix | <span style="color:#77E875">Matrix2x2</span> | The identity matrix. |

## Mat2x2 Inverse

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Computes the matrix that negates all actions for a 2x2 matrix.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Inverse.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2* | <span style="color:#77E875">Matrix2x2</span> | The "undo" 2x2 matrix. |

## Mat2x2 Multiply

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Multiplies or "combines" the actions of two 2x2 matrices.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Multiply.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| A | <span style="color:#77E875">Matrix2x2</span> | The first input 2x2 matrix. |
| B | <span style="color:#77E875">Matrix2x2</span> | The second input 2x2 matrix. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| A x B | <span style="color:#77E875">Matrix2x2</span> | Both matrices combined/multiplied together. |

## Mat2x2 Normalize

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Converts a 2x2 matrix with a scalar term into an orthonormal matrix (no scale.)
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Normalize.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Normal Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The normalized 2x2 matrix. |

## Mat2x2 Rotation Matrix

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Constructs a Counter-Clock-Wise 2x2 rotation matrix given an angle.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2RotationMatrix.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Angle (radians) | Float | The angle in radians. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Rotor Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The 2x2 rotation matrix. |

## Mat2x2 Transpose

> [!TIP]
> Because of some math stuff, a 2x2 rotation matrix's transposition is the negative rotation direction. This means if you make a rotation matrix with 45 degrees, the transpose will be the same as making a -45 degree rotation matrix.

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Flips a 2x2 matrix along its diagonal.
    </td>
    <td><p align="center"> 
        <image src="./Images/Mat2x2Transpose.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Transposed Matrix | <span style="color:#77E875">Matrix2x2</span> | The matrix transposition. |

## Project From Quad

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Constructs a projection/perspective matrix, projecting forward from the surface of a quad.
    </td>
    <td><p align="center"> 
        <image src="./Images/ProjectFromQuad.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Position | <span style="color:#EC00E8">Float4</span> | The world space position (initialze W = 1 recommended.) |
| FOV (degrees) | Float | The projection angle in degrees. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| Projected Pos | <span style="color:#EC00E8">Float4</span> | The projected homogenous clip space position. |

## Rotation Mat2x2 From Vector

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Constructs a rotation matrix given a direction vector.
    </td>
    <td><p align="center"> 
        <image src="./Images/RotationMat2x2FromVector.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Vector (X) | <span style="color:#ECE800">Float2</span> | The rotation matrix local "X" direction. |


| Output | Type | Description |
| :----: | :--: | :---------  |
| X Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The constructed rotation matrix. |

## Scale Mat2x2

<table>
<tr><th>Description</th><th>Node Showcase:</th></tr>
<tr>
    <td>
        Scales all components of a 2x2 matrix by some scalar term.
    </td>
    <td><p align="center"> 
        <image src="./Images/ScaleMat2x2.png"/> 
    </p></td>
</tr>
</table>

| Input  | Type | Description |
| :----: | :--: | :---------  |
| Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The input 2x2 matrix. |
| Scalar | Float | The scalar value. |

| Output | Type | Description |
| :----: | :--: | :---------  |
| Scaled Matrix2x2 | <span style="color:#77E875">Matrix2x2</span> | The resulting scaled matrix. |