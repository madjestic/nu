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
				"#version 420 core                                                 \n"
				"                                                                  \n"
				"void main(void)                                                   \n"
				"{                                                                 \n"
				"    const vec4 vertices[] = vec4[](vec4( 0.25, -0.25, 0.5, 1.0),  \n"
				"                                   vec4(-0.25, -0.25, 0.5, 1.0),  \n"
				"                                   vec4( 0.25,  0.25, 0.5, 1.0)); \n"
				"                                                                  \n"
				"    gl_Position = vertices[gl_VertexID];                          \n"
				"}                                                                 \n"
			};

		static const char * fs_source[] =
			{
				"#version 420 core                                                 \n"
				"                                                                  \n"
				"out vec4 color;                                                   \n"
				"                                                                  \n"
				"void main(void)                                                   \n"
				"{                                                                 \n"
				"    color = vec4(0.0, 0.8, 1.0, 1.0);                             \n"
				"}                                                                 \n"
			};
		// static const char * vs_source[] =
		// 	{
		// 		"#version 450 core                             "				
		// 		"void main(void)                               "
		// 		"{                                             "
		// 		"    const vec4 vertices[3] = vec4[3](vec4( 0.25, -0.25, 0.5, 1.0), "
		// 		"                                     vec4(-0.25, -0.25, 0.5, 1.0), "
		// 		"                                     vec4( 0.25,  0.25, 0.5, 1.0));"
		// 		"    gl_Position = vertices[gl_VertexID];"
		// 		"}                                             "
		// 	};

		// static const char * fs_source[] =
		// 	{
		// 		"#version 450 core                             "
		// 		"out vec4 color;                               "
		// 		"void main(void)                               "
		// 		"{                                             "
		// 		"    color = vec4(0.0, 0.8, 1.0, 1.0);         "
		// 		"}                                             "
		// 	};

		// static const char * vs_source[] =
		// 	{
		// 		"#version 420 core                             \n"
		// 		"                                              \n"
		// 		"void main(void)                               \n"
		// 		"{                                             \n"
		// 		"    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);   \n"
		// 		"}                                             \n"
		// 	};

		// static const char * fs_source[] =
		// 	{
		// 		"#version 420 core                             \n"
		// 		"                                              \n"
		// 		"out vec4 color;                               \n"
		// 		"                                              \n"
		// 		"void main(void)                               \n"
		// 		"{                                             \n"
		// 		"    color = vec4(0.0, 0.8, 1.0, 1.0);         \n"
		// 		"}                                             \n"
		// 	};
				
		program = glCreateProgram();
		GLuint fs = glCreateShader(GL_FRAGMENT_SHADER);
		glShaderSource(fs, 1, fs_source, NULL);
		glCompileShader(fs);

		GLuint vs = glCreateShader(GL_VERTEX_SHADER);
		glShaderSource(vs, 1, vs_source, NULL);
		glCompileShader(vs);

		glAttachShader(program, vs);
		glAttachShader(program, fs);

		glLinkProgram(program);

		glGenVertexArrays(1, &vao);
		glBindVertexArray(vao);
	}

	virtual void render(double currentTime)
	{
		//static const GLfloat color[] = { 1.0f, 0.0f, 0.0f, 1.0f };
		const GLfloat color[] = { (float)sin(currentTime) * 0.5f + 0.5f,
															(float)cos(currentTime) * 0.5f + 0.5f,
															0.0f, 1.0f};
		glClearBufferfv(GL_COLOR, 0, color);

		glUseProgram(program);

		//glPointSize(40.0f);

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

DECLARE_MAIN(singlepoint_app)
