LIBPATH= ./lib
INCPATH= -I./include
LDFLAGS= -L/usr/lib64 -lglfw -lGL -lGLEW -lglut -ldl
CXX_FLAGS = -D_LINUX -std=c++0x

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
