// PARAM: --enable ana.int.interval_set --enable ana.int.def_exc --enable ana.int.enums
#include<stdio.h>
#include <goblint.h>

int a = 0;
int main(void)
{
    f(50);
    
    __goblint_check (a<20);
    __goblint_check (a<15);
    __goblint_check (a<10);
    __goblint_check (a<5);
    __goblint_check (a==0);
}

int f(int i)
{
    

    if (i > 0){
        i--;
        a = i;
        f(i);
    }

}


