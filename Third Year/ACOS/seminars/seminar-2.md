# C programming language. 

It is a lower level langugae, that allows us to see how are we to interact with memory in paritcular. We will use it to become more aquainted with the operating system. 


```c
#include <stdio.h>

int main() {
    printf("Hello, world!\n")
    return 0; 
}
```

```c
#include <stdio.h>

int square(int x) {
    return x * x;
}

int main() {
    int n = S; 

    if (n > 0) {
        for (int i = 0 ; i < n; ++i) {
            printf("%d/n", square(i));
        }
    }

    return 0;
}

```

On average `int` takes up 4 bytes, but in really it can depend on the operating system. 

A byte is the smallest space of memory that we can refer to using an adress. We cannot refer to a bit, only to a byte.


### Types: 

```c
int # integers  
unsinged # represents only nonnegative numbers 
char # is a single byte
long # larger or the same as int 
size_t # used for sizes and adresses. 
float # floating numbers 
```

**How does printf work?**

The `%d/n` is telling the language what we are planning on putting there, for it does not attempt to guess it. 

```c
int `%d/n`
unsinged `%u/n`
char `%c/n`
char as int `%d/n`
long `%ld/n`
size_t `%zu/n`
float `%f` / `%.2f/n`  
```

### Arrays & vectors: 

C is a very primitive language, it does not have vectors. Essentially when working with arrays in c, you can modify it, but you are unable to change its size. 

```c
#include <stdio.h>

void inspect_parameter (int *a) {
    printf("sizeof(parameter) : $zu/n", sizeof(a));
    print("first element through paramter: %d/n", *a);
}

int main() {
    int a[3] = {10, 20, 3}; 

    printf('sizeof(array) : %zu/n", sizeof(a));
    printf("number of elements: zu/n" , sizeof(a) / sizeof(a[0]));
    printf("a[1]: %d/n", a[0]);
    printf("*a: %d/n", *a);
    printf("*a(a + 1): %d/n", *(a + 1));

    inspect_parameter(a);
    return 0;
}
```

When using `*(a + 1)` you are not 


### C Strings. 

In contrast 

```c
int main() {
    char s[] = "abc"; 
    char s2[3] = {'a', 'b', 'c'} 

    # there two are not the same thing, even if they would generate the same 
    # array of chars. The correct showcase would be like: 

    char s[]  = "abc";
    char s2[4] =  {'a', 'b', 'c', '/0'} 

    # C needs to be told when does the string end, which the /0 exists for. 

    char *literal = "abc"; 
    literal[0] = 'l'; 

    # This thing initialized, and on the line 113 we are attempting to change it, and this array cannot be change. 

    printf("sizeof(s)): %zu/n", sizeof(a)); 
    printf("strlen(s): %zu/n", strlen(s));

    #more from seminar here  
}
```

### C Overflow. 

**Unsinged.**


```c
int main(){
    unsinged x = 0; 
    # 4 bytes, (4 bytes * 32 bit (ones or zeroes)) ( from discrete math the mx val would be 2 ** (num of bits))
    unsinged y = x - 1; 

    printf("UNIT_MAX: %u/n", UNIT_MAX);
    printf("0u - 1: %u/n", y);
    printf("UNIT_MAX + 1: %u/n:, UNIT_MAX + 10);
    return 0
}

```

**Int.** 

```c
#include <climits>
#include <iostream>

int main() {
    volatile int x  = INT_MAX; 

    if (x + 1 > x) {
        std::cout << "no singed overflow/n";
    } else {
        std::cout << "singed overflow happened/n"; 
    }
}
```

The complier would assume that `x + 1` is always `x`. 

**Password overflow example.** 