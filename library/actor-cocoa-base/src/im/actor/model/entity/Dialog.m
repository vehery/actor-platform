//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/Dialog.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/Dialog.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserCreator.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/ContentType.h"
#include "im/actor/model/entity/Dialog.h"
#include "im/actor/model/entity/MessageState.h"
#include "im/actor/model/entity/Peer.h"
#include "java/io/IOException.h"

@interface AMDialog () {
 @public
  AMPeer *peer_;
  NSString *dialogTitle_;
  jint unreadCount_;
  jlong rid_;
  jlong sortDate_;
  jint senderId_;
  jlong date_;
  AMContentTypeEnum *messageType_;
  NSString *text_;
  AMMessageStateEnum *status_;
  AMAvatar *dialogAvatar_;
  jint relatedUid_;
}
- (instancetype)init;
@end

J2OBJC_FIELD_SETTER(AMDialog, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(AMDialog, dialogTitle_, NSString *)
J2OBJC_FIELD_SETTER(AMDialog, messageType_, AMContentTypeEnum *)
J2OBJC_FIELD_SETTER(AMDialog, text_, NSString *)
J2OBJC_FIELD_SETTER(AMDialog, status_, AMMessageStateEnum *)
J2OBJC_FIELD_SETTER(AMDialog, dialogAvatar_, AMAvatar *)

BOOL AMDialog_initialized = NO;


#line 15
@implementation AMDialog

id<BSBserCreator> AMDialog_CREATOR_;


#line 17
+ (AMDialog *)fromBytesWithByteArray:(IOSByteArray *)date {
  return AMDialog_fromBytesWithByteArray_(date);
}


#line 41
- (instancetype)initWithAMPeer:(AMPeer *)peer
                      withLong:(jlong)sortKey
                  withNSString:(NSString *)dialogTitle
                  withAMAvatar:(AMAvatar *)dialogAvatar
                       withInt:(jint)unreadCount
                      withLong:(jlong)rid
         withAMContentTypeEnum:(AMContentTypeEnum *)messageType
                  withNSString:(NSString *)text
        withAMMessageStateEnum:(AMMessageStateEnum *)status
                       withInt:(jint)senderId
                      withLong:(jlong)date
                       withInt:(jint)relatedUid {
  if (self = [super init]) {
    
#line 47
    self->peer_ = peer;
    
#line 48
    self->dialogTitle_ = dialogTitle;
    
#line 49
    self->dialogAvatar_ = dialogAvatar;
    
#line 50
    self->unreadCount_ = unreadCount;
    
#line 51
    self->rid_ = rid;
    
#line 52
    self->sortDate_ = sortKey;
    
#line 53
    self->senderId_ = senderId;
    
#line 54
    self->date_ = date;
    
#line 55
    self->messageType_ = messageType;
    
#line 56
    self->text_ = text;
    
#line 57
    self->status_ = status;
    
#line 58
    self->relatedUid_ = relatedUid;
  }
  return self;
}


#line 61
- (instancetype)init {
  return [super init];
}

- (AMPeer *)getPeer {
  
#line 66
  return peer_;
}


#line 69
- (NSString *)getDialogTitle {
  
#line 70
  return dialogTitle_;
}


#line 73
- (jint)getUnreadCount {
  
#line 74
  return unreadCount_;
}


#line 77
- (jlong)getRid {
  
#line 78
  return rid_;
}


#line 81
- (jlong)getSortDate {
  
#line 82
  return sortDate_;
}


#line 85
- (jint)getSenderId {
  
#line 86
  return senderId_;
}


#line 89
- (jlong)getDate {
  
#line 90
  return date_;
}


#line 93
- (AMContentTypeEnum *)getMessageType {
  
#line 94
  return messageType_;
}


#line 97
- (NSString *)getText {
  
#line 98
  return text_;
}


#line 101
- (AMMessageStateEnum *)getStatus {
  
#line 102
  return status_;
}


#line 105
- (jint)getRelatedUid {
  
#line 106
  return relatedUid_;
}


#line 109
- (AMAvatar *)getDialogAvatar {
  
#line 110
  return dialogAvatar_;
}


#line 113
- (AMDialog *)editPeerInfoWithNSString:(NSString *)title
                          withAMAvatar:(AMAvatar *)dialogAvatar {
  
#line 114
  return [[AMDialog alloc] initWithAMPeer:peer_ withLong:sortDate_ withNSString:title withAMAvatar:dialogAvatar withInt:unreadCount_ withLong:rid_ withAMContentTypeEnum:messageType_ withNSString:text_ withAMMessageStateEnum:status_ withInt:senderId_ withLong:
#line 115
  date_ withInt:relatedUid_];
}


#line 119
- (void)parseWithBSBserValues:(BSBserValues *)values {
  
#line 120
  peer_ = AMPeer_fromBytesWithByteArray_([((BSBserValues *) nil_chk(values)) getBytesWithInt:1]);
  
#line 122
  dialogTitle_ = [values getStringWithInt:2];
  IOSByteArray *av = [values optBytesWithInt:3];
  if (av != nil) {
    dialogAvatar_ = AMAvatar_fromBytesWithByteArray_(av);
  }
  
#line 128
  unreadCount_ = [values getIntWithInt:4];
  sortDate_ = [values getLongWithInt:5];
  
#line 131
  rid_ = [values getLongWithInt:6];
  senderId_ = [values getIntWithInt:7];
  date_ = [values getLongWithInt:8];
  messageType_ = AMContentTypeEnum_fromValueWithInt_([values getIntWithInt:9]);
  text_ = [values getStringWithInt:10];
  status_ = AMMessageStateEnum_fromValueWithInt_([values getIntWithInt:11]);
  relatedUid_ = [values getIntWithInt:12];
}


#line 141
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 142
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:peer_];
  [writer writeStringWithInt:2 withNSString:dialogTitle_];
  if (dialogAvatar_ != nil) {
    [writer writeObjectWithInt:3 withBSBserObject:dialogAvatar_];
  }
  [writer writeIntWithInt:4 withInt:unreadCount_];
  [writer writeLongWithInt:5 withLong:sortDate_];
  [writer writeLongWithInt:6 withLong:rid_];
  [writer writeIntWithInt:7 withInt:senderId_];
  [writer writeLongWithInt:8 withLong:date_];
  [writer writeIntWithInt:9 withInt:[((AMContentTypeEnum *) nil_chk(messageType_)) getValue]];
  [writer writeStringWithInt:10 withNSString:text_];
  [writer writeIntWithInt:11 withInt:[((AMMessageStateEnum *) nil_chk(status_)) getValue]];
  [writer writeIntWithInt:12 withInt:relatedUid_];
}


