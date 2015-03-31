//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/updates/internal/LoggedIn.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/updates/internal/LoggedIn.java"

#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/ResponseAuth.h"
#include "im/actor/model/modules/updates/internal/LoggedIn.h"
#include "java/lang/Runnable.h"

@interface ImActorModelModulesUpdatesInternalLoggedIn () {
 @public
  ImActorModelApiRpcResponseAuth *auth_;
  id<JavaLangRunnable> runnable_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesInternalLoggedIn, auth_, ImActorModelApiRpcResponseAuth *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUpdatesInternalLoggedIn, runnable_, id<JavaLangRunnable>)


#line 8
@implementation ImActorModelModulesUpdatesInternalLoggedIn


#line 12
- (instancetype)initWithImActorModelApiRpcResponseAuth:(ImActorModelApiRpcResponseAuth *)auth
                                  withJavaLangRunnable:(id<JavaLangRunnable>)runnable {
  if (self = [super init]) {
    
#line 13
    self->auth_ = auth;
    
#line 14
    self->runnable_ = runnable;
  }
  return self;
}


#line 17
- (ImActorModelApiRpcResponseAuth *)getAuth {
  
#line 18
  return auth_;
}


#line 21
- (id<JavaLangRunnable>)getRunnable {
  
#line 22
  return runnable_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesUpdatesInternalLoggedIn *)other {
  [super copyAllFieldsTo:other];
  other->auth_ = auth_;
  other->runnable_ = runnable_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesInternalLoggedIn)
