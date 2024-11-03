#include <iostream>
using namespace std;

int main(){
    int begin, end;
    begin = 2002;
    end = 5000;
    for(int i = begin; i < end + 1; i = i + 2){
        cout <<"        Polyp[" << i << ",x]," << endl;
    }
}
