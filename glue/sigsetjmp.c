// we have a lot of "undefined reference to sigsetjmp" but not a single reference to siglongjmp, wtf?? probably a leftover
unsigned long long sigsetjmp()
{
    return 0;
}
