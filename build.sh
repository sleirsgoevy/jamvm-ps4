export PATH="$(pwd)/bin:$PATH"

set -e

# build gmp
(
cd gmp-6.2.0
./configure
sed -i 's/#define HAVE_OBSTACK_VPRINTF 1/#define HAVE_OBSTACK_VPRINTF 0/g' config.h
make -j
)

# build zlib
(
cd zlib-1.2.11
./configure
make -j
)

# build gnu classpath
(
cd classpath-0.99
patch -p1 < ../classpath.patch
./configure --enable-jni --disable-gtk-peer --disable-gconf-peer --disable-plugin --disable-gjdoc --enable-static
make -j
)

# copy zlib headers
(
mkdir zlib-headers
cp zlib-1.2.11/{zlib,zconf,zutil}.h zlib-headers
)

# build jamvm
(
cd jamvm
patch -p1 < ../jamvm.patch
./autogen.sh --enable-static
make -j
)

# build dlsym stub
(
cd glue
bash build_dlopen.sh
)

# link stuff together
gcc -g -D main=jamvm_main glue/*.c jamvm/src/jam.c jamvm/src/.libs/libcore.a classpath-0.99/native/jni/{classpath,java-io,java-lang,java-net,java-nio,java-util,native-lib}/.libs/lib*.a zlib-1.2.11/libz.a gmp-6.2.0/.libs/libgmp.a -nostdlib -Wl,-r -o jamvm.o -fpie -no-pie
