//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/RunnableActor.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/RunnableActor.java"

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/actors/RunnableActor.h"


#line 6
@implementation DKRunnableActor


#line 7
+ (DKActorRef *)buildActorWithNSString:(NSString *)path {
  return DKRunnableActor_buildActorWithNSString_(path);
}

- (instancetype)init {
  return [super init];
}

@end

DKActorRef *DKRunnableActor_buildActorWithNSString_(NSString *path) {
  DKRunnableActor_init();
  
#line 8
  return [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_(DKRunnableActor_class_(), [[DKRunnableActor_$1 alloc] init]) withNSString:
#line 13
  path];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKRunnableActor)

@implementation DKRunnableActor_$1


#line 10
- (DKRunnableActor *)create {
  
#line 11
  return [[DKRunnableActor alloc] init];
}

- (instancetype)init {
  return [super init];
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKRunnableActor_$1)
