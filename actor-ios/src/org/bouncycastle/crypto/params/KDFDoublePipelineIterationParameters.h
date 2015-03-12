//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/crypto/params/KDFDoublePipelineIterationParameters.java
//

#ifndef _OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_H_
#define _OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_H_

@class IOSByteArray;

#include "J2ObjC_header.h"
#include "org/bouncycastle/crypto/DerivationParameters.h"

#define OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_UNUSED_R 32

@interface OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters : NSObject < OrgBouncycastleCryptoDerivationParameters > {
}

+ (OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *)createWithCounterWithByteArray:(IOSByteArray *)ki
                                                                                      withByteArray:(IOSByteArray *)fixedInputData
                                                                                            withInt:(jint)r;

+ (OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *)createWithoutCounterWithByteArray:(IOSByteArray *)ki
                                                                                         withByteArray:(IOSByteArray *)fixedInputData;

- (IOSByteArray *)getKI;

- (jboolean)useCounter;

- (jint)getR;

- (IOSByteArray *)getFixedInputData;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_createWithCounterWithByteArray_withByteArray_withInt_(IOSByteArray *ki, IOSByteArray *fixedInputData, jint r);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters *OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_createWithoutCounterWithByteArray_withByteArray_(IOSByteArray *ki, IOSByteArray *fixedInputData);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters, UNUSED_R, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters)

#endif // _OrgBouncycastleCryptoParamsKDFDoublePipelineIterationParameters_H_
