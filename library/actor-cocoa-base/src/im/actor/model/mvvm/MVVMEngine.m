//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/mvvm/MVVMEngine.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/mvvm/MVVMEngine.java"

#include "J2ObjC_source.h"
#include "im/actor/model/MainThreadProvider.h"
#include "im/actor/model/mvvm/MVVMEngine.h"
#include "java/lang/Runnable.h"
#include "java/lang/RuntimeException.h"

@interface AMMVVMEngine () {
}
@end


#line 8
@implementation AMMVVMEngine

id<AMMainThreadProvider> AMMVVMEngine_mainThreadProvider_;


#line 11
+ (void)init__WithAMMainThreadProvider:(id<AMMainThreadProvider>)mainThreadProvider {
  AMMVVMEngine_init__WithAMMainThreadProvider_(mainThreadProvider);
}

+ (id<AMMainThreadProvider>)getMainThreadProvider {
  return AMMVVMEngine_getMainThreadProvider();
}

+ (void)checkMainThread {
  AMMVVMEngine_checkMainThread();
}


#line 28
+ (void)runOnUiThreadWithJavaLangRunnable:(id<JavaLangRunnable>)runnable {
  AMMVVMEngine_runOnUiThreadWithJavaLangRunnable_(runnable);
}

- (instancetype)init {
  return [super init];
}

@end

void AMMVVMEngine_init__WithAMMainThreadProvider_(id<AMMainThreadProvider> mainThreadProvider) {
  AMMVVMEngine_init();
  
#line 12
  AMMVVMEngine_mainThreadProvider_ = mainThreadProvider;
}

id<AMMainThreadProvider> AMMVVMEngine_getMainThreadProvider() {
  AMMVVMEngine_init();
  
#line 16
  return AMMVVMEngine_mainThreadProvider_;
}

void AMMVVMEngine_checkMainThread() {
  AMMVVMEngine_init();
  
#line 20
  if ([((id<AMMainThreadProvider>) nil_chk(AMMVVMEngine_mainThreadProvider_)) isSingleThread]) {
    return;
  }
  if (![AMMVVMEngine_mainThreadProvider_ isMainThread]) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Unable to perform operation not from Main Thread"];
  }
}

void AMMVVMEngine_runOnUiThreadWithJavaLangRunnable_(id<JavaLangRunnable> runnable) {
  AMMVVMEngine_init();
  
#line 29
  [((id<AMMainThreadProvider>) nil_chk(AMMVVMEngine_mainThreadProvider_)) runOnUiThread:runnable];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMMVVMEngine)
