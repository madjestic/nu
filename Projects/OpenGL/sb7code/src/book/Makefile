LIBPATH= ./lib
INCPATH= -I./include -I/home/madjestic/Projects/OpenGL/sb7code/include -I/home/madjestic/Projects/OpenGL/sb7code/usr/include
LDFLAGS= -L/usr/lib64 -lglfw -lGL -lGLEW -lglut -ldl -L/Projects/OpenGL/sb7code/lib -rdynamic lib/libsb7.a -lglfw -lX11 -lXrandr -lXinerama -lXi -lXxf86vm -lXcursor -lGL -lrt -ldl -Wl,-rpath,/home/madjestic/Projects/OpenGL/sb7code/lib
CXX_FLAGS = -D_LINUX -std=c++0x -fpermissive

all:
	make clean
	make gl3w
	g++ Main.cpp ./src/sb7.cpp ${LIBPATH}/gl3w.o $(CXX_FLAGS) $(INCPATH) $(LDFLAGS) -o Main

gl3w:
	g++ -c ./src/gl3w.c $(INCPATH) $(LDFLAGS) -o $(LIBPATH)/gl3w.o



clean:
	@if [ -f ${LIBPATH}/gl3w.o ];\
		then\
		rm $(LIBPATH)/gl3w.o 2> /dev/null;\
	else\
		echo "./gl3w already clean";\
	fi

	@if [ -f ./Main ];\
		then\
		rm ./Main 2> /dev/null;\
	else\
		echo "./Main already clean";\
	fi
