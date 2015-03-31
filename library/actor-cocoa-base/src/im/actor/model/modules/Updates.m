//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/Updates.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/Updates.java"

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/updates/SequenceActor.h"

@interface ImActorModelModulesUpdates () {
 @public
  DKActorRef *updateActor_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdates, updateActor_, DKActorRef *)

@interface ImActorModelModulesUpdates_$1 () {
 @public
  ImActorModelModulesUpdates *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdates_$1, this$0_, ImActorModelModulesUpdates *)


#line 14
@implementation ImActorModelModulesUpdates


#line 18
- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  return
#line 19
  [super initWithImActorModelModulesModules:messenger];
}


#line 22
- (void)run {
  
#line 23
  self->updateActor_ = [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_(ImActorModelModulesUpdatesSequenceActor_class_(), [[ImActorModelModulesUpdates_$1 alloc] initWithImActorModelModulesUpdates:self]) withNSString:
#line 28
  @"actor/updates"];
}


#line 31
- (void)onNewSessionCreated {
  
#line 32
  [((DKActorRef *) nil_chk(updateActor_)) sendWithId:[[ImActorModelModulesUpdatesSequenceActor_Invalidate alloc] init]];
}


#line 35
- (void)onPushReceivedWithInt:(jint)seq {
  
#line 36
  [((DKActorRef *) nil_chk(updateActor_)) sendWithId:[[ImActorModelModulesUpdatesSequenceActor_PushSeq alloc] initWithInt:seq]];
}


#line 39
- (void)onUpdateReceivedWithId:(id)update {
  
#line 40
  [((DKActorRef *) nil_chk(updateActor_)) sendWithId:update];
}

- (void)copyAllFieldsTo:(ImActorModelModulesUpdates *)other {
  [super copyAllFieldsTo:other];
  other->updateActor_ = updateActor_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdates)

@implementation ImActorModelModulesUpdates_$1


#line 25
- (ImActorModelModulesUpdatesSequenceActor *)create {
  
#line 26
  return [[ImActorModelModulesUpdatesSequenceActor alloc] initWithImActorModelModulesModules:[this$0_ modules]];
}

- (instancetype)initWithImActorModelModulesUpdates:(ImActorModelModulesUpdates *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesUpdates_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdates_$1)
