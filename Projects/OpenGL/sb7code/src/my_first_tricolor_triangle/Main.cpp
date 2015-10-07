#include "math.h"
#include <sb7.h>

class test_app : public sb7::application
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
				"out VS_OUT                                                          \n"
				"{                                                                   \n"
					"vec4 color;  // Send color to the next stage                      \n"
				"} vs_out;                                                           \n"
				"void main(void)                                                     \n"
				"{                                                                   \n"
				"    const vec4 vertices[3] = vec4[3](vec4( 0.25, -0.25, 0.5, 1.0),  \n"
				"                                     vec4(-0.25, -0.25, 0.5, 1.0),  \n"
				"                                     vec4( 0.25,  0.25, 0.5, 1.0)); \n"
				"                                                                    \n"
				"    const vec4 colors[] = vec4[3](vec4(1.0, 0.0, 0.0, 1.0),         \n"
																			    "vec4(0.0, 1.0, 0.0, 1.0),         \n"
																			    "vec4(0.0, 0.0, 1.0, 1.0));        \n"
				"                                                                    \n"
				"gl_Position = vertices[gl_VertexID];                                \n"
				"                                                                    \n"
				"vs_out.color = colors[gl_VertexID];                                     \n"
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

		GLuint fs = glCreateShader(GL_FRAGMENT_SHADER);
		glShaderSource(fs, 1, fs_source, NULL);
		glCompileShader(fs);
		

		glAttachShader(program, vs);
		glAttachShader(program, fs);

		glLinkProgram(program);

		glDeleteShader(vs);
		glDeleteShader(fs);

		glGenVertexArrays(1, &vao);
		glBindVertexArray(vao);

		//glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	}

	virtual void render(double currentTime)
	{
		//static const GLfloat color[] = { 1.0f, 0.0f, 0.0f, 1.0f };
		const GLfloat color[] = { (float)sin(currentTime) * 0.5f + 0.5f,
															(float)cos(currentTime) * 0.5f + 0.5f,
															0.0f, 1.0f};
		glClearBufferfv(GL_COLOR, 0, color);

		glUseProgram(program);
		
		//glPointSize(20.0f);
		glDrawArrays(GL_TRIANGLES, 0, 3);
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

	

DECLARE_MAIN(test_app)
