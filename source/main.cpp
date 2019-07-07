// This simple project is written in C++17. 

#include <iostream>
#include <temperature.hpp>
#include <say_hello.hpp>

int main(int argc, char** argv)
{
    std::cout << "86 F = " << convert_temperature(MODE_FAHRENHEIT, 86) << "\n";
    say_hello("Me");
    return 0;
}
