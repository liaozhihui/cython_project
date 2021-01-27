# distutils: language=c++

from Rectangle cimport Rectangle

cdef class PyRectangle:
    cdef Rectangle c_ret

    def __cinit__(self,int x0,int y0,int x1,int y1):

        self.c_ret = Rectangle(x0,y0,x1,y1)

    def get_area(self):
        return self.c_ret.getArea()

    def get_size(self):

        cdef int width
        cdef int height
        self.c_ret.getSize(width,height)
        return width,height

    def move(self,dx,dy):
        self.c_ret.move(dx,dy)