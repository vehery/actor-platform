//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/EncryptedPackage.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/EncryptedPackage.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/EncryptedPackage.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/droidkit/bser/Utils.h"
#include "java/io/IOException.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"

@interface ImActorModelApiEncryptedPackage () {
 @public
  JavaLangInteger *v1MessageType_;
  IOSByteArray *v1Message_;
  JavaLangLong *v1Crc32_;
  IOSByteArray *v2Message_;
  JavaLangLong *v2HmacSha256_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiEncryptedPackage, v1MessageType_, JavaLangInteger *)
J2OBJC_FIELD_SETTER(ImActorModelApiEncryptedPackage, v1Message_, IOSByteArray *)
J2OBJC_FIELD_SETTER(ImActorModelApiEncryptedPackage, v1Crc32_, JavaLangLong *)
J2OBJC_FIELD_SETTER(ImActorModelApiEncryptedPackage, v2Message_, IOSByteArray *)
J2OBJC_FIELD_SETTER(ImActorModelApiEncryptedPackage, v2HmacSha256_, JavaLangLong *)


#line 19
@implementation ImActorModelApiEncryptedPackage


#line 27
- (instancetype)initWithJavaLangInteger:(JavaLangInteger *)v1MessageType
                          withByteArray:(IOSByteArray *)v1Message
                       withJavaLangLong:(JavaLangLong *)v1Crc32
                          withByteArray:(IOSByteArray *)v2Message
                       withJavaLangLong:(JavaLangLong *)v2HmacSha256 {
  if (self = [super init]) {
    
#line 28
    self->v1MessageType_ = v1MessageType;
    
#line 29
    self->v1Message_ = v1Message;
    
#line 30
    self->v1Crc32_ = v1Crc32;
    
#line 31
    self->v2Message_ = v2Message;
    
#line 32
    self->v2HmacSha256_ = v2HmacSha256;
  }
  return self;
}


#line 35
- (instancetype)init {
  return [super init];
}

- (JavaLangInteger *)getV1MessageType {
  
#line 40
  return self->v1MessageType_;
}


#line 43
- (IOSByteArray *)getV1Message {
  
#line 44
  return self->v1Message_;
}


#line 47
- (JavaLangLong *)getV1Crc32 {
  
#line 48
  return self->v1Crc32_;
}


#line 51
- (IOSByteArray *)getV2Message {
  
#line 52
  return self->v2Message_;
}


#line 55
- (JavaLangLong *)getV2HmacSha256 {
  
#line 56
  return self->v2HmacSha256_;
}


#line 60
- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->v1MessageType_ = JavaLangInteger_valueOfWithInt_([((BSBserValues *) nil_chk(values)) optIntWithInt:1]);
  self->v1Message_ = [values optBytesWithInt:2];
  self->v1Crc32_ = JavaLangLong_valueOfWithLong_([values optLongWithInt:3]);
  self->v2Message_ = [values optBytesWithInt:5];
  self->v2HmacSha256_ = JavaLangLong_valueOfWithLong_([values optLongWithInt:6]);
}


#line 69
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 70
  if (self->v1MessageType_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:[self->v1MessageType_ intValue]];
  }
  if (self->v1Message_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeBytesWithInt:2 withByteArray:self->v1Message_];
  }
  if (self->v1Crc32_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:3 withLong:[self->v1Crc32_ longLongValue]];
  }
  if (self->v2Message_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeBytesWithInt:5 withByteArray:self->v2Message_];
  }
  if (self->v2HmacSha256_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:6 withLong:[self->v2HmacSha256_ longLongValue]];
  }
}

- (NSString *)description {
  NSString *res = @"struct EncryptedPackage{";
  res = JreStrcat("$$", res, JreStrcat("$@", @"v1MessageType=", self->v1MessageType_));
  res = JreStrcat("$$", res, JreStrcat("$$", @", v1Message=", BSUtils_byteArrayToStringCompactWithByteArray_(self->v1Message_)));
  res = JreStrcat("$$", res, JreStrcat("$@", @", v1Crc32=", self->v1Crc32_));
  res = JreStrcat("$$", res, JreStrcat("$$", @", v2Message=", BSUtils_byteArrayToStringCompactWithByteArray_(self->v2Message_)));
  res = JreStrcat("$$", res, JreStrcat("$@", @", v2HmacSha256=", self->v2HmacSha256_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (void)copyAllFieldsTo:(ImActorModelApiEncryptedPackage *)other {
  [super copyAllFieldsTo:other];
  other->v1MessageType_ = v1MessageType_;
  other->v1Message_ = v1Message_;
  other->v1Crc32_ = v1Crc32_;
  other->v2Message_ = v2Message_;
  other->v2HmacSha256_ = v2HmacSha256_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiEncryptedPackage)
