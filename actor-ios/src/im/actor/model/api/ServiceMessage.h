//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/ServiceMessage.java
//

#ifndef _ImActorModelApiServiceMessage_H_
#define _ImActorModelApiServiceMessage_H_

@class BSBserValues;
@class BSBserWriter;
@class ImActorModelApiServiceEx;

#include "J2ObjC_header.h"
#include "im/actor/model/api/Message.h"

@interface ImActorModelApiServiceMessage : ImActorModelApiMessage {
}

- (instancetype)initWithNSString:(NSString *)text
    withImActorModelApiServiceEx:(ImActorModelApiServiceEx *)ext;

- (instancetype)init;

- (jint)getHeader;

- (NSString *)getText;

- (ImActorModelApiServiceEx *)getExt;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiServiceMessage)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiServiceMessage)

#endif // _ImActorModelApiServiceMessage_H_
