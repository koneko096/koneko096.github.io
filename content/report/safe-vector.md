+++
categories = ["testing"]
tags = ["debug", "error handling"]
date = "2018-12-16"
title = "Work Safely with C++ Vector"
+++

One of the notable feature of C++ (also C# and Obj-C) is operator overloading. In C++ vector, element can be accessed use "[]" bracket operator. Sounds good just like we accessing ordinary array. But there are problems with it. As the original behavior of array, accessing index out of allocated size will cause undefined behavior. Vector just doing so by preserving this behavior to the operator. 

{{< figure src="https://i.redd.it/wzr2x3zklg211.png" >}}

This design is leveraging explicit checking everytime before element access performed. This done pretty well to prevent [leaky abstraction](http://wiki.c2.com/?LeakyAbstraction). But debugging will be hard because of generic error. In my case, I had to deal with CUDA kernel allocation too, so this kind of error message could not help at all. 

Fortunately, std vector come with different method to get out of bound error. Instead of bracket operator, we can rely on *at* method. This way error handling become much easier. Here's an example.

{{< highlight cpp >}}
#include <stdexcept>    // out_of_range
#include <vector>

using namespace std;

int main() {
    vector<int> v(10, 0);
    try {
        v.at(15);
    }
    catch (const out_of_range& e) {
        cerr << "Error while access vector: " << e.what() << '\n';
    }
    return 0;
}
{{< /highlight >}}