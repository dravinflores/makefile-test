#ifndef TEMPERATURE_HPP
#define TEMPERATURE_HPP

enum MODE
{
    MODE_FAHRENHEIT,
    MODE_CELSIUS
};

double convert_temperature(MODE mode, double temp);

#endif // TEMPERATURE_HPP
