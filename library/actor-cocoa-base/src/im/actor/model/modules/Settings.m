//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/Settings.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/Settings.java"

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/engine/PreferencesStorage.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Settings.h"

@interface ImActorModelModulesSettings () {
}
@end


#line 8
@implementation ImActorModelModulesSettings

NSString * ImActorModelModulesSettings_KEY_NOTIFICATION_TONES_ = @"settings_notification_tones";
NSString * ImActorModelModulesSettings_KEY_NOTIFICATION_SOUND_ = @"settings_notification_sounds";
NSString * ImActorModelModulesSettings_KEY_NOTIFICATION_VIBRATION_ = @"settings_notification_vibration";
NSString * ImActorModelModulesSettings_KEY_NOTIFICATION_TEXT_ = @"settings_notification_text";
NSString * ImActorModelModulesSettings_KEY_NOTIFICATION_CHAT_ = @"settings_notification_chat_";
NSString * ImActorModelModulesSettings_KEY_CHAT_SEND_BY_ENTER_ = @"settings_chat_send_by_enter";

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  return
#line 18
  [super initWithImActorModelModulesModules:modules];
}

- (jboolean)isConversationTonesEnabled {
  
#line 24
  return [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBool:ImActorModelModulesSettings_KEY_NOTIFICATION_TONES_ withDefault:YES];
}


#line 27
- (void)changeConversationTonesEnabledWithBoolean:(jboolean)val {
  
#line 28
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBool:ImActorModelModulesSettings_KEY_NOTIFICATION_TONES_ withValue:val];
}


#line 31
- (jboolean)isNotificationSoundEnabled {
  
#line 32
  return [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBool:ImActorModelModulesSettings_KEY_NOTIFICATION_SOUND_ withDefault:YES];
}


#line 35
- (void)changeNotificationSoundEnabledWithBoolean:(jboolean)val {
  
#line 36
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBool:ImActorModelModulesSettings_KEY_NOTIFICATION_SOUND_ withValue:val];
}


#line 39
- (jboolean)isVibrationEnabled {
  
#line 40
  return [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBool:ImActorModelModulesSettings_KEY_NOTIFICATION_VIBRATION_ withDefault:YES];
}


#line 43
- (void)changeNotificationVibrationEnabledWithBoolean:(jboolean)val {
  
#line 44
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBool:ImActorModelModulesSettings_KEY_NOTIFICATION_VIBRATION_ withValue:val];
}


#line 47
- (jboolean)isShowNotificationsText {
  
#line 48
  return [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBool:ImActorModelModulesSettings_KEY_NOTIFICATION_TEXT_ withDefault:YES];
}


#line 51
- (void)changeShowNotificationTextEnabledWithBoolean:(jboolean)val {
  
#line 52
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBool:ImActorModelModulesSettings_KEY_NOTIFICATION_TEXT_ withValue:val];
}

- (jboolean)isSendByEnterEnabled {
  
#line 58
  return [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBool:ImActorModelModulesSettings_KEY_CHAT_SEND_BY_ENTER_ withDefault:YES];
}


#line 61
- (void)changeSendByEnterWithBoolean:(jboolean)val {
  
#line 62
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBool:ImActorModelModulesSettings_KEY_CHAT_SEND_BY_ENTER_ withValue:val];
}

- (jboolean)isNotificationsEnabledWithAMPeer:(AMPeer *)peer {
  
#line 68
  return [((id<DKPreferencesStorage>) nil_chk([self preferences])) getBool:JreStrcat("$J", ImActorModelModulesSettings_KEY_NOTIFICATION_CHAT_, [((AMPeer *) nil_chk(peer)) getUnuqueId]) withDefault:YES];
}


#line 71
- (void)changeNotificationsEnabledWithAMPeer:(AMPeer *)peer
                                 withBoolean:(jboolean)val {
  
#line 72
  [((id<DKPreferencesStorage>) nil_chk([self preferences])) putBool:JreStrcat("$J", ImActorModelModulesSettings_KEY_NOTIFICATION_CHAT_, [((AMPeer *) nil_chk(peer)) getUnuqueId]) withValue:val];
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesSettings)
