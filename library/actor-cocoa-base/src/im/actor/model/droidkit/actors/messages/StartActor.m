//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/messages/StartActor.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/messages/StartActor.java"

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/messages/StartActor.h"

@interface ImActorModelDroidkitActorsMessagesStartActor ()
- (instancetype)init;
@end

BOOL ImActorModelDroidkitActorsMessagesStartActor_initialized = NO;


#line 8
@implementation ImActorModelDroidkitActorsMessagesStartActor

ImActorModelDroidkitActorsMessagesStartActor * ImActorModelDroidkitActorsMessagesStartActor_INSTANCE_;


#line 11
- (instancetype)init {
  return [super init];
}

- (NSString *)description {
  
#line 16
  return @"StartActor";
}

+ (void)initialize {
  if (self == [ImActorModelDroidkitActorsMessagesStartActor class]) {
    ImActorModelDroidkitActorsMessagesStartActor_INSTANCE_ =
#line 9
    [[ImActorModelDroidkitActorsMessagesStartActor alloc] init];
    J2OBJC_SET_INITIALIZED(ImActorModelDroidkitActorsMessagesStartActor)
  }
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitActorsMessagesStartActor)
