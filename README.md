# jamvm-ps4

This is a (possibly incomplete) port of JamVM, a free implementation of Java 1.6 runtime, to the PS4. It successfully runs a "Hello, world!" from normal classpath (not bootclasspath).

A port of some Java-based game would be great, but it's unlikely to happen until GNM is reversed.

## Building

Dependencies:
* OpenOrbis PS4 toolchain
* JDK
* zlib
* m4
* libtool
* autoconf
* automake
* zip

To download JamVM & dependencies:

```
wget https://gmplib.org/download/gmp/gmp-6.2.0.tar.lz && tar -xvf gmp-6.2.0.tar.lz
wget https://zlib.net/zlib-1.2.11.tar.gz && tar -xvf zlib-1.2.11.tar.gz
wget https://ftp.gnu.org/gnu/classpath/classpath-0.99.tar.gz && tar -xvf classpath-0.99.tar.gz
git clone https://github.com/xranby/jamvm
```

To build, run `bash build.sh`. This will build JamVM and all dependencies, and produce `jamvm.o` in the root directory. This object can then be linked into an application.
