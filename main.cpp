#include <iostream>
#include <cstdlib>
#include "point.h"
using namespace std;

int main()
{
    point p1(1, 1);
    point p2(2, 2);
    point p3;
    p3 = p1 + p2;
    cout << p3.x << " " << p3.y << endl;
    ++p1;
    cout << p1.x << " " << p1.y;
    return 0;
}
