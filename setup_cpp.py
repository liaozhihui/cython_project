from distutils.core import setup,Extension
from Cython.Build import cythonize
import numpy


ext = Extension(name="rect", sources=["rect.pyx"],
                language="c++",
                extra_compile_args=["-std=c++11"])

setup(ext_modules=cythonize(ext,language=3))