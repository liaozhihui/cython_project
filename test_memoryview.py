
b = b"kmoeije satory"
m = memoryview(b)
print(m)
print(m[0], m[1])
print(f"{m[0]:c},{m[-1]:c}")