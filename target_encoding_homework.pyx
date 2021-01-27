#distutils: language = c++
import numpy as np
cimport numpy as np
from cython cimport boundscheck,wraparound
from cython.parallel import prange
cimport cython
from libcpp.unordered_map cimport unordered_map

def target_mean_v3(data, y_name, x_name):
    y_ = np.array(data[y_name].tolist())
    x_ = np.array(data[x_name].tolist() )
    len = data.shape[0]
    return cython_v3(len,y_,x_)


def target_mean_v4(data, y_name, x_name):
    y_ = np.array(data[y_name].tolist())
    x_ = np.array(data[x_name].tolist() )
    len = data.shape[0]
    return cython_v4(len,y_,x_)
    

@cython.boundscheck(False)
@cython.wraparound(False)
cdef cython_v3(int len, long [:] y_, long [:] x_):
    matrix = np.zeros(len)
    cdef double[:] result = np.ascontiguousarray(matrix, dtype=np.float64)
    #cdef unordered_map[long,long] count_dict
    #cdef unordered_map[long,long] value_dict
    cdef dict count_dict = {}
    cdef dict value_dict = {}
    cdef int i


    for i in range(len):
        #if value_dict.count(x_[i])==0:
        if x_[i] not in  value_dict.keys():
            value_dict[x_[i]] = y_[i]
            count_dict[x_[i]] = 1
        else:
            value_dict[x_[i]] += y_[i]
            count_dict[x_[i]] += 1
    for i in range(len):
        result[i] = (value_dict[x_[i]] - y_[i]) / (count_dict[x_[i]] - 1)
    return result

@cython.boundscheck(False)
@cython.wraparound(False)
cdef cython_v4(int len, long [:] y_, long [:] x_):
    matrix = np.zeros(len)
    cdef double[:] result = np.ascontiguousarray(matrix, dtype=np.float64)
    cdef unordered_map[long,long] count_dict
    cdef unordered_map[long,long] value_dict
    cdef int i


    for i in range(len):
        if value_dict.count(x_[i])==0:
        #if x_[i] not in  value_dict.keys():
            value_dict[x_[i]] = y_[i]
            count_dict[x_[i]] = 1
        else:
            value_dict[x_[i]] += y_[i]
            count_dict[x_[i]] += 1
    for i in range(len):
        result[i] = (value_dict[x_[i]] - y_[i]) / (count_dict[x_[i]] - 1.0)

    return result