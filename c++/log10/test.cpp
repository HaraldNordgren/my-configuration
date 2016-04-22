#include <iostream>
#include <cmath>
#include <cstdlib>
#include <string>
#include <cstring>

using namespace std;

int main(int argc, char *argv[]) {
    
    int inputLength = strlen(argv[1]);

    int prec = 25;

    cout.precision(prec + 1);
    cout << fixed;

    double minStep = std::pow(10, -(prec));
    //double minStep = std::pow(10, -5);

    //double doubleInternal = 1.99999999;
    //cout << endl << "doubleInternal:" << endl << doubleInternal << endl;

    double doubleValue ;
    sscanf(argv[1],"%lf", &doubleValue);
    cout << endl << "doubleValue:" << endl << argv[1] << " (Raw)" << endl;
    cout << doubleValue << " (Double variable, prec " << prec << ")" << endl << endl;

    double absValue = std::abs(doubleValue);
    if (absValue < minStep) {
        cout << "Step: " << endl << "(d->singleStep)" << endl;
        return 0;
    }
    
    int steps = std::stoi(argv[2]);

    if (std::signbit(doubleValue) != std::signbit(steps)) {
        absValue *= (100. / 101);
        cout << "Sign compensated:" << endl << absValue << endl << endl;
    }
    
    cout << "Raw logs:" << endl;
    double rawLog = log10(absValue);
    double rawLogFloored = floor(log10(absValue));
    double shift = pow(10, -floor(log10(absValue)) + 1);
    double rawStretched = absValue * shift;
    double absRounded = round(rawStretched) / shift;
    cout << rawLog << endl;
    cout << rawLogFloored << endl;
    cout << rawStretched << endl;
    cout << endl;
    
    cout << "Abs rounded: " << endl << absRounded << endl << endl;
    
    //cout << "Abs rounded: " << endl << round(absValue * 100) / 100 << endl << endl;

    double log = log10(absValue);
    //double log = log10(round(absValue * 100) / 100);
    //double log = log10(absValue);
    cout << "Logs:" << endl << log << endl;


    cout << log << endl;
    log = floorf(log);
    cout << log << endl;

    log--;

    cout << log << endl << endl;

    double singleStep = pow(10, log);
    cout << "singleStep:" << endl << singleStep << endl;

    double newdoubleValue = doubleValue + singleStep * steps;
    cout << newdoubleValue << endl;

    cout.precision(inputLength - 2);
    cout << newdoubleValue << endl << endl;

    /*int halfstep = step / 2;
    int rem = (a + halfstep) % step;
    cout << rem << endl;
    cout << a + halfstep - rem << endl;*/
}
