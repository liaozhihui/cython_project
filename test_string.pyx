#distutils language=c++
from libcpp.unordered_map cimport unordered_map
from libcpp.string cimport string
cdef string _rec(string n):
    print(n.decode("utf-8"))
    return n

def rec(n):

    return _rec(n.encode("utf-8"))