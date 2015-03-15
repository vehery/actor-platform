//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/NetworkProvider.java
//

#ifndef _AMNetworkProvider_H_
#define _AMNetworkProvider_H_

@class AMConnectionEndpoint;
@protocol AMConnectionCallback;
@protocol AMCreateConnectionCallback;

#include "J2ObjC_header.h"

@protocol AMNetworkProvider < NSObject, JavaObject >

- (void)createConnection:(jint)connectionId withEndpoint:(AMConnectionEndpoint *)endpoint withCallback:(id<AMConnectionCallback>)callback withCreateCallback:(id<AMCreateConnectionCallback>)createCallback;

@end

J2OBJC_EMPTY_STATIC_INIT(AMNetworkProvider)

#define ImActorModelNetworkProvider AMNetworkProvider

J2OBJC_TYPE_LITERAL_HEADER(AMNetworkProvider)

#endif // _AMNetworkProvider_H_
