int jamvm_main(int argc, const char** argv);

int main()
{
    const char* args[] = {"jamvm", "-Xbootclasspath:/app0/assets/misc/classes.zip:/app0/assets/misc/glibj.zip", "-Djava.class.path=/app0/assets/misc/", "Hello", 0};
    return jamvm_main(sizeof(args)/sizeof(*args)-1, args);
}
