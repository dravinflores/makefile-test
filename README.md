## *Purpose*

This project was created to explore Makefiles in a deeper manner, by using some
of the functionality of make to enhance code maintainability. This means 
creating variables to define paths to source and header files, using variables
to change the configuration of the compiler, and using automatic variables to
ease the commands make must execute.

In this manner, the Makefile is not necessarily easier to read, at least during
the initial glance. It may take a few viewings of the Makefile, as well as a 
few viewings of a manual page to piece together all this information. Luckily,
we live in the age of the internet, so all this information is at a click of a
button.


## *Bugs Encountered*

One of the most perplexing bugs I encountered was clang throwing me an error 
that stated: `clang: cannot specify -o when generating multiple output files`.

This was such an interesting bug, because I couldn't quite figure out how to fix
it. My initial solution was to just omit any header dependencies for all the 
build targets. This meant that any change to a header file would not be tracked
by make, requiring `$ make clean` to be ran first.

Luckily, this was actually a rather easy fix. Rather than removing the 
dependency from the target, I simply just didn't include the dependency in any
of the make commands. A rather simple fix, in hindsight, but this has spared me
from a larger headache. 
