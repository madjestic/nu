#include "math.h"
#include <sb7.h>

class singlepoint_app : public sb7::application
{
	void init()
	{
		static const char title[] = "OpenGL SuperBible - Single Point";

		sb7::application::init();

		memcpy(info.title, title, sizeof(title));
	}

	virtual void startup()
	{
		static const char * vs_source[] =
			{
				"#version 450 core                                                   \n"
				"layout (location = 0) in vec4 offset;                               \n"
				"layout (location = 1) in vec4 color;                                \n"
				"// Declare VS_OUT as an output interface block                      \n"
				"out VS_OUT                                                          \n"
				"{                                                                   \n"
					"vec4 color;  // Send color to the next stage                      \n"
				"} vs_out;                                                           \n"
				"                                                                    \n"
				"void main(void)                                                     \n"
				"{                                                                   \n"
				"    const vec4 vertices[3] = vec4[3](vec4( 0.25, -0.25, 0.5, 1.0),  \n"
				"                                     vec4(-0.25, -0.25, 0.5, 1.0),  \n"
				"                                     vec4( 0.25,  0.25, 0.5, 1.0)); \n"
				"                                                                    \n"
				"    gl_Position = vertices[gl_VertexID] + offset;                   \n"
				"                                                                    \n"
				"vs_out.color = color;                                               \n"
				"}                                                                   \n"
			};

		static const char * tcs_source[] =
			{
				"#version 450 core                                                                     \n"
				"layout (vertices = 3) out;                                                            \n"
				"void main(void)                                                                       \n"
				"{                                                                                     \n"
					"if (gl_InvocationID == 0)                                                           \n"
				    "{                                                                                 \n"
							"gl_TessLevelInner[0] = 15.0;                                                     \n"
							"gl_TessLevelOuter[0] = 15.0;                                                     \n"
							"gl_TessLevelOuter[1] = 15.0;                                                     \n"
							"gl_TessLevelOuter[2] = 15.0;                                                     \n"
						"}                                                                                 \n"
				    "gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;         \n"
				"}                                                                                     \n"
			};

		static const char * tes_source[] =
			{
				"#version 450 core                                                   \n"
				"layout (triangles, equal_spacing, cw) in;                           \n"
				"void main(void)                                                     \n"
				"{                                                                   \n"
					"gl_Position = (gl_TessCoord.x * gl_in[0].gl_Position) +           \n"
						            "(gl_TessCoord.y * gl_in[1].gl_Position) +           \n"
						            "(gl_TessCoord.z * gl_in[2].gl_Position);            \n"
				"}                                                                   \n"
			};

		static const char * fs_source[] =
			{
				"#version 450 core                                                   \n"
				"                                                                    \n"
				"in VS_OUT                                                           \n"
				"{                                                                   \n"
					"vec4 color;                                                       \n"
				"} fs_in;                                                            \n"
				"                                                                    \n"
				"out vec4 color;                                                     \n"
				"                                                                    \n"
				"void main(void)                                                     \n"
				"{                                                                   \n"
				"    color = fs_in.color;                                            \n"
				"}                                                                   \n"
			};
				
		program = glCreateProgram();
		
		GLuint vs = glCreateShader(GL_VERTEX_SHADER);
		glShaderSource(vs, 1, vs_source, NULL);
		glCompileShader(vs);

		GLuint tcs = glCreateShader(GL_TESS_CONTROL_SHADER);
		glShaderSource(tcs, 1, tcs_source, NULL);
		glCompileShader(tcs);

		GLuint tes = glCreateShader(GL_TESS_EVALUATION_SHADER);
		glShaderSource(tes, 1, tes_source, NULL);
		glCompileShader(tes);
		
		GLuint fs = glCreateShader(GL_FRAGMENT_SHADER);
		glShaderSource(fs, 1, fs_source, NULL);
		glCompileShader(fs);
		

		glAttachShader(program, vs);
		glAttachShader(program, tcs);
		glAttachShader(program, tes);
		glAttachShader(program, fs);

		glLinkProgram(program);

		glGenVertexArrays(1, &vao);
		glBindVertexArray(vao);

		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	}

	virtual void render(double currentTime)
	{
		//static const GLfloat color[] = { 1.0f, 0.0f, 0.0f, 1.0f };
		const GLfloat color[] = { (float)sin(currentTime) * 0.5f + 0.5f,
															(float)cos(currentTime) * 0.5f + 0.5f,
															0.0f, 1.0f};
		glClearBufferfv(GL_COLOR, 0, color);

		glUseProgram(program);

		GLfloat attrib[] = { (float)sin(currentTime) * 0.5f,
		                     (float)cos(currentTime) * 0.6f,
		                     0.0f, 0.0f };

		GLfloat attrib1[] = { (float)sin(currentTime) * 0.7f,
		                      (float)cos(currentTime) * 0.8f,
		                      (float)sin(currentTime) * 0.9f,
													0.0f };
		// Update the value of input attribute 0
		glVertexAttrib4fv(0, attrib);
		glVertexAttrib4fv(1, attrib1);
		
		//glPointSize(40.0f);
		glDrawArrays(GL_PATCHES, 0, 3);
	}

	virtual void shutdown()
	{
		glDeleteVertexArrays(1, &vao);
		glDeleteProgram(program);
	}

private:
	GLuint          program;
	GLuint          vao;
};

DECLARE_MAIN(singlepoint_app)
