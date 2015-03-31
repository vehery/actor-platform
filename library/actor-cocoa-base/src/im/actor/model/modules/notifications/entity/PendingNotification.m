//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/notifications/entity/PendingNotification.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/notifications/entity/PendingNotification.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/ContentDescription.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/notifications/entity/PendingNotification.h"
#include "java/io/IOException.h"

@interface ImActorModelModulesNotificationsEntityPendingNotification () {
 @public
  AMPeer *peer_;
  jint sender_;
  jlong date_;
  AMContentDescription *content_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsEntityPendingNotification, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesNotificationsEntityPendingNotification, content_, AMContentDescription *)


#line 14
@implementation ImActorModelModulesNotificationsEntityPendingNotification


#line 20
- (instancetype)initWithAMPeer:(AMPeer *)peer
                       withInt:(jint)sender
                      withLong:(jlong)date
      withAMContentDescription:(AMContentDescription *)content {
  if (self = [super init]) {
    
#line 21
    self->peer_ = peer;
    
#line 22
    self->sender_ = sender;
    
#line 23
    self->date_ = date;
    
#line 24
    self->content_ = content;
  }
  return self;
}


#line 27
- (instancetype)init {
  return [super init];
}


#line 30
- (AMPeer *)getPeer {
  return peer_;
}

- (jint)getSender {
  
#line 35
  return sender_;
}


#line 38
- (jlong)getDate {
  
#line 39
  return date_;
}


#line 42
- (AMContentDescription *)getContent {
  
#line 43
  return content_;
}


#line 47
- (void)parseWithBSBserValues:(BSBserValues *)values {
  peer_ = AMPeer_fromUniqueIdWithLong_([((BSBserValues *) nil_chk(values)) getLongWithInt:1]);
  sender_ = [values getIntWithInt:2];
  date_ = [values getLongWithInt:4];
  content_ = AMContentDescription_fromBytesWithByteArray_([values getBytesWithInt:5]);
}


#line 55
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 56
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:[((AMPeer *) nil_chk(peer_)) getUnuqueId]];
  [writer writeIntWithInt:2 withInt:sender_];
  [writer writeLongWithInt:4 withLong:date_];
  [writer writeObjectWithInt:5 withBSBserObject:content_];
}

- (void)copyAllFieldsTo:(ImActorModelModulesNotificationsEntityPendingNotification *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->sender_ = sender_;
  other->date_ = date_;
  other->content_ = content_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesNotificationsEntityPendingNotification)
