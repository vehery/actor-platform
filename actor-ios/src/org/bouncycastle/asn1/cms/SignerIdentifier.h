//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/cms/SignerIdentifier.java
//

#ifndef _OrgBouncycastleAsn1CmsSignerIdentifier_H_
#define _OrgBouncycastleAsn1CmsSignerIdentifier_H_

@class OrgBouncycastleAsn1ASN1OctetString;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1CmsIssuerAndSerialNumber;
@protocol OrgBouncycastleAsn1ASN1Encodable;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Choice.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1CmsSignerIdentifier : OrgBouncycastleAsn1ASN1Object < OrgBouncycastleAsn1ASN1Choice > {
}

- (instancetype)initWithOrgBouncycastleAsn1CmsIssuerAndSerialNumber:(OrgBouncycastleAsn1CmsIssuerAndSerialNumber *)id_;

- (instancetype)initWithOrgBouncycastleAsn1ASN1OctetString:(OrgBouncycastleAsn1ASN1OctetString *)id_;

- (instancetype)initWithOrgBouncycastleAsn1ASN1Primitive:(OrgBouncycastleAsn1ASN1Primitive *)id_;

+ (OrgBouncycastleAsn1CmsSignerIdentifier *)getInstanceWithId:(id)o;

- (jboolean)isTagged;

- (id<OrgBouncycastleAsn1ASN1Encodable>)getId;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1CmsSignerIdentifier)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1CmsSignerIdentifier *OrgBouncycastleAsn1CmsSignerIdentifier_getInstanceWithId_(id o);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1CmsSignerIdentifier)

#endif // _OrgBouncycastleAsn1CmsSignerIdentifier_H_
