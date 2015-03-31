//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/bser/Utils.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/bser/Utils.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/crypto/CryptoUtils.h"
#include "im/actor/model/droidkit/bser/Utils.h"
#include "java/io/IOException.h"
#include "java/lang/Integer.h"

@interface BSUtils ()
- (instancetype)init;
@end


#line 11
@implementation BSUtils

+ (jint)convertIntWithLong:(jlong)val {
  return BSUtils_convertIntWithLong_(val);
}


#line 22
+ (NSString *)convertStringWithByteArray:(IOSByteArray *)data {
  return BSUtils_convertStringWithByteArray_(data);
}


#line 30
+ (NSString *)byteArrayToStringWithByteArray:(IOSByteArray *)data {
  return BSUtils_byteArrayToStringWithByteArray_(data);
}


#line 38
+ (NSString *)byteArrayToStringCompactWithByteArray:(IOSByteArray *)data {
  return BSUtils_byteArrayToStringCompactWithByteArray_(data);
}


#line 46
+ (IOSByteArray *)intToBytesWithInt:(jint)v {
  return BSUtils_intToBytesWithInt_(v);
}


#line 56
+ (jlong)bytesToIntWithByteArray:(IOSByteArray *)data {
  return BSUtils_bytesToIntWithByteArray_(data);
}


#line 65
+ (IOSByteArray *)longToBytesWithLong:(jlong)v {
  return BSUtils_longToBytesWithLong_(v);
}


#line 79
+ (jlong)bytesToLongWithByteArray:(IOSByteArray *)data {
  return BSUtils_bytesToLongWithByteArray_(data);
}


#line 100
- (instancetype)init {
  return [super init];
}

@end

jint BSUtils_convertIntWithLong_(jlong val) {
  BSUtils_init();
  
#line 14
  if (val < JavaLangInteger_MIN_VALUE) {
    @throw [[JavaIoIOException alloc] initWithNSString:@"Too small value"];
  }
  else
#line 16
  if (val > JavaLangInteger_MAX_VALUE) {
    @throw [[JavaIoIOException alloc] initWithNSString:@"Too big value"];
  }
  return (jint) val;
}

NSString *BSUtils_convertStringWithByteArray_(IOSByteArray *data) {
  BSUtils_init();
  
#line 23
  if (data == nil) {
    return nil;
  }
  else {
    
#line 26
    return [NSString stringWithBytes:data charsetName:@"utf-8"];
  }
}

NSString *BSUtils_byteArrayToStringWithByteArray_(IOSByteArray *data) {
  BSUtils_init();
  
#line 31
  if (data == nil) {
    return @"null";
  }
  else {
    
#line 34
    return AMCryptoUtils_hexWithByteArray_(data);
  }
}

NSString *BSUtils_byteArrayToStringCompactWithByteArray_(IOSByteArray *data) {
  BSUtils_init();
  
#line 39
  if (data == nil) {
    return @"null";
  }
  else {
    
#line 42
    return AMCryptoUtils_hexWithByteArray_(AMCryptoUtils_MD5WithByteArray_(data));
  }
}

IOSByteArray *BSUtils_intToBytesWithInt_(jint v) {
  BSUtils_init();
  
#line 47
  IOSByteArray *data = [IOSByteArray newArrayWithLength:4];
  jint offset = 0;
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift32(v, 24)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift32(v, 16)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift32(v, 8)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) (v & (jint) 0xFF);
  return data;
}

jlong BSUtils_bytesToIntWithByteArray_(IOSByteArray *data) {
  BSUtils_init();
  
#line 57
  jint offset = 0;
  jint a1 = IOSByteArray_Get(nil_chk(data), offset + 3) & (jint) 0xFF;
  jint a2 = IOSByteArray_Get(data, offset + 2) & (jint) 0xFF;
  jint a3 = IOSByteArray_Get(data, offset + 1) & (jint) 0xFF;
  jint a4 = IOSByteArray_Get(data, offset + 0) & (jint) 0xFF;
  return (a1) + (LShift32(a2, 8)) + (LShift32(a3, 16)) + (LShift32(a4, 24));
}

IOSByteArray *BSUtils_longToBytesWithLong_(jlong v) {
  BSUtils_init();
  
#line 66
  IOSByteArray *data = [IOSByteArray newArrayWithLength:8];
  jint offset = 0;
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 56)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 48)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 40)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 32)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 24)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 16)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) ((RShift64(v, 8)) & (jint) 0xFF);
  *IOSByteArray_GetRef(data, offset++) = (jbyte) (v & (jint) 0xFF);
  return data;
}

jlong BSUtils_bytesToLongWithByteArray_(IOSByteArray *data) {
  BSUtils_init();
  
#line 80
  jint offset = 0;
  jlong a1 = IOSByteArray_Get(nil_chk(data), offset + 3) & (jint) 0xFF;
  jlong a2 = IOSByteArray_Get(data, offset + 2) & (jint) 0xFF;
  jlong a3 = IOSByteArray_Get(data, offset + 1) & (jint) 0xFF;
  jlong a4 = IOSByteArray_Get(data, offset + 0) & (jint) 0xFF;
  
#line 86
  jlong res1 = (a1) + (LShift64(a2, 8)) + (LShift64(a3, 16)) + (LShift64(a4, 24));
  offset += 4;
  
#line 89
  jlong b1 = IOSByteArray_Get(data, offset + 3) & (jint) 0xFF;
  jlong b2 = IOSByteArray_Get(data, offset + 2) & (jint) 0xFF;
  jlong b3 = IOSByteArray_Get(data, offset + 1) & (jint) 0xFF;
  jlong b4 = IOSByteArray_Get(data, offset + 0) & (jint) 0xFF;
  
#line 94
  jlong res2 = (b1) + (LShift64(b2, 8)) + (LShift64(b3, 16)) + (LShift64(b4, 24));
  offset += 4;
  
#line 97
  return res2 + (LShift64(res1, 32));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(BSUtils)
