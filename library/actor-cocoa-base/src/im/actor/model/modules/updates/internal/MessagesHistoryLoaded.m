//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/updates/internal/MessagesHistoryLoaded.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/updates/internal/MessagesHistoryLoaded.java"

#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/ResponseLoadHistory.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/updates/internal/MessagesHistoryLoaded.h"

@interface ImActorModelModulesUpdatesInternalMessagesHistoryLoaded () {
 @public
  AMPeer *peer_;
  ImActorModelApiRpcResponseLoadHistory *loadHistory_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesInternalMessagesHistoryLoaded, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesInternalMessagesHistoryLoaded, loadHistory_, ImActorModelApiRpcResponseLoadHistory *)


#line 9
@implementation ImActorModelModulesUpdatesInternalMessagesHistoryLoaded


#line 13
- (instancetype)initWithAMPeer:(AMPeer *)peer
withImActorModelApiRpcResponseLoadHistory:(ImActorModelApiRpcResponseLoadHistory *)loadHistory {
  if (self = [super init]) {
    
#line 14
    self->peer_ = peer;
    
#line 15
    self->loadHistory_ = loadHistory;
  }
  return self;
}


#line 18
- (AMPeer *)getPeer {
  
#line 19
  return peer_;
}


#line 22
- (ImActorModelApiRpcResponseLoadHistory *)getLoadHistory {
  
#line 23
  return loadHistory_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesUpdatesInternalMessagesHistoryLoaded *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->loadHistory_ = loadHistory_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesInternalMessagesHistoryLoaded)
