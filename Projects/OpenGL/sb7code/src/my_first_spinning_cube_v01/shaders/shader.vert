// #version 450 core

// in vec4 position;
// out VS_OUT
// {
// vec4 color;
// } vs_out;

// uniform mat4 mv_matrix;
// uniform mat4 proj_matrix;
// uniform float time;

// void main(void)
// {           
// gl_Position = proj_matrix * mv_matrix * position + time; 
// vs_out.color = position + vec4(0.5, 0.5, 0.5, 0.0);
// }                                                          

#version 430 core

layout(location = 0) in vec4 vPosition;
layout(location = 1) in vec2 uvCoords;
uniform float fTime;

// Output data ; will be interpolated for each fragment.
out vec2 fragCoord;
out float time;

void main()
{
   gl_Position = vPosition;

// The color of each vertex will be interpolated
// to produce the color of each fragment
	 fragCoord = uvCoords;
   time = fTime;
}
