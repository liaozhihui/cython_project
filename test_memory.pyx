from cython cimport boundscheck,wraparound
def summer(double[:] numbers):
    cdef double res = 0
    cdef int i,N
    N = numbers.shape[0]

    with boundscheck(False),wraparound(False):
        for i in range(N):
            res += numbers[i]
    return res