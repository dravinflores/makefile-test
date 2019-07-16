## *Purpose*

This project was created to explore Makefiles in a deeper manner, by using some
of the functionality of make to enhance code maintainability. This means 
creating variables to define paths to source and header files, using variables
to change the configuration of the compiler, and using automatic variables to
ease the commands make must execute.

In this manner, the Makefile might be a bit more cryptic, however it will be far
better at compiling code. With a more robust Makefile, my hope is that it will
be modular enough to scale to any size project, no matter the complexity of the
structure. 

Fingers crossed.


## *Bugs Encountered*

One of the most perplexing bugs I encountered was clang throwing me an error 
that stated: `clang: cannot specify -o when generating multiple output files`.

In essence, this error would manifest whenever a command such as this was given
to the compiler: `clang++ a.cpp a.hpp -o a.o`.

In hind sight, the bug is easy to spot, however it did take quite some time to
pinpoint the issue. Essentially, including the header file in the source file is
enough to ensure that the code can be compiled properly, thereby removing the 
need to include a mention of the header file in the compile command to clang.

In this manner, so long as a `#include <a.hpp>` is in the source code, a mention
of this file only needs to be in the Makefile as a dependency for a particular
target. 

When I first came upon this bug, I spent quite some time trying to figure out
how to fix it. My initial solution was to omit any mention of the header file, 
even when describing target dependencies in make. However, this meant that the
source code would not be recompiled if any changes to the header files was made.

I then experimented a little, and found that I could leave the target dependency
mentioned, but omit it when calling clang. With a few searches, I confirmed that
there was no need to include a mention of the header file when calling clang.

While such an easy fix were I to have known this from the start, it has 
nonetheless proven a quite valuable piece of information. And I have learned
something new about the compilation process, which amounts to far more knowledge
obtained than just knowing that I didn't have to insert header files when 
compiling with clang.
