#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from folly.iobuf import IOBuf as __IOBuf
import thrift.py3.types
import thrift.py3.exceptions
from thrift.py3.types import NOTSET, NOTSETTYPE
from thrift.py3.serializer import Protocol
import typing as _typing

import sys
import itertools
import transitive.types as _transitive_types


__property__ = property


class Included(thrift.py3.types.Struct, _typing.Hashable, _typing.Iterable[_typing.Tuple[str, _typing.Any]]):
    def __init__(
        self, *,
        MyIntField: _typing.Optional[int]=None,
        MyTransitiveField: _typing.Optional[_transitive_types.Foo]=None
    ) -> None: ...

    def __call__(
        self, *,
        MyIntField: _typing.Union[int, NOTSETTYPE, None]=NOTSET,
        MyTransitiveField: _typing.Union[_transitive_types.Foo, NOTSETTYPE, None]=NOTSET
    ) -> Included: ...

    def __reduce__(self) -> _typing.Tuple[_typing.Callable, _typing.Tuple[_typing.Type['Included'], bytes]]: ...
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Any]]: ...
    def __bool__(self) -> bool: ...
    def __hash__(self) -> int: ...
    def __repr__(self) -> str: ...
    def __lt__(self, other: 'Included') -> bool: ...
    def __gt__(self, other: 'Included') -> bool: ...
    def __le__(self, other: 'Included') -> bool: ...
    def __ge__(self, other: 'Included') -> bool: ...

    @__property__
    def MyIntField(self) -> int: ...
    @__property__
    def MyTransitiveField(self) -> _transitive_types.Foo: ...


ExampleIncluded: Included = ...
IncludedConstant: int = ...
IncludedInt64 = int
TransitiveFoo = _transitive_types.Foo
