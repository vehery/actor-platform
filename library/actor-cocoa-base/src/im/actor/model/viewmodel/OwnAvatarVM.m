//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/viewmodel/OwnAvatarVM.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/viewmodel/OwnAvatarVM.java"

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/viewmodel/AvatarUploadState.h"
#include "im/actor/model/viewmodel/OwnAvatarVM.h"

@interface AMOwnAvatarVM () {
 @public
  AMValueModel *uploadState_;
}
@end

J2OBJC_FIELD_SETTER(AMOwnAvatarVM, uploadState_, AMValueModel *)


#line 8
@implementation AMOwnAvatarVM


#line 12
- (AMValueModel *)getUploadState {
  
#line 13
  return uploadState_;
}

- (instancetype)init {
  if (self = [super init]) {
    uploadState_ =
#line 9
    [[AMValueModel alloc] initWithNSString:
#line 10
    @"avatar.my" withId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:NO]];
  }
  return self;
}

- (void)copyAllFieldsTo:(AMOwnAvatarVM *)other {
  [super copyAllFieldsTo:other];
  other->uploadState_ = uploadState_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMOwnAvatarVM)
