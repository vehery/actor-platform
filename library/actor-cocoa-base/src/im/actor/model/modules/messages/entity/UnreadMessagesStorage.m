//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/messages/entity/UnreadMessagesStorage.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/messages/entity/UnreadMessagesStorage.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/messages/entity/UnreadMessage.h"
#include "im/actor/model/modules/messages/entity/UnreadMessagesStorage.h"
#include "java/io/IOException.h"
#include "java/util/HashMap.h"
#include "java/util/HashSet.h"
#include "java/util/List.h"
#include "java/util/Set.h"

@interface ImActorModelModulesMessagesEntityUnreadMessagesStorage () {
 @public
  JavaUtilHashMap *unreadMessages_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesEntityUnreadMessagesStorage, unreadMessages_, JavaUtilHashMap *)


#line 17
@implementation ImActorModelModulesMessagesEntityUnreadMessagesStorage

+ (ImActorModelModulesMessagesEntityUnreadMessagesStorage *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelModulesMessagesEntityUnreadMessagesStorage_fromBytesWithByteArray_(data);
}


#line 25
- (JavaUtilHashSet *)getUnreadWithAMPeer:(AMPeer *)peer {
  
#line 26
  if (![((JavaUtilHashMap *) nil_chk(unreadMessages_)) containsKeyWithId:peer]) {
    (void) [unreadMessages_ putWithId:peer withId:[[JavaUtilHashSet alloc] init]];
  }
  return [unreadMessages_ getWithId:peer];
}


#line 33
- (void)parseWithBSBserValues:(BSBserValues *)values {
  id<JavaUtilList> data = [((BSBserValues *) nil_chk(values)) getRepeatedBytesWithInt:1];
  for (IOSByteArray * __strong d in nil_chk(data)) {
    @try {
      ImActorModelModulesMessagesEntityUnreadMessage *u = ImActorModelModulesMessagesEntityUnreadMessage_fromBytesWithByteArray_(d);
      [((JavaUtilHashSet *) nil_chk([self getUnreadWithAMPeer:[((ImActorModelModulesMessagesEntityUnreadMessage *) nil_chk(u)) getPeer]])) addWithId:u];
    }
    @catch (
#line 39
    JavaIoIOException *e) {
      [((JavaIoIOException *) nil_chk(e)) printStackTrace];
    }
  }
}


#line 46
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 47
  for (AMPeer * __strong peer in nil_chk([((JavaUtilHashMap *) nil_chk(unreadMessages_)) keySet])) {
    for (ImActorModelModulesMessagesEntityUnreadMessage * __strong u in nil_chk([unreadMessages_ getWithId:peer])) {
      [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:u];
    }
  }
}

- (instancetype)init {
  if (self = [super init]) {
    unreadMessages_ =
#line 23
    [[JavaUtilHashMap alloc] init];
  }
  return self;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesEntityUnreadMessagesStorage *)other {
  [super copyAllFieldsTo:other];
  other->unreadMessages_ = unreadMessages_;
}

@end

ImActorModelModulesMessagesEntityUnreadMessagesStorage *ImActorModelModulesMessagesEntityUnreadMessagesStorage_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelModulesMessagesEntityUnreadMessagesStorage_init();
  
#line 20
  return ((ImActorModelModulesMessagesEntityUnreadMessagesStorage *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelModulesMessagesEntityUnreadMessagesStorage alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesEntityUnreadMessagesStorage)
