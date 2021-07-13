#include <unistd.h>
#include <errno.h>

ssize_t jamvm_sysc_write(int fd, const void* buf, size_t sz)
{
    if(fd == 2)
    {
        ssize_t ans = write(fd, buf, sz);
        if(ans < 0 && errno == EINVAL)
            return sz;
        return ans;
    }
    return write(fd, buf, sz);
}
