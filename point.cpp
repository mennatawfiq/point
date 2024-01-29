#include "point.h"
point::point(int x, int y)
{
    this->x = x;
    this->y = y;
}
point point::operator+(const point &p2)
{
    point p3;
    p3.x = this->x + p2.x;
    p3.y = this->y + p2.y;
    return p3;
}
void point::operator++()
{
    this->x++;
    this->y++;
}
