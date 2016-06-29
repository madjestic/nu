#include <sb7.h>
#include <vmath.h>
#include <object.h>
#include <shader.h>
#include <sb7ktx.h>


class spinningcube_app : public sb7::application
{
	void init()
	{
		static const char title[] = "Canvas";

		sb7::application::init();

		memcpy (info.title, title, sizeof (title));		
	}

	virtual void startup ()
	{

    GLuint vs, fs;

    vs = sb7::shader::load("shaders/shader.vert", GL_VERTEX_SHADER);
    fs = sb7::shader::load("shaders/shader.frag", GL_FRAGMENT_SHADER);

		program = glCreateProgram();
		glAttachShader(program, vs);
		glAttachShader(program, fs);
		glLinkProgram(program);

    glDeleteShader(vs);
    glDeleteShader(fs);

		glGenVertexArrays(1, &vao);
		glBindVertexArray(vao);

		static const GLfloat vertex_positions[] =
			{
				1.0f, -1.0f,  1.0f,
				-1.0f, -1.0f,  1.0f,
				1.0f,  1.0f,  1.0f,

				-1.0f, -1.0f,  1.0f,
				-1.0f,  1.0f,  1.0f,
				1.0f,  1.0f,  1.0f,
			};

		glGenBuffers(1, &buffer);
		glBindBuffer(GL_ARRAY_BUFFER, buffer);
		glBufferData(GL_ARRAY_BUFFER,
								 sizeof(vertex_positions),
								 vertex_positions,
								 GL_STATIC_DRAW);
		glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, NULL);
		glEnableVertexAttribArray(0);

		glEnable(GL_CULL_FACE);
		glFrontFace(GL_CW);

		glEnable(GL_DEPTH_TEST);
		glDepthFunc(GL_LEQUAL);
		
	}

	virtual void render(double currentTime)
	{
		static const GLfloat color[] = {1.0f, 0.25f, 0.0f, 1.0f};
		static const GLfloat one = 1.0f;

		glViewport(0, 0, info.windowWidth, info.windowHeight);
		glClearBufferfv(GL_COLOR, 0, color);
		glClearBufferfv(GL_DEPTH, 0, &one);

		glUseProgram(program);

		mv_location    = glGetUniformLocation(program, "mv_matrix");
		proj_location  = glGetUniformLocation(program, "proj_matrix");
    time_location  = glGetUniformLocation(program, "time");
    
		float time = (float)currentTime * 0.3;
		vmath::mat4 mv_matrix =
			vmath::translate(0.0f, 0.0f, -5.0f);
    
		glUniformMatrix4fv(mv_location, 1, GL_FALSE, mv_matrix);
		glUniformMatrix4fv(proj_location, 1, GL_FALSE, proj_matrix);
    glUniform1f(time_location, time);
    
		glDrawArrays(GL_TRIANGLES, 0, 36);
	}

	virtual void shutdown()
	{
		glDeleteVertexArrays(1, &vao);
		glDeleteProgram(program);
		glDeleteBuffers(1, &buffer);
	}

	void onResize(int w, int h)
	{
		sb7::application::onResize(w,h);

		aspect = (float)w / (float)h;
		proj_matrix = vmath::perspective(50.0f, aspect, 0.1f, 1000.0f);
	}


private:
	GLuint      vao;
	GLuint      buffer;
	GLuint      program;
	GLint       mv_location;
	GLint       proj_location;
  GLint       time_location;

	float aspect;
	vmath::mat4 proj_matrix;
};

DECLARE_MAIN(spinningcube_app)
