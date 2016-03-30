#include <iostream>
#include <cmath>
#include <cstdlib>

using namespace std;

int main(int argc, char *argv[]) {

    int a = atoi(argv[1]);

    int log = int(log10(a));

    if (log > 0) {
        log--;
    }
    cout << log << endl;

    int step = int(pow(10, log));
    cout << step << endl;

    int halfstep = step / 2;
    int rem = (a + halfstep) % step;
    cout << rem << endl;
    cout << a + halfstep - rem << endl;

    //cout << int(pow(10, log)) << endl;
}
