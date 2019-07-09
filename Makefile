# ============================================================================ #

# This Makefile was created with the intention of compiling code in different
# directories, as well as allowing for a much more easily maintained codebase.

# Paths to the various subdirectories
SOURCE    := source
INCLUDE   := include
OBJECT    := object

# Compiler related variables
CC        := clang++
CXXFLAGS  := -std=c++17 -Wall -Wextra -Werror -pedantic -I $(INCLUDE)

# Paths to the files themselves
SRC_FILES := $(SOURCE)/main.cpp $(SOURCE)/say_hello.cpp $(SOURCE)/student.cpp \
             $(SOURCE)/temperature.cpp

INC_FILES := $(INCLUDE)/say_hello.hpp $(INCLUDE)/student.hpp \
             $(INCLUDE)/temperature.hpp

OBJ_FILES := $(OBJECT)/main.o $(OBJECT)/say_hello.o $(OBJECT)/student.o \
             $(OBJECT)/temperature.o

# Recipies for building
build: $(OBJ_FILES)
	$(CC) $(CXXFLAGS) $^ -o $@

# main.o
$(word 1, $(OBJ_FILES)): $(word 1, $(SRC_FILES)) $(INC_FILES) 
	$(CC) $(CXXFLAGS) -c $< -o $@

# say_hello.o
$(word 2, $(OBJ_FILES)): $(word 2, $(SRC_FILES)) $(word 1, $(INC_FILES))
	$(CC) $(CXXFLAGS) -c $< -o $@

# student.o
$(word 3, $(OBJ_FILES)): $(word 3, $(SRC_FILES)) $(word 2, $(INC_FILES))
	$(CC) $(CXXFLAGS) -c $< -o $@

# temperature.o
$(word 4, $(OBJ_FILES)): $(word 4, $(SRC_FILES)) $(word 3, $(INC_FILES))
	$(CC) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf object/*.o include/*.gch build
