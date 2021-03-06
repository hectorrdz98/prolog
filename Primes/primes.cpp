#include <iostream>
#include <math.h>
#include <time.h>

using namespace std;

int is_prime(int n) {
    if (n<2) return 0;
    if (n==2) return 1;
    if (!(n & 1)) return 0;
    int r = sqrt(n);
    for (int i = 2; i <= r; i++)
        if (!(n % i)) return 0;
    return 1;
    
}

int main() {
    int n1 = 1;
    int n2 = 2000000000;
    int total = 0;
    clock_t tStart = clock();
    for (int i = n1; i <= n2; i++)
    {
        if (is_prime(i)) total++;
    }
    cout << "Total: " << total << endl;
    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
    
    return 0;
}
