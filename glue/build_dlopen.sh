nm ../classpath-0.99/native/jni/{classpath,java-io,java-lang,java-net,java-nio,java-util,native-lib}/.libs/lib*.a | grep 'T Java_' | cut -d ' ' -f 3- | sort > functions.txt

{
    sed 's/.*/void \0();/' functions.txt
    echo 'struct { const char* name; void* value; } dlopen_funcs[] = {'
    sed 's/.*/    {"\0", \0},/' functions.txt
    echo '};'
    cat dlopen_stub.i
} > dlopen_stub.c
