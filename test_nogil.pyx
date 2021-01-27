cpdef int func(int a, int b) nogil:
    return a+b


print(func(1,2))


cdef int res

with nogil:
    res = func(22,33)

print(res)