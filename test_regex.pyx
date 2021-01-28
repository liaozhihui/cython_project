#distutils language=c++
from libcpp.string cimport string
cdef extern from "regex_.h":
    cdef string find_keyword(string,string)

def find_key(string pattern,string str_):

    return find_keyword(pattern,str_)
