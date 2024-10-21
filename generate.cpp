#include <iostream>
using namespace std;

int main(){
    int begin, end;
    begin = 300;
    end = 800;
    for(int i = begin; i < end + 1; i = i + 2){
        cout <<"        Polyp[" << i << ",x]," << endl;
    }
}
