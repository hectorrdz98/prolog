#include <iostream>

using namespace std;

int limite = 0;
long long hist[31];

long long formas(int n) {
    int i, x;
    long long aux, t1, t2;
    if(n < limite) return hist[n];
    if(n == 0) {
        hist[limite++] = 1;
        return 1;
    }
    aux = 0;
    for(i=0; i<n; ++i) {
        t1 = (i < limite) ? hist[i] : formas(i);
        x = n-i-1;
        t2 = (x < limite) ? hist[x] : formas(x);
        aux += t1*t2;
    }
    hist[limite++] = aux;
    return aux;
}

int main() {
    int n;
    cout << "N: ";
    cin >> n;
    for (int i = 0; i <= n; ++i)
    {
        long long temp = formas(i);
        cout << i << '\t' << temp << endl;
    }
    return 0;
}