from distutils.core import setup,Extension
from Cython.Build import cythonize
import numpy


ext = Extension(name="test_regex", sources=["test_regex.pyx"],
                include_dirs=[numpy.get_include()],
                language="c++",
                extra_compile_args=["-std=c++11"])

setup(ext_modules=cythonize(ext))