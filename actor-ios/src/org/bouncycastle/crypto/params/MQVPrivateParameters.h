//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/crypto/params/MQVPrivateParameters.java
//

#ifndef _OrgBouncycastleCryptoParamsMQVPrivateParameters_H_
#define _OrgBouncycastleCryptoParamsMQVPrivateParameters_H_

@class OrgBouncycastleCryptoParamsECPrivateKeyParameters;
@class OrgBouncycastleCryptoParamsECPublicKeyParameters;

#include "J2ObjC_header.h"
#include "org/bouncycastle/crypto/CipherParameters.h"

@interface OrgBouncycastleCryptoParamsMQVPrivateParameters : NSObject < OrgBouncycastleCryptoCipherParameters > {
}

- (instancetype)initWithOrgBouncycastleCryptoParamsECPrivateKeyParameters:(OrgBouncycastleCryptoParamsECPrivateKeyParameters *)staticPrivateKey
                    withOrgBouncycastleCryptoParamsECPrivateKeyParameters:(OrgBouncycastleCryptoParamsECPrivateKeyParameters *)ephemeralPrivateKey;

- (instancetype)initWithOrgBouncycastleCryptoParamsECPrivateKeyParameters:(OrgBouncycastleCryptoParamsECPrivateKeyParameters *)staticPrivateKey
                    withOrgBouncycastleCryptoParamsECPrivateKeyParameters:(OrgBouncycastleCryptoParamsECPrivateKeyParameters *)ephemeralPrivateKey
                     withOrgBouncycastleCryptoParamsECPublicKeyParameters:(OrgBouncycastleCryptoParamsECPublicKeyParameters *)ephemeralPublicKey;

- (OrgBouncycastleCryptoParamsECPrivateKeyParameters *)getStaticPrivateKey;

- (OrgBouncycastleCryptoParamsECPrivateKeyParameters *)getEphemeralPrivateKey;

- (OrgBouncycastleCryptoParamsECPublicKeyParameters *)getEphemeralPublicKey;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoParamsMQVPrivateParameters)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoParamsMQVPrivateParameters)

#endif // _OrgBouncycastleCryptoParamsMQVPrivateParameters_H_
