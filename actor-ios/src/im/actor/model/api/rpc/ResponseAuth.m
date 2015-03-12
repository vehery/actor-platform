//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/ResponseAuth.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Config.h"
#include "im/actor/model/api/User.h"
#include "im/actor/model/api/rpc/ResponseAuth.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcResponseAuth () {
 @public
  jlong publicKeyHash_;
  ImActorModelApiUser *user_;
  ImActorModelApiConfig *config_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcResponseAuth, user_, ImActorModelApiUser *)
J2OBJC_FIELD_SETTER(ImActorModelApiRpcResponseAuth, config_, ImActorModelApiConfig *)

@implementation ImActorModelApiRpcResponseAuth

+ (ImActorModelApiRpcResponseAuth *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcResponseAuth_fromBytesWithByteArray_(data);
}

- (instancetype)initWithLong:(jlong)publicKeyHash
     withImActorModelApiUser:(ImActorModelApiUser *)user
   withImActorModelApiConfig:(ImActorModelApiConfig *)config {
  if (self = [super init]) {
    self->publicKeyHash_ = publicKeyHash;
    self->user_ = user;
    self->config_ = config;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (jlong)getPublicKeyHash {
  return self->publicKeyHash_;
}

- (ImActorModelApiUser *)getUser {
  return self->user_;
}

- (ImActorModelApiConfig *)getConfig {
  return self->config_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->publicKeyHash_ = [((BSBserValues *) nil_chk(values)) getLongWithInt:1];
  self->user_ = [values getObjWithInt:2 withBSBserObject:[[ImActorModelApiUser alloc] init]];
  self->config_ = [values getObjWithInt:3 withBSBserObject:[[ImActorModelApiConfig alloc] init]];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:self->publicKeyHash_];
  if (self->user_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [writer writeObjectWithInt:2 withBSBserObject:self->user_];
  if (self->config_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [writer writeObjectWithInt:3 withBSBserObject:self->config_];
}

- (NSString *)description {
  NSString *res = @"response Auth{";
  res = JreStrcat("$$", res, JreStrcat("$$", @"user=", (self->user_ != nil ? @"set" : @"empty")));
  res = JreStrcat("$$", res, JreStrcat("$@", @", config=", self->config_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  return ImActorModelApiRpcResponseAuth_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcResponseAuth *)other {
  [super copyAllFieldsTo:other];
  other->publicKeyHash_ = publicKeyHash_;
  other->user_ = user_;
  other->config_ = config_;
}

@end

ImActorModelApiRpcResponseAuth *ImActorModelApiRpcResponseAuth_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcResponseAuth_init();
  return ((ImActorModelApiRpcResponseAuth *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcResponseAuth alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcResponseAuth)
