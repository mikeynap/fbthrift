#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from cpython.ref cimport PyObject
from libcpp.memory cimport shared_ptr
from thrift.py3.server cimport cServerInterface, cAsyncProcessorFactory
from folly cimport cFollyExecutor



cdef extern from "src/gen-cpp2/NullService.h" namespace "::cpp2":
    cdef cppclass cNullServiceSvAsyncIf "::cpp2::NullServiceSvAsyncIf":
      pass

    cdef cppclass cNullServiceSvIf "::cpp2::NullServiceSvIf"(
            cNullServiceSvAsyncIf,
            cServerInterface):
        pass



cdef extern from "src/gen-py3/empty/services_wrapper.h" namespace "::cpp2":
    cdef cppclass cNullServiceWrapper "::cpp2::NullServiceWrapper"(
        cNullServiceSvIf
    ):
        pass

    shared_ptr[cAsyncProcessorFactory] cNullServiceInterface "::cpp2::NullServiceInterface"(PyObject *if_object, cFollyExecutor* Q)
