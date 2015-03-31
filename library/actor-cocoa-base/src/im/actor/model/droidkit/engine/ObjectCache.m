//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/engine/ObjectCache.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/engine/ObjectCache.java"

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/engine/ObjectCache.h"
#include "java/util/HashMap.h"
#include "java/util/HashSet.h"

@interface DKObjectCache () {
 @public
  jboolean lockLoading_;
}
@end


#line 9
@implementation DKObjectCache


#line 14
- (void)onObjectLoadedWithId:(id)key
                      withId:(id)value {
  @synchronized(self) {
    
#line 15
    if (lockLoading_) {
      return;
    }
    if ([((JavaUtilHashSet *) nil_chk(removedItems_)) containsWithId:key]) {
      return;
    }
    if ([((JavaUtilHashMap *) nil_chk(memoryCache_)) containsKeyWithId:key]) {
      return;
    }
    (void) [memoryCache_ putWithId:key withId:value];
  }
}


#line 27
- (void)onObjectUpdatedWithId:(id)key
                       withId:(id)value {
  @synchronized(self) {
    
#line 28
    [((JavaUtilHashSet *) nil_chk(removedItems_)) removeWithId:key];
    (void) [((JavaUtilHashMap *) nil_chk(memoryCache_)) putWithId:key withId:value];
  }
}


#line 32
- (void)removeObjectWithId:(id)key {
  @synchronized(self) {
    
#line 33
    (void) [((JavaUtilHashMap *) nil_chk(memoryCache_)) removeWithId:key];
    [((JavaUtilHashSet *) nil_chk(removedItems_)) addWithId:key];
  }
}


#line 37
- (id)lookupWithId:(id)key {
  @synchronized(self) {
    
#line 38
    return [((JavaUtilHashMap *) nil_chk(memoryCache_)) getWithId:key];
  }
}


#line 41
- (void)clear {
  @synchronized(self) {
    
#line 42
    [((JavaUtilHashMap *) nil_chk(memoryCache_)) clear];
    [((JavaUtilHashSet *) nil_chk(removedItems_)) clear];
  }
}


#line 46
- (void)startLock {
  @synchronized(self) {
    
#line 47
    lockLoading_ = YES;
  }
}


#line 50
- (void)stopLock {
  @synchronized(self) {
    
#line 51
    lockLoading_ = NO;
  }
}

- (instancetype)init {
  if (self = [super init]) {
    memoryCache_ =
#line 10
    [[JavaUtilHashMap alloc] init];
    removedItems_ =
#line 11
    [[JavaUtilHashSet alloc] init];
    lockLoading_ =
#line 12
    NO;
  }
  return self;
}

- (void)copyAllFieldsTo:(DKObjectCache *)other {
  [super copyAllFieldsTo:other];
  other->memoryCache_ = memoryCache_;
  other->removedItems_ = removedItems_;
  other->lockLoading_ = lockLoading_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKObjectCache)
