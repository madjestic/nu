#include <iostream>
#include <Eigen/Dense>
using namespace Eigen;
using namespace std;

int main() 
{
  Matrix2d a, b, c;
  a << 1, 2,
       3, 4;
  b << 2, 3,
       1, 4;
  c = a + b - a - b + a;

  cout << c << "\n";
  return 0;
}
