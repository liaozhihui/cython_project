from libcpp.string import string
from libcpp.regex import regex

cdef:
    string str = "你好，我是lzh"
    string rs="lzh"
    regex expression(rs)

str = regex_replace(str,expression,string("zsx"))
print(str)