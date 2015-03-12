//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/pkcs/PBEParameter.java
//

#ifndef _OrgBouncycastleAsn1PkcsPBEParameter_H_
#define _OrgBouncycastleAsn1PkcsPBEParameter_H_

@class IOSByteArray;
@class JavaMathBigInteger;
@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1OctetString;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1PkcsPBEParameter : OrgBouncycastleAsn1ASN1Object {
 @public
  OrgBouncycastleAsn1ASN1Integer *iterations_;
  OrgBouncycastleAsn1ASN1OctetString *salt_;
}

- (instancetype)initWithByteArray:(IOSByteArray *)salt
                          withInt:(jint)iterations;

+ (OrgBouncycastleAsn1PkcsPBEParameter *)getInstanceWithId:(id)obj;

- (JavaMathBigInteger *)getIterationCount;

- (IOSByteArray *)getSalt;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1PkcsPBEParameter)

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1PkcsPBEParameter, iterations_, OrgBouncycastleAsn1ASN1Integer *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1PkcsPBEParameter, salt_, OrgBouncycastleAsn1ASN1OctetString *)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1PkcsPBEParameter *OrgBouncycastleAsn1PkcsPBEParameter_getInstanceWithId_(id obj);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1PkcsPBEParameter)

#endif // _OrgBouncycastleAsn1PkcsPBEParameter_H_
