//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestSubscribeFromGroupOnline.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestSubscribeFromGroupOnline.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/GroupOutPeer.h"
#include "im/actor/model/api/rpc/RequestSubscribeFromGroupOnline.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

@interface ImActorModelApiRpcRequestSubscribeFromGroupOnline () {
 @public
  id<JavaUtilList> groups_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSubscribeFromGroupOnline, groups_, id<JavaUtilList>)


#line 20
@implementation ImActorModelApiRpcRequestSubscribeFromGroupOnline


#line 23
+ (ImActorModelApiRpcRequestSubscribeFromGroupOnline *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestSubscribeFromGroupOnline_fromBytesWithByteArray_(data);
}


#line 29
- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)groups {
  if (self = [super init]) {
    
#line 30
    self->groups_ = groups;
  }
  return self;
}


#line 33
- (instancetype)init {
  return [super init];
}

- (id<JavaUtilList>)getGroups {
  
#line 38
  return self->groups_;
}


#line 42
- (void)parseWithBSBserValues:(BSBserValues *)values {
  id<JavaUtilList> _groups = [[JavaUtilArrayList alloc] init];
  for (jint i = 0; i < [((BSBserValues *) nil_chk(values)) getRepeatedCountWithInt:1]; i++) {
    [_groups addWithId:[[ImActorModelApiGroupOutPeer alloc] init]];
  }
  self->groups_ = [values getRepeatedObjWithInt:1 withJavaUtilList:_groups];
}


#line 51
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 52
  [((BSBserWriter *) nil_chk(writer)) writeRepeatedObjWithInt:1 withJavaUtilList:self->groups_];
}

- (NSString *)description {
  NSString *res = @"rpc SubscribeFromGroupOnline{";
  res = JreStrcat("$$", res, JreStrcat("$I", @"groups=", [((id<JavaUtilList>) nil_chk(self->groups_)) size]));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  
#line 65
  return ImActorModelApiRpcRequestSubscribeFromGroupOnline_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcRequestSubscribeFromGroupOnline *)other {
  [super copyAllFieldsTo:other];
  other->groups_ = groups_;
}

@end

ImActorModelApiRpcRequestSubscribeFromGroupOnline *ImActorModelApiRpcRequestSubscribeFromGroupOnline_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestSubscribeFromGroupOnline_init();
  
#line 24
  return ((ImActorModelApiRpcRequestSubscribeFromGroupOnline *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcRequestSubscribeFromGroupOnline alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestSubscribeFromGroupOnline)
