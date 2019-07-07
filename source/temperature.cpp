#include <temperature.hpp>

double convert_temperature(MODE mode, double temp)
{
    if (mode == MODE_FAHRENHEIT)
    {
        return (((temp - 32) * 5) / 9);
    }
    else if (mode == MODE_CELSIUS)
    {
        return (((temp * 9) / 5) + 32);
    }
    else 
    {
        return 0.00;
    }
}

