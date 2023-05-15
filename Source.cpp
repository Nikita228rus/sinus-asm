#include <iostream>
#include <string>
using namespace std;

extern "C" float sinus_asm(int, float, int); //делитель(фактариал), угол, степень
extern "C" int sumper(int, int);
extern "C" int factorial(int);
extern "C" int iteration(int);


float sinus(float alpha, int iter) {
	
	float result = 0;
	for (int i = 0; i < iter; i++) {
		if (i % 2 == 0) {
			int degree = iteration(i);
			int fact = factorial(degree);
			float s = sinus_asm(fact, alpha, degree);
			result += s;
		}
		else {
			int degree = iteration(i);
			int fact = factorial(degree);
			float s = sinus_asm(fact, alpha, degree);
			result -= s;
		}
	}
	return result;
}


int main()
{
	
	float s = sinus(0.79, 2);
	cout << s;
	
}