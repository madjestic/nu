#OBJS specifies which files to compile as part of the project
OBJS = src/Main.cpp src/glad.c src/stb_image.cpp

#CC specifies which compiler we're using
CC = g++ -std=c++0x

#COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
COMPILER_FLAGS = -Iinclude

#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = -Llib -lglfw -ldl
#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = Main

#This is the target that compiles our executable
all : $(OBJS)
	$(CC) $(OBJS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

run :
	rm ./Main
	make
	gpu ./Main
