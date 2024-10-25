#include <iostream>
using namespace std;

int main(){
    int begin, end;
    begin = 802;
    end = 2000;
    for(int i = begin; i < end + 1; i = i + 2){
        cout <<"        Polyp[" << i << ",x]," << endl;
    }
}
