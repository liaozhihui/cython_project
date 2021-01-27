import rect
x0,y0,x1,y1=1,2,3,4
obj = rect.PyRectangle(x0,y0,x1,y1)
print(dir(obj))
print(obj.get_size())
obj.move(3, 5)
