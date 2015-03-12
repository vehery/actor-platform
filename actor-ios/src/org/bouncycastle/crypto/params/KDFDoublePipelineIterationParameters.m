//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/crypto/params/KDFDoublePipelineIterationParameters.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "org/bouncycastle/crypto/params/KDFDoublePipelineIterationParameters.h"
#include "org/bouncycastle/util/Arrays.h"

@interface OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters () {
 @public
  IOSByteArray *ki_;
  jboolean useCounter__;
  jint r_;
  IOSByteArray *fixedInputData_;
}
- (instancetype)initWithByteArray:(IOSByteArray *)ki
                    withByteArray:(IOSByteArray *)fixedInputData
                          withInt:(jint)r
                      withBoolean:(jboolean)useCounter;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters, ki_, IOSByteArray *)
J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters, fixedInputData_, IOSByteArray *)

@implementation OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters

- (instancetype)initWithByteArray:(IOSByteArray *)ki
                    withByteArray:(IOSByteArray *)fixedInputData
                          withInt:(jint)r
                      withBoolean:(jboolean)useCounter {
  if (self = [super init]) {
    if (ki == nil) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:@"A KDF requires Ki (a seed) as input"];
    }
    self->ki_ = OrgBouncycastleUtilArrays_cloneWithByteArray_(ki);
    if (fixedInputData == nil) {
      self->fixedInputData_ = [IOSByteArray newArrayWithLength:0];
    }
    else {
      self->fixedInputData_ = OrgBouncycastleUtilArrays_cloneWithByteArray_(fixedInputData);
    }
    if (r != 8 && r != 16 && r != 24 && r != 32) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:@"Length of counter should be 8, 16, 24 or 32"];
    }
    self->r_ = r;
    self->useCounter__ = useCounter;
  }
  return self;
}

+ (OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *)createWithCounterWithByteArray:(IOSByteArray *)ki
                                                                                      withByteArray:(IOSByteArray *)fixedInputData
                                                                                            withInt:(jint)r {
  return OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_createWithCounterWithByteArray_withByteArray_withInt_(ki, fixedInputData, r);
}

+ (OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *)createWithoutCounterWithByteArray:(IOSByteArray *)ki
                                                                                         withByteArray:(IOSByteArray *)fixedInputData {
  return OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_createWithoutCounterWithByteArray_withByteArray_(ki, fixedInputData);
}

- (IOSByteArray *)getKI {
  return ki_;
}

- (jboolean)useCounter {
  return useCounter__;
}

- (jint)getR {
  return r_;
}

- (IOSByteArray *)getFixedInputData {
  return OrgBouncycastleUtilArrays_cloneWithByteArray_(fixedInputData_);
}

- (void)copyAllFieldsTo:(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *)other {
  [super copyAllFieldsTo:other];
  other->ki_ = ki_;
  other->useCounter__ = useCounter__;
  other->r_ = r_;
  other->fixedInputData_ = fixedInputData_;
}

@end

OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_createWithCounterWithByteArray_withByteArray_withInt_(IOSByteArray *ki, IOSByteArray *fixedInputData, jint r) {
  OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_init();
  return [[OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters alloc] initWithByteArray:ki withByteArray:fixedInputData withInt:r withBoolean:YES];
}

OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_createWithoutCounterWithByteArray_withByteArray_(IOSByteArray *ki, IOSByteArray *fixedInputData) {
  OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_init();
  return [[OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters alloc] initWithByteArray:ki withByteArray:fixedInputData withInt:OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_UNUSED_R withBoolean:NO];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters)
