#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from cpython.ref cimport PyObject
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp cimport bool as cbool
from libcpp.map cimport map as cmap, pair as cpair
from libcpp.memory cimport shared_ptr, unique_ptr
from libcpp.set cimport set as cset
from libcpp.string cimport string
from libcpp.vector cimport vector

from folly cimport cFollyFuture, cFollyTry, cFollyUnit
cimport folly.iobuf as __iobuf
from thrift.py3.common cimport cRpcOptions

cimport service.types as _service_types

cimport module.types as _module_types
cimport includes.types as _includes_types

cdef extern from "src/gen-cpp2/MyService.h" namespace "cpp2":
  cdef cppclass cMyServiceAsyncClient "cpp2::MyServiceAsyncClient":
      pass

cdef extern from "<utility>" namespace "std":
  cdef unique_ptr[cMyServiceClientWrapper] move(unique_ptr[cMyServiceClientWrapper])

cdef extern from "src/gen-py3/service/clients_wrapper.h" namespace "cpp2":
  cdef cppclass cMyServiceClientWrapper "cpp2::MyServiceClientWrapper":
    cFollyFuture[cFollyUnit] disconnect()
    void setPersistentHeader(const string& key, const string& value)

    cFollyFuture[cFollyUnit] query(cRpcOptions, 
      _module_types.cMyStruct arg_s,
      _includes_types.cIncluded arg_i,)
    cFollyFuture[cFollyUnit] has_arg_docs(cRpcOptions, 
      _module_types.cMyStruct arg_s,
      _includes_types.cIncluded arg_i,)
