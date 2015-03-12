//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/network/mtp/entity/MTRpcRequest.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/DataInput.h"
#include "im/actor/model/droidkit/bser/DataOutput.h"
#include "im/actor/model/network/mtp/entity/MTRpcRequest.h"
#include "java/io/IOException.h"

@implementation MTMTRpcRequest

- (instancetype)initWithBSDataInput:(BSDataInput *)stream {
  return [super initWithBSDataInput:stream];
}

- (instancetype)initWithByteArray:(IOSByteArray *)payload {
  if (self = [super init]) {
    self->payload_ = payload;
  }
  return self;
}

- (IOSByteArray *)getPayload {
  return payload_;
}

- (jbyte)getHeader {
  return MTMTRpcRequest_HEADER;
}

- (void)writeBodyWithBSDataOutput:(BSDataOutput *)bs {
  [((BSDataOutput *) nil_chk(bs)) writeProtoBytesWithByteArray:payload_ withInt:0 withInt:((IOSByteArray *) nil_chk(payload_))->size_];
}

- (void)readBodyWithBSDataInput:(BSDataInput *)bs {
  payload_ = [((BSDataInput *) nil_chk(bs)) readProtoBytes];
}

- (NSString *)description {
  return @"RequestBox";
}

- (void)copyAllFieldsTo:(MTMTRpcRequest *)other {
  [super copyAllFieldsTo:other];
  other->payload_ = payload_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTMTRpcRequest)
