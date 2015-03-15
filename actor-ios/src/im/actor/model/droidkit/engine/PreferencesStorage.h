//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/engine/PreferencesStorage.java
//

#ifndef _DKPreferencesStorage_H_
#define _DKPreferencesStorage_H_

@class IOSByteArray;

#include "J2ObjC_header.h"

@protocol DKPreferencesStorage < NSObject, JavaObject >

- (void)putLongWithNSString:(NSString *)key
                   withLong:(jlong)v;

- (jlong)getLongWithNSString:(NSString *)key
                    withLong:(jlong)def;

- (void)putIntWithNSString:(NSString *)key
                   withInt:(jint)v;

- (jint)getIntWithNSString:(NSString *)key
                   withInt:(jint)def;

- (void)putBoolWithNSString:(NSString *)key
                withBoolean:(jboolean)v;

- (jboolean)getBoolWithNSString:(NSString *)key
                    withBoolean:(jboolean)def;

- (void)putBytesWithNSString:(NSString *)key
               withByteArray:(IOSByteArray *)v;

- (IOSByteArray *)getBytesWithNSString:(NSString *)key;

- (void)putStringWithNSString:(NSString *)key
                 withNSString:(NSString *)v;

- (NSString *)getStringWithNSString:(NSString *)key;

@end

J2OBJC_EMPTY_STATIC_INIT(DKPreferencesStorage)

#define ImActorModelDroidkitEnginePreferencesStorage DKPreferencesStorage

J2OBJC_TYPE_LITERAL_HEADER(DKPreferencesStorage)

#endif // _DKPreferencesStorage_H_
