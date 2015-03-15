//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/engine/ListEngine.java
//

#ifndef _DKListEngine_H_
#define _DKListEngine_H_

@class BSBserObject;
@class IOSLongArray;
@protocol DKListEngineItem;
@protocol JavaUtilList;

#include "J2ObjC_header.h"

@protocol DKListEngine < NSObject, JavaObject >

- (void)addOrUpdateItemWithBSBserObject:(BSBserObject<DKListEngineItem> *)item;

- (void)addOrUpdateItemsWithJavaUtilList:(id<JavaUtilList>)items;

- (void)replaceItemsWithJavaUtilList:(id<JavaUtilList>)items;

- (void)removeItemWithLong:(jlong)key;

- (void)removeItemsWithLongArray:(IOSLongArray *)keys;

- (void)clear;

- (id)getValueWithLong:(jlong)key;

- (id)getHeadValue;

- (jint)getCount;

@end

J2OBJC_EMPTY_STATIC_INIT(DKListEngine)

#define ImActorModelDroidkitEngineListEngine DKListEngine

J2OBJC_TYPE_LITERAL_HEADER(DKListEngine)

#endif // _DKListEngine_H_
