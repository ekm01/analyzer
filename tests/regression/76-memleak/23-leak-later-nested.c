//PARAM: --set ana.malloc.unique_address_count 1 --set ana.activated[+] memLeak
#include <stdlib.h>
#include <pthread.h>

int *g;
int *m1;
int *m2;

void *f2(void *arg) {
    // Thread t2 leaks m0 and t1_ptr here
    quick_exit(2); //WARN
}

void *f1(void *arg) {
    pthread_t t2;
    pthread_create(&t2, NULL, f2, NULL);

    int *t1_ptr = malloc(sizeof(int));

    pthread_join(t2, NULL);
    // t1_ptr is leaked, since t2 calls quick_exit() potentially before this program point
    free(t1_ptr);
}

int main(int argc, char const *argv[]) {
    pthread_t t1;
    pthread_create(&t1, NULL, f1, NULL);

    int* m0 = malloc(sizeof(int));
    free(m0);

    // main thread is not leaking anything
    return 0;
}
