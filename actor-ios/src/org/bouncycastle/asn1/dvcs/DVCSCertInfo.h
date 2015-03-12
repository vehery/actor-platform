//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/dvcs/DVCSCertInfo.java
//

#ifndef _OrgBouncycastleAsn1DvcsDVCSCertInfo_H_
#define _OrgBouncycastleAsn1DvcsDVCSCertInfo_H_

@class IOSObjectArray;
@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1ASN1Set;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@class OrgBouncycastleAsn1CmpPKIStatusInfo;
@class OrgBouncycastleAsn1DvcsDVCSRequestInformation;
@class OrgBouncycastleAsn1DvcsDVCSTime;
@class OrgBouncycastleAsn1X509DigestInfo;
@class OrgBouncycastleAsn1X509Extensions;
@class OrgBouncycastleAsn1X509PolicyInformation;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

#define OrgBouncycastleAsn1DvcsDVCSCertInfo_DEFAULT_VERSION 1
#define OrgBouncycastleAsn1DvcsDVCSCertInfo_TAG_CERTS 3
#define OrgBouncycastleAsn1DvcsDVCSCertInfo_TAG_DV_STATUS 0
#define OrgBouncycastleAsn1DvcsDVCSCertInfo_TAG_POLICY 1
#define OrgBouncycastleAsn1DvcsDVCSCertInfo_TAG_REQ_SIGNATURE 2

@interface OrgBouncycastleAsn1DvcsDVCSCertInfo : OrgBouncycastleAsn1ASN1Object {
}

- (instancetype)initWithOrgBouncycastleAsn1DvcsDVCSRequestInformation:(OrgBouncycastleAsn1DvcsDVCSRequestInformation *)dvReqInfo
                                withOrgBouncycastleAsn1X509DigestInfo:(OrgBouncycastleAsn1X509DigestInfo *)messageImprint
                                   withOrgBouncycastleAsn1ASN1Integer:(OrgBouncycastleAsn1ASN1Integer *)serialNumber
                                  withOrgBouncycastleAsn1DvcsDVCSTime:(OrgBouncycastleAsn1DvcsDVCSTime *)responseTime;

+ (OrgBouncycastleAsn1DvcsDVCSCertInfo *)getInstanceWithId:(id)obj;

+ (OrgBouncycastleAsn1DvcsDVCSCertInfo *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                withBoolean:(jboolean)explicit_;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

- (NSString *)description;

- (jint)getVersion;

- (OrgBouncycastleAsn1DvcsDVCSRequestInformation *)getDvReqInfo;

- (OrgBouncycastleAsn1X509DigestInfo *)getMessageImprint;

- (OrgBouncycastleAsn1ASN1Integer *)getSerialNumber;

- (OrgBouncycastleAsn1DvcsDVCSTime *)getResponseTime;

- (OrgBouncycastleAsn1CmpPKIStatusInfo *)getDvStatus;

- (OrgBouncycastleAsn1X509PolicyInformation *)getPolicy;

- (OrgBouncycastleAsn1ASN1Set *)getReqSignature;

- (IOSObjectArray *)getCerts;

- (OrgBouncycastleAsn1X509Extensions *)getExtensions;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1DvcsDVCSCertInfo)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1DvcsDVCSCertInfo *OrgBouncycastleAsn1DvcsDVCSCertInfo_getInstanceWithId_(id obj);

FOUNDATION_EXPORT OrgBouncycastleAsn1DvcsDVCSCertInfo *OrgBouncycastleAsn1DvcsDVCSCertInfo_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1DvcsDVCSCertInfo, DEFAULT_VERSION, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1DvcsDVCSCertInfo, TAG_DV_STATUS, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1DvcsDVCSCertInfo, TAG_POLICY, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1DvcsDVCSCertInfo, TAG_REQ_SIGNATURE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1DvcsDVCSCertInfo, TAG_CERTS, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1DvcsDVCSCertInfo)

#endif // _OrgBouncycastleAsn1DvcsDVCSCertInfo_H_
