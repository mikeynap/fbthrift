from enum import Enum, Flag

class TransportErrorType(Enum):
    UNKNOWN: TransportErrorType = ...
    NOT_OPEN: TransportErrorType = ...
    ALREADY_OPEN: TransportErrorType = ...
    TIMED_OUT: TransportErrorType = ...
    END_OF_FILE: TransportErrorType = ...
    INTERRUPTED: TransportErrorType = ...
    BAD_ARGS: TransportErrorType = ...
    CORRUPTED_DATA: TransportErrorType = ...
    INTERNAL_ERROR: TransportErrorType = ...
    NOT_SUPPORTED: TransportErrorType = ...
    INVALID_STATE: TransportErrorType = ...
    INVALID_FRAME_SIZE: TransportErrorType = ...
    SSL_ERROR: TransportErrorType = ...
    COULD_NOT_BIND: TransportErrorType = ...
    SASL_HANDSHAKE_TIMEOUT: TransportErrorType = ...
    NETWORK_ERROR: TransportErrorType = ...
    value: int

class TransportOptions(Flag):
    CHANNEL_IS_VALID: TransportOptions = ...
    value: int

class ApplicationErrorType(Enum):
    UNKNOWN: ApplicationErrorType = ...
    UNKNOWN_METHOD: ApplicationErrorType = ...
    INVALID_MESSAGE_TYPE: ApplicationErrorType = ...
    WRONG_METHOD_NAME: ApplicationErrorType = ...
    BAD_SEQUENCE_ID: ApplicationErrorType = ...
    MISSING_RESULT: ApplicationErrorType = ...
    INTERNAL_ERROR: ApplicationErrorType = ...
    PROTOCOL_ERROR: ApplicationErrorType = ...
    INVALID_TRANSFORM: ApplicationErrorType = ...
    INVALID_PROTOCOL: ApplicationErrorType = ...
    UNSUPPORTED_CLIENT_TYPE: ApplicationErrorType = ...
    LOADSHEDDING: ApplicationErrorType = ...
    TIMEOUT: ApplicationErrorType = ...
    INJECTED_FAILURE: ApplicationErrorType = ...
    value: int

class ProtocolErrorType(Enum):
    UNKNOWN: ProtocolErrorType = ...
    INVALID_DATA: ProtocolErrorType = ...
    NEGATIVE_SIZE: ProtocolErrorType = ...
    BAD_VERSION: ProtocolErrorType = ...
    NOT_IMPLEMENTED: ProtocolErrorType = ...
    MISSING_REQUIRED_FIELD: ProtocolErrorType = ...
    value: int


class Error(Exception): ...


class ApplicationError(Error):
    def __int__(self, type: ApplicationErrorType, message: str) -> None: ...
    type: ApplicationErrorType
    message: str


class LibraryError(Error): ...


class ProtocolError(LibraryError):
    type: ProtocolErrorType
    message: str


class TransportError(LibraryError):
    type: TransportErrorType
    options: TransportOptions
    message: str
    errno: int