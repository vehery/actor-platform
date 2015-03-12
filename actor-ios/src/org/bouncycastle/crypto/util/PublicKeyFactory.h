//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/crypto/util/PublicKeyFactory.java
//

#ifndef _OrgBouncycastleCryptoUtilPublicKeyFactory_H_
#define _OrgBouncycastleCryptoUtilPublicKeyFactory_H_

@class IOSByteArray;
@class JavaIoInputStream;
@class OrgBouncycastleAsn1X509SubjectPublicKeyInfo;
@class OrgBouncycastleCryptoParamsAsymmetricKeyParameter;

#include "J2ObjC_header.h"

@interface OrgBouncycastleCryptoUtilPublicKeyFactory : NSObject {
}

+ (OrgBouncycastleCryptoParamsAsymmetricKeyParameter *)createKeyWithByteArray:(IOSByteArray *)keyInfoData;

+ (OrgBouncycastleCryptoParamsAsymmetricKeyParameter *)createKeyWithJavaIoInputStream:(JavaIoInputStream *)inStr;

+ (OrgBouncycastleCryptoParamsAsymmetricKeyParameter *)createKeyWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo:(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *)keyInfo;

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoUtilPublicKeyFactory)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsAsymmetricKeyParameter *OrgBouncycastleCryptoUtilPublicKeyFactory_createKeyWithByteArray_(IOSByteArray *keyInfoData);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsAsymmetricKeyParameter *OrgBouncycastleCryptoUtilPublicKeyFactory_createKeyWithJavaIoInputStream_(JavaIoInputStream *inStr);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsAsymmetricKeyParameter *OrgBouncycastleCryptoUtilPublicKeyFactory_createKeyWithOrgBouncycastleAsn1X509SubjectPublicKeyInfo_(OrgBouncycastleAsn1X509SubjectPublicKeyInfo *keyInfo);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoUtilPublicKeyFactory)

#endif // _OrgBouncycastleCryptoUtilPublicKeyFactory_H_
