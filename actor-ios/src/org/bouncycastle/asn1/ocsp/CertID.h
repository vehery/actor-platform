//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/ocsp/CertID.java
//

#ifndef _OrgBouncycastleAsn1OcspCertID_H_
#define _OrgBouncycastleAsn1OcspCertID_H_

@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1OctetString;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@class OrgBouncycastleAsn1X509AlgorithmIdentifier;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1OcspCertID : OrgBouncycastleAsn1ASN1Object {
 @public
  OrgBouncycastleAsn1X509AlgorithmIdentifier *hashAlgorithm_;
  OrgBouncycastleAsn1ASN1OctetString *issuerNameHash_;
  OrgBouncycastleAsn1ASN1OctetString *issuerKeyHash_;
  OrgBouncycastleAsn1ASN1Integer *serialNumber_;
}

- (instancetype)initWithOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)hashAlgorithm
                            withOrgBouncycastleAsn1ASN1OctetString:(OrgBouncycastleAsn1ASN1OctetString *)issuerNameHash
                            withOrgBouncycastleAsn1ASN1OctetString:(OrgBouncycastleAsn1ASN1OctetString *)issuerKeyHash
                                withOrgBouncycastleAsn1ASN1Integer:(OrgBouncycastleAsn1ASN1Integer *)serialNumber;

+ (OrgBouncycastleAsn1OcspCertID *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                          withBoolean:(jboolean)explicit_;

+ (OrgBouncycastleAsn1OcspCertID *)getInstanceWithId:(id)obj;

- (OrgBouncycastleAsn1X509AlgorithmIdentifier *)getHashAlgorithm;

- (OrgBouncycastleAsn1ASN1OctetString *)getIssuerNameHash;

- (OrgBouncycastleAsn1ASN1OctetString *)getIssuerKeyHash;

- (OrgBouncycastleAsn1ASN1Integer *)getSerialNumber;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1OcspCertID)

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1OcspCertID, hashAlgorithm_, OrgBouncycastleAsn1X509AlgorithmIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1OcspCertID, issuerNameHash_, OrgBouncycastleAsn1ASN1OctetString *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1OcspCertID, issuerKeyHash_, OrgBouncycastleAsn1ASN1OctetString *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1OcspCertID, serialNumber_, OrgBouncycastleAsn1ASN1Integer *)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1OcspCertID *OrgBouncycastleAsn1OcspCertID_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_);

FOUNDATION_EXPORT OrgBouncycastleAsn1OcspCertID *OrgBouncycastleAsn1OcspCertID_getInstanceWithId_(id obj);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1OcspCertID)

#endif // _OrgBouncycastleAsn1OcspCertID_H_
