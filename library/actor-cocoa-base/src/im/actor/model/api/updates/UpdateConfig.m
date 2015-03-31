//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/updates/UpdateConfig.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/updates/UpdateConfig.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Config.h"
#include "im/actor/model/api/updates/UpdateConfig.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiUpdatesUpdateConfig () {
 @public
  ImActorModelApiConfig *config_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiUpdatesUpdateConfig, config_, ImActorModelApiConfig *)


#line 20
@implementation ImActorModelApiUpdatesUpdateConfig


#line 23
+ (ImActorModelApiUpdatesUpdateConfig *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiUpdatesUpdateConfig_fromBytesWithByteArray_(data);
}


#line 29
- (instancetype)initWithImActorModelApiConfig:(ImActorModelApiConfig *)config {
  if (self = [super init]) {
    
#line 30
    self->config_ = config;
  }
  return self;
}


#line 33
- (instancetype)init {
  return [super init];
}

- (ImActorModelApiConfig *)getConfig {
  
#line 38
  return self->config_;
}


#line 42
- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->config_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:[[ImActorModelApiConfig alloc] init]];
}


#line 47
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 48
  if (self->config_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->config_];
}

- (NSString *)description {
  NSString *res = @"update Config{";
  res = JreStrcat("$$", res, JreStrcat("$@", @"config=", self->config_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  
#line 64
  return ImActorModelApiUpdatesUpdateConfig_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiUpdatesUpdateConfig *)other {
  [super copyAllFieldsTo:other];
  other->config_ = config_;
}

@end

ImActorModelApiUpdatesUpdateConfig *ImActorModelApiUpdatesUpdateConfig_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiUpdatesUpdateConfig_init();
  
#line 24
  return ((ImActorModelApiUpdatesUpdateConfig *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiUpdatesUpdateConfig alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiUpdatesUpdateConfig)
