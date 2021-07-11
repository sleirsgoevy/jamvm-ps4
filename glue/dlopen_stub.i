void* dlopen()
{
    return (void*)1ull;
}

void* dlsym(void* handle, const char* name)
{
    int start = 0;
    int end = sizeof(dlopen_funcs) / sizeof(dlopen_funcs[0]);
    int idx = 0;
    do
    {
        int l = start - 1;
        int h = end - 1;
        while(h - l > 1)
        {
            int m = (h + l + 1) / 2;
            if(dlopen_funcs[m].name[idx] >= name[idx])
                h = m;
            else
                l = m;
        }
        if(dlopen_funcs[h].name[idx] != name[idx])
            return 0;
        start = l = h;
        h = end;
        while(h - l > 1)
        {
            int m = (h + l) / 2;
            if(dlopen_funcs[m].name[idx] > name[idx])
                h = m;
            else
                l = m;
        }
        end = h;
    }
    while(name[idx++]);
    return dlopen_funcs[start].value;
}

char* dlerror()
{
    return 0;
}

void* dladdr()
{
    return 0;
}

void* dlclose()
{
    return 0;
}
