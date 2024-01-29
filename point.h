#pragma once
#ifndef POINT_H
#define POINT_H
class point
{
public:
    int x, y;
    point(int x = 0, int y = 0);
    point operator+(const point &p2);
    void operator++();
};
#endif
