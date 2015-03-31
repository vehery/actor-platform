//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/file/entity/Downloaded.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/file/entity/Downloaded.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/modules/file/entity/Downloaded.h"
#include "java/io/IOException.h"

@interface ImActorModelModulesFileEntityDownloaded () {
 @public
  jlong fileId_;
  jint fileSize_;
  NSString *descriptor_;
}
- (instancetype)init;
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesFileEntityDownloaded, descriptor_, NSString *)


#line 14
@implementation ImActorModelModulesFileEntityDownloaded

+ (ImActorModelModulesFileEntityDownloaded *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelModulesFileEntityDownloaded_fromBytesWithByteArray_(data);
}


#line 24
- (instancetype)initWithLong:(jlong)fileId
                     withInt:(jint)fileSize
                withNSString:(NSString *)descriptor {
  if (self = [super init]) {
    
#line 25
    self->fileId_ = fileId;
    
#line 26
    self->fileSize_ = fileSize;
    
#line 27
    self->descriptor_ = descriptor;
  }
  return self;
}


#line 30
- (instancetype)init {
  return [super init];
}

- (jlong)getFileId {
  
#line 35
  return fileId_;
}


#line 38
- (jint)getFileSize {
  
#line 39
  return fileSize_;
}


#line 42
- (NSString *)getDescriptor {
  
#line 43
  return descriptor_;
}


#line 47
- (void)parseWithBSBserValues:(BSBserValues *)values {
  fileId_ = [((BSBserValues *) nil_chk(values)) getLongWithInt:1];
  fileSize_ = [values getIntWithInt:2];
  descriptor_ = [values getStringWithInt:3];
}


#line 54
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 55
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:fileId_];
  [writer writeIntWithInt:2 withInt:fileSize_];
  [writer writeStringWithInt:3 withNSString:descriptor_];
}


#line 61
- (jlong)getEngineId {
  return fileId_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesFileEntityDownloaded *)other {
  [super copyAllFieldsTo:other];
  other->fileId_ = fileId_;
  other->fileSize_ = fileSize_;
  other->descriptor_ = descriptor_;
}

@end

ImActorModelModulesFileEntityDownloaded *ImActorModelModulesFileEntityDownloaded_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelModulesFileEntityDownloaded_init();
  
#line 17
  return ((ImActorModelModulesFileEntityDownloaded *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelModulesFileEntityDownloaded alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesFileEntityDownloaded)
