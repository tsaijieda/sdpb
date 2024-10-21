#include <iostream>
using namespace std;

int main(){
    int start = 5;
    int end = 20;
    int count = 0;
    cout << "{1, 3*new[4, 0, f, J] - new[4, 2, f, J]";
    for (int i = start; i < end + 1; i++){
        for(int j = 2; j < (i + 1)/2; j++){
            cout << "new[" << i << ", " << j << ", f, J] - new[" << i << ", " << i - j << ", f, J],";
            count++;
        }
    }
    cout << "}" << endl;
    for (int i = 0; i < count + 2; i++){
        cout << "0, ";
    }
    cout << endl;
}