#line 159
- (jlong)getEngineId {
  return [((AMPeer *) nil_chk(peer_)) getUnuqueId];
}


#line 164
- (jlong)getEngineSort {
  
#line 165
  return sortDate_;
}


#line 169
- (NSString *)getEngineSearch {
  return dialogTitle_;
}

- (void)copyAllFieldsTo:(AMDialog *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->dialogTitle_ = dialogTitle_;
  other->unreadCount_ = unreadCount_;
  other->rid_ = rid_;
  other->sortDate_ = sortDate_;
  other->senderId_ = senderId_;
  other->date_ = date_;
  other->messageType_ = messageType_;
  other->text_ = text_;
  other->status_ = status_;
  other->dialogAvatar_ = dialogAvatar_;
  other->relatedUid_ = relatedUid_;
}

+ (void)initialize {
  if (self == [AMDialog class]) {
    AMDialog_CREATOR_ =
#line 21
    [[AMDialog_$1 alloc] init];
    J2OBJC_SET_INITIALIZED(AMDialog)
  }
}

@end

AMDialog *AMDialog_fromBytesWithByteArray_(IOSByteArray *date) {
  AMDialog_init();
  
#line 18
  return ((AMDialog *) BSBser_parseWithBSBserObject_withByteArray_([[AMDialog alloc] init], date));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDialog)

@implementation AMDialog_$1


#line 23
- (AMDialog *)createInstance {
  
#line 24
  return [[AMDialog alloc] init];
}

- (instancetype)init {
  return [super init];
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMDialog_$1)
