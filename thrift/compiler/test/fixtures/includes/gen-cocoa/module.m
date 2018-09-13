/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

/**
* @generated by https://github.com/korovkin/thrift
*/

#import <Foundation/Foundation.h>

#import <thrift/TProtocol.h>
#import <thrift/TApplicationException.h>
#import <thrift/TProtocolException.h>
#import <thrift/TProtocolUtil.h>
#import <thrift/TProcessor.h>
#import <thrift/TObjective-C.h>
#import <thrift/TBase.h>
#import <thrift/TBaseStruct.h>
#import "includes.h"

#import "module.h"


@implementation moduleConstants
+ (void) initialize {
}
@end

@implementation MyStruct

- (instancetype) init
{
  self = [super init];
  self.MyIncludedField = [[[Included alloc] init] autorelease_stub];
  [self.MyIncludedField setMyIntField:2];
  Foo * tmp0 = [[[Foo alloc] init] autorelease_stub];
  [tmp0 setA:2];

  [self.MyIncludedField setMyTransitiveField:tmp0];

  self.MyIncludedInt = 42;

  return self;
}

- (id) initWithMyIncludedField: (Included *) MyIncludedField MyOtherIncludedField: (Included *) MyOtherIncludedField MyIncludedInt: (IncludedInt64) MyIncludedInt
{
  self = [super init];
  __thrift_MyIncludedField = MyIncludedField;
  __thrift_MyIncludedField_set = YES;
  __thrift_MyOtherIncludedField = MyOtherIncludedField;
  __thrift_MyOtherIncludedField_set = YES;
  __thrift_MyIncludedInt = MyIncludedInt;
  __thrift_MyIncludedInt_set = YES;
  return self;
}

- (id) initWithCoder: (NSCoder *) decoder
{
  self = [super init];
  if ([decoder containsValueForKey: @"MyIncludedField"])
  {
    __thrift_MyIncludedField = [[decoder decodeObjectForKey: @"MyIncludedField"] retain_stub];
    __thrift_MyIncludedField_set = YES;
  }
  if ([decoder containsValueForKey: @"MyOtherIncludedField"])
  {
    __thrift_MyOtherIncludedField = [[decoder decodeObjectForKey: @"MyOtherIncludedField"] retain_stub];
    __thrift_MyOtherIncludedField_set = YES;
  }
  if ([decoder containsValueForKey: @"MyIncludedInt"])
  {
    __thrift_MyIncludedInt = [decoder decodeInt64ForKey: @"MyIncludedInt"];
    __thrift_MyIncludedInt_set = YES;
  }
  return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder
{
  if (__thrift_MyIncludedField_set)
  {
    [encoder encodeObject: __thrift_MyIncludedField forKey: @"MyIncludedField"];
  }
  if (__thrift_MyOtherIncludedField_set)
  {
    [encoder encodeObject: __thrift_MyOtherIncludedField forKey: @"MyOtherIncludedField"];
  }
  if (__thrift_MyIncludedInt_set)
  {
    [encoder encodeInt64: __thrift_MyIncludedInt forKey: @"MyIncludedInt"];
  }
}

- (Included *) MyIncludedField {
  return __thrift_MyIncludedField;
}

- (void) setMyIncludedField: (Included *) MyIncludedField {
  [self throwExceptionIfImmutable];
  __thrift_MyIncludedField = MyIncludedField;
  __thrift_MyIncludedField_set = YES;
}

- (BOOL) MyIncludedFieldIsSet {
  return __thrift_MyIncludedField_set;
}

- (void) unsetMyIncludedField {
  __thrift_MyIncludedField = nil;
  __thrift_MyIncludedField_set = NO;
}

- (Included *) MyOtherIncludedField {
  return __thrift_MyOtherIncludedField;
}

- (void) setMyOtherIncludedField: (Included *) MyOtherIncludedField {
  [self throwExceptionIfImmutable];
  __thrift_MyOtherIncludedField = MyOtherIncludedField;
  __thrift_MyOtherIncludedField_set = YES;
}

- (BOOL) MyOtherIncludedFieldIsSet {
  return __thrift_MyOtherIncludedField_set;
}

- (void) unsetMyOtherIncludedField {
  __thrift_MyOtherIncludedField = nil;
  __thrift_MyOtherIncludedField_set = NO;
}

- (int64_t) MyIncludedInt {
  return __thrift_MyIncludedInt;
}

- (void) setMyIncludedInt: (int64_t) MyIncludedInt {
  [self throwExceptionIfImmutable];
  __thrift_MyIncludedInt = MyIncludedInt;
  __thrift_MyIncludedInt_set = YES;
}

- (BOOL) MyIncludedIntIsSet {
  return __thrift_MyIncludedInt_set;
}

- (void) unsetMyIncludedInt {
  __thrift_MyIncludedInt_set = NO;
}

- (void) read: (id <TProtocol>) inProtocol
{
  NSString * fieldName;
  int fieldType;
  int fieldID;

  [inProtocol readStructBeginReturningName: NULL];
  while (true)
  {
    [inProtocol readFieldBeginReturningName: &fieldName type: &fieldType fieldID: &fieldID];
    if (fieldType == TType_STOP) { 
      break;
    }
    switch (fieldID)
    {
      case 1:
        if (fieldType == TType_STRUCT) {
          Included *fieldValue = [[Included alloc] init];
          [fieldValue read: inProtocol];
          [self setMyIncludedField: fieldValue];
          [fieldValue release_stub];
        } else {
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 2:
        if (fieldType == TType_STRUCT) {
          Included *fieldValue = [[Included alloc] init];
          [fieldValue read: inProtocol];
          [self setMyOtherIncludedField: fieldValue];
          [fieldValue release_stub];
        } else {
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 3:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setMyIncludedInt: fieldValue];
        } else {
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      default:
        [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        break;
    }
    [inProtocol readFieldEnd];
  }
  [inProtocol readStructEnd];
}

- (void) write: (id <TProtocol>) outProtocol {
  [outProtocol writeStructBeginWithName: @"MyStruct"];
  if (__thrift_MyIncludedField_set) {
    if (__thrift_MyIncludedField != nil) {
      [outProtocol writeFieldBeginWithName: @"MyIncludedField" type: TType_STRUCT fieldID: 1];
      [__thrift_MyIncludedField write: outProtocol];
      [outProtocol writeFieldEnd];
    }
  }
  if (__thrift_MyOtherIncludedField_set) {
    if (__thrift_MyOtherIncludedField != nil) {
      [outProtocol writeFieldBeginWithName: @"MyOtherIncludedField" type: TType_STRUCT fieldID: 2];
      [__thrift_MyOtherIncludedField write: outProtocol];
      [outProtocol writeFieldEnd];
    }
  }
  if (__thrift_MyIncludedInt_set) {
    [outProtocol writeFieldBeginWithName: @"MyIncludedInt" type: TType_I64 fieldID: 3];
    [outProtocol writeI64: __thrift_MyIncludedInt];
    [outProtocol writeFieldEnd];
  }
  [outProtocol writeFieldStop];
  [outProtocol writeStructEnd];
}

- (void) validate {
  // check for required fields
}

- (NSString *) description {
  return [[self toDict] description];
}

- (NSDictionary *) toDict {
  NSMutableDictionary *ret = [NSMutableDictionary dictionary];
  ret[@"__thrift_struct_name"] = @"MyStruct";
  if (__thrift_MyIncludedField) {
    ret[@"MyIncludedField"] = [__thrift_MyIncludedField toDict];
  }
  if (__thrift_MyOtherIncludedField) {
    ret[@"MyOtherIncludedField"] = [__thrift_MyOtherIncludedField toDict];
  }
  ret[@"MyIncludedInt"] = @(__thrift_MyIncludedInt);
  return [ret copy];
}

- (BOOL) makeImmutable {
  const BOOL wasImmutable = [self isImmutable];
  if (!wasImmutable) {
    if (__thrift_MyIncludedField && ![__thrift_MyIncludedField isImmutable]) {
      [__thrift_MyIncludedField makeImmutable];
    }
    if (__thrift_MyOtherIncludedField && ![__thrift_MyOtherIncludedField isImmutable]) {
      [__thrift_MyOtherIncludedField makeImmutable];
    }
    [super makeImmutable];
  }
  return YES;
}

- (id) mutableCopyWithZone:(NSZone *)zone {
  MyStruct *newCopy = [[[self class] alloc] init];;
  if (__thrift_MyIncludedField) {
    newCopy->__thrift_MyIncludedField = [self->__thrift_MyIncludedField mutableCopyWithZone:zone];
  }
  newCopy->__thrift_MyIncludedField_set = self->__thrift_MyIncludedField_set;
  if (__thrift_MyOtherIncludedField) {
    newCopy->__thrift_MyOtherIncludedField = [self->__thrift_MyOtherIncludedField mutableCopyWithZone:zone];
  }
  newCopy->__thrift_MyOtherIncludedField_set = self->__thrift_MyOtherIncludedField_set;
  newCopy->__thrift_MyIncludedInt = self->__thrift_MyIncludedInt;
  newCopy->__thrift_MyIncludedInt_set = self->__thrift_MyIncludedInt_set;
  return newCopy;
}

@end
