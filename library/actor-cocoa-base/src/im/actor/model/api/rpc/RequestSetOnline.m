//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestSetOnline.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestSetOnline.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/RequestSetOnline.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcRequestSetOnline () {
 @public
  jboolean isOnline__;
  jlong timeout_;
}
@end


#line 20
@implementation ImActorModelApiRpcRequestSetOnline


#line 23
+ (ImActorModelApiRpcRequestSetOnline *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestSetOnline_fromBytesWithByteArray_(data);
}


#line 30
- (instancetype)initWithBoolean:(jboolean)isOnline
                       withLong:(jlong)timeout {
  if (self = [super init]) {
    
#line 31
    self->isOnline__ = isOnline;
    
#line 32
    self->timeout_ = timeout;
  }
  return self;
}


#line 35
- (instancetype)init {
  return [super init];
}

- (jboolean)isOnline {
  
#line 40
  return self->isOnline__;
}


#line 43
- (jlong)getTimeout {
  
#line 44
  return self->timeout_;
}


#line 48
- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->isOnline__ = [((BSBserValues *) nil_chk(values)) getBoolWithInt:1];
  self->timeout_ = [values getLongWithInt:2];
}


#line 54
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 55
  [((BSBserWriter *) nil_chk(writer)) writeBoolWithInt:1 withBoolean:self->isOnline__];
  [writer writeLongWithInt:2 withLong:self->timeout_];
}

- (NSString *)description {
  NSString *res = @"rpc SetOnline{";
  res = JreStrcat("$$", res, JreStrcat("$Z", @"isOnline=", self->isOnline__));
  res = JreStrcat("$$", res, JreStrcat("$J", @", timeout=", self->timeout_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  
#line 70
  return ImActorModelApiRpcRequestSetOnline_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcRequestSetOnline *)other {
  [super copyAllFieldsTo:other];
  other->isOnline__ = isOnline__;
  other->timeout_ = timeout_;
}

@end

ImActorModelApiRpcRequestSetOnline *ImActorModelApiRpcRequestSetOnline_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestSetOnline_init();
  
#line 24
  return ((ImActorModelApiRpcRequestSetOnline *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcRequestSetOnline alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestSetOnline)
