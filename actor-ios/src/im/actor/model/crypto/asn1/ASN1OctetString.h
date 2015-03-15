//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/crypto/asn1/ASN1OctetString.java
//

#ifndef _BCASN1OctetString_H_
#define _BCASN1OctetString_H_

@class BSDataInput;
@class BSDataOutput;
@class IOSByteArray;

#include "J2ObjC_header.h"
#include "im/actor/model/crypto/asn1/ASN1Primitive.h"

@interface BCASN1OctetString : BCASN1Primitive {
}

+ (BCASN1OctetString *)readOctetStringWithBSDataInput:(BSDataInput *)dataInput;

- (instancetype)initWithByteArray:(IOSByteArray *)data;

- (IOSByteArray *)getData;

- (void)serializeWithBSDataOutput:(BSDataOutput *)dataOutput;

@end

J2OBJC_EMPTY_STATIC_INIT(BCASN1OctetString)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT BCASN1OctetString *BCASN1OctetString_readOctetStringWithBSDataInput_(BSDataInput *dataInput);
CF_EXTERN_C_END

typedef BCASN1OctetString ImActorModelCryptoAsn1ASN1OctetString;

J2OBJC_TYPE_LITERAL_HEADER(BCASN1OctetString)

#endif // _BCASN1OctetString_H_
