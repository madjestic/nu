#include <sb7.h>
#include <vmath.h>

class spinningcube_app : public sb7::application
{
	void init()
	{
		static const char title[] = "Spinny Cube";

		sb7::application::init();

		memcpy (info.title, title, sizeof (title));		
	}

	virtual void startup ()
	{
		static const char * vs_source [] =
			{
				"#version 450 core                                           \n"
				"in vec4 position;                                           \n"
				"out VS_OUT                                                  \n"
				"{                                                           \n"
					"vec4 color;                                               \n"
				"} vs_out;                                                   \n"
				"uniform mat4 mv_matrix;                                     \n"
				"uniform mat4 proj_matrix;                                   \n"
				"void main(void)                                             \n"
				"{                                                           \n"
					"gl_Position = proj_matrix * mv_matrix * position;         \n"
					"vs_out.color = position * 2.0 + vec4(0.5, 0.5, 0.5, 0.0); \n"
				"}                                                           \n"
			};

		static const char * fs_source[] =
			{
				"#version 450 core                                           \n"
				"out vec4 color;                                             \n"
				"in VS_OUT                                                   \n"
				"{                                                           \n"
					"vec4 color;                                               \n"
				"} fs_in;                                                    \n"
				"void main(void)                                             \n"
				"{                                                           \n"
					"color = fs_in.color;                                      \n"
				"}                                                           \n"
			};

		program = glCreateProgram();
		GLuint fs = 
	}
public:
	// spinningcube_app();
	// virtual ~spinningcube_app();
};

DECLARE_MAIN(spinningcube_app)
