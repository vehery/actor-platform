//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/isismtt/ocsp/RequestedCertificate.java
//

#ifndef _OrgBouncycastleAsn1IsismttOcspRequestedCertificate_H_
#define _OrgBouncycastleAsn1IsismttOcspRequestedCertificate_H_

@class IOSByteArray;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@class OrgBouncycastleAsn1X509Certificate;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Choice.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

#define OrgBouncycastleAsn1IsismttOcspRequestedCertificate_attributeCertificate 1
#define OrgBouncycastleAsn1IsismttOcspRequestedCertificate_certificate -1
#define OrgBouncycastleAsn1IsismttOcspRequestedCertificate_publicKeyCertificate 0

@interface OrgBouncycastleAsn1IsismttOcspRequestedCertificate : OrgBouncycastleAsn1ASN1Object < OrgBouncycastleAsn1ASN1Choice > {
}

+ (OrgBouncycastleAsn1IsismttOcspRequestedCertificate *)getInstanceWithId:(id)obj;

+ (OrgBouncycastleAsn1IsismttOcspRequestedCertificate *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                               withBoolean:(jboolean)explicit_;

- (instancetype)initWithOrgBouncycastleAsn1X509Certificate:(OrgBouncycastleAsn1X509Certificate *)certificate;

- (instancetype)initWithInt:(jint)type
              withByteArray:(IOSByteArray *)certificateOctets;

- (jint)getType;

- (IOSByteArray *)getCertificateBytes;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1IsismttOcspRequestedCertificate)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1IsismttOcspRequestedCertificate *OrgBouncycastleAsn1IsismttOcspRequestedCertificate_getInstanceWithId_(id obj);

FOUNDATION_EXPORT OrgBouncycastleAsn1IsismttOcspRequestedCertificate *OrgBouncycastleAsn1IsismttOcspRequestedCertificate_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1IsismttOcspRequestedCertificate, certificate, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1IsismttOcspRequestedCertificate, publicKeyCertificate, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1IsismttOcspRequestedCertificate, attributeCertificate, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1IsismttOcspRequestedCertificate)

#endif // _OrgBouncycastleAsn1IsismttOcspRequestedCertificate_H_
