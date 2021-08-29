+++
categories = ["experiment", "hpc"]
tags = ["config", "cuda", "parallel-computing", "gpu", "gcc"]
date = "2020-06-26"
title = "Installing CUDA 10.2 in Ubuntu 20.04"
type = "posts"
+++

Around last week I just bought a GPU for my PC. Actually, I intended to use it for speed up Persona 5 run on RPCS3. But it turned out the bottleneck is in the CPU itself. ~~And then I cried and rolled in the corner.~~ Suddenly, while playing with barely enough 30fps and 720p, I remembered having some side projects about RL. Okay 10series, it's time to work.

I started by downloading and installing latest version of CUDA toolkit (11.0) without driver. Thanks to Pop! OS for providing proprietary graphic drivers. After a while, I runned `nvidia-smi` that shows CUDA version 10.2. I expect it to be minimum CUDA version supported and ignore it.

After finishing installation and compiling samples successfully, the simplest sample `deviceQuery` showed an error.
```
code=35(cudaErrorInsufficientDriver)
```
Then, I looked again on [CUDA compatibility page](https://docs.nvidia.com/deploy/cuda-compatibility/index.html) and found out at least driver version 450.36 to run CUDA 11. Meanwhile my graphic uses driver version 440.84. Ok, fine.

Right there I downloaded again CUDA 10.2 (the second latest with supported driver version) and reran the installation. And then tried to compile and run samples again. Guess what? Now, the GCC version is not supported. What the funny!

After few searches, looks like the old CUDA 10.2 (it was released in late 2018) only knew GCC 8 and current Linux mainline (especially for my Pop 20.04) uses `build-essential` with GCC 9.3. But, it's bit too risky to downgrade GCC to 8. やばい

Looks like my luck still remains. I found similiar issues with somebody's library and they also reluctant to downgrade the GCC version because the ABI for C++ Boost they used did not provide backward compatibility. They're looking what issues may happened when they ran the CUDA 10.2 with GCC 9. They didn't find anything major and continue editing. After some modification, it turned out work perfectly fine. The samples then compiled and worked safe and sound.

For anyone encounter the same problem, here's the patch I use

{{< highlight diff >}}
--- /usr/local/cuda-10.2/include/crt/host_config.h      2020-06-26 14:53:37.947817611 +0000
+++ /usr/local/cuda-10.2/include/crt/host_config.h      2020-06-26 14:54:08.204086102 +0000
@@ -133,11 +133,11 @@
 
 #if defined(__GNUC__)
 
-#if __GNUC__ > 8
+#if __GNUC__ > 9
 
-#error -- unsupported GNU version! gcc versions later than 8 are not supported!
+#error -- unsupported GNU version! gcc versions later than 9 are not supported!
 
-#endif /* __GNUC__ > 8 */
+#endif /* __GNUC__ > 9 */
 
 
 #if defined(__clang__) && !defined(__ibmxl_vrm__) && !defined(__ICC) && !defined(__HORIZON__) && !defined(__APPLE__)
--- /usr/include/c++/9/bits/stl_function.h      2020-06-26 18:39:20.692976417 +0000
+++ /usr/include/c++/9/bits/stl_function.h      2020-06-26 18:37:56.744398062 +0000
@@ -414,7 +414,7 @@
       operator()(_Tp* __x, _Tp* __y) const _GLIBCXX_NOTHROW
       {
 #if __cplusplus >= 201402L
-#ifdef _GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED
+#if defined(_GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED) && !defined(__CUDACC__)
        if (__builtin_is_constant_evaluated())
 #else
        if (__builtin_constant_p(__x > __y))
@@ -433,7 +433,7 @@
       operator()(_Tp* __x, _Tp* __y) const _GLIBCXX_NOTHROW
       {
 #if __cplusplus >= 201402L
-#ifdef _GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED
+#if defined(_GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED) && !defined(__CUDACC__)
        if (__builtin_is_constant_evaluated())
 #else
        if (__builtin_constant_p(__x < __y))
@@ -452,7 +452,7 @@
       operator()(_Tp* __x, _Tp* __y) const _GLIBCXX_NOTHROW
       {
 #if __cplusplus >= 201402L
-#ifdef _GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED
+#if defined(_GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED) && !defined(__CUDACC__)
        if (__builtin_is_constant_evaluated())
 #else
        if (__builtin_constant_p(__x >= __y))
@@ -471,7 +471,7 @@
       operator()(_Tp* __x, _Tp* __y) const _GLIBCXX_NOTHROW
       {
 #if __cplusplus >= 201402L
-#ifdef _GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED
+#if defined(_GLIBCXX_HAVE_BUILTIN_IS_CONSTANT_EVALUATED) && !defined(__CUDACC__)
        if (__builtin_is_constant_evaluated())
 #else
        if (__builtin_constant_p(__x <= __y))
{{< /highlight >}}