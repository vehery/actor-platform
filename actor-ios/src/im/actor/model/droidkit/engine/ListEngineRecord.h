//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/engine/ListEngineRecord.java
//

#ifndef _DKListEngineRecord_H_
#define _DKListEngineRecord_H_

@class IOSByteArray;

#include "J2ObjC_header.h"

@interface DKListEngineRecord : NSObject {
}

- (instancetype)initWithLong:(jlong)key
                    withLong:(jlong)order
                withNSString:(NSString *)query
               withByteArray:(IOSByteArray *)data;

- (jlong)getKey;

- (jlong)getOrder;

- (NSString *)getQuery;

- (IOSByteArray *)getData;

@end

J2OBJC_EMPTY_STATIC_INIT(DKListEngineRecord)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

typedef DKListEngineRecord ImActorModelDroidkitEngineListEngineRecord;

J2OBJC_TYPE_LITERAL_HEADER(DKListEngineRecord)

#endif // _DKListEngineRecord_H_
