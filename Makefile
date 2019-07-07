# ============================================================================ #

# This Makefile was created with the intention of compiling code in different
# directories, as well as allowing for a much more easily maintained codebase.

# Paths to the various subdirectories
SOURCE    := source
INCLUDE   := include
OBJECT    := object

# Compiler related variables
CC        := clang++
CXXFLAGS  := -std=c++17 -Wall -W -I $(INCLUDE)

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

# For some odd reason, omitting the header files allows for the '-o' flag to be
# used properly. Without this omission, an erroneous error will be thrown.
# Unfortunately, this also means that make will not rebuild if there is a 
# change in the header files. Needs more research.
$(word 1, $(OBJ_FILES)): $(word 1, $(SRC_FILES)) 
	$(CC) $(CXXFLAGS) -c $^ -o $@

$(word 2, $(OBJ_FILES)): $(word 2, $(SRC_FILES))
	$(CC) $(CXXFLAGS) -c $^ -o $@

$(word 3, $(OBJ_FILES)): $(word 3, $(SRC_FILES))
	$(CC) $(CXXFLAGS) -c $^ -o $@

$(word 4, $(OBJ_FILES)): $(word 4, $(SRC_FILES))
	$(CC) $(CXXFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	rm -rf object/*.o include/*.gch build
