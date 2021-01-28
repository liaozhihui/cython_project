from distutils.core import setup,Extension
from Cython.Build import cythonize
import numpy


ext = Extension(name="test_string", sources=["test_string.pyx"],
                language="c++",
                extra_compile_args=["-std=c++11"])

setup(ext_modules=cythonize(ext))