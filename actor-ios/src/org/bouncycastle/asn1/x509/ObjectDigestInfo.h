//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/x509/ObjectDigestInfo.java
//

#ifndef _OrgBouncycastleAsn1X509ObjectDigestInfo_H_
#define _OrgBouncycastleAsn1X509ObjectDigestInfo_H_

@class IOSByteArray;
@class OrgBouncycastleAsn1ASN1Enumerated;
@class OrgBouncycastleAsn1ASN1ObjectIdentifier;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@class OrgBouncycastleAsn1DERBitString;
@class OrgBouncycastleAsn1X509AlgorithmIdentifier;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

#define OrgBouncycastleAsn1X509ObjectDigestInfo_otherObjectDigest 2
#define OrgBouncycastleAsn1X509ObjectDigestInfo_publicKey 0
#define OrgBouncycastleAsn1X509ObjectDigestInfo_publicKeyCert 1

@interface OrgBouncycastleAsn1X509ObjectDigestInfo : OrgBouncycastleAsn1ASN1Object {
 @public
  OrgBouncycastleAsn1ASN1Enumerated *digestedObjectType_;
  OrgBouncycastleAsn1ASN1ObjectIdentifier *otherObjectTypeID_;
  OrgBouncycastleAsn1X509AlgorithmIdentifier *digestAlgorithm_;
  OrgBouncycastleAsn1DERBitString *objectDigest_;
}

+ (OrgBouncycastleAsn1X509ObjectDigestInfo *)getInstanceWithId:(id)obj;

+ (OrgBouncycastleAsn1X509ObjectDigestInfo *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                    withBoolean:(jboolean)explicit_;

- (instancetype)initWithInt:(jint)digestedObjectType
withOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)otherObjectTypeID
withOrgBouncycastleAsn1X509AlgorithmIdentifier:(OrgBouncycastleAsn1X509AlgorithmIdentifier *)digestAlgorithm
              withByteArray:(IOSByteArray *)objectDigest;

- (OrgBouncycastleAsn1ASN1Enumerated *)getDigestedObjectType;

- (OrgBouncycastleAsn1ASN1ObjectIdentifier *)getOtherObjectTypeID;

- (OrgBouncycastleAsn1X509AlgorithmIdentifier *)getDigestAlgorithm;

- (OrgBouncycastleAsn1DERBitString *)getObjectDigest;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1X509ObjectDigestInfo)

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, digestedObjectType_, OrgBouncycastleAsn1ASN1Enumerated *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, otherObjectTypeID_, OrgBouncycastleAsn1ASN1ObjectIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, digestAlgorithm_, OrgBouncycastleAsn1X509AlgorithmIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, objectDigest_, OrgBouncycastleAsn1DERBitString *)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1X509ObjectDigestInfo *OrgBouncycastleAsn1X509ObjectDigestInfo_getInstanceWithId_(id obj);

FOUNDATION_EXPORT OrgBouncycastleAsn1X509ObjectDigestInfo *OrgBouncycastleAsn1X509ObjectDigestInfo_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, publicKey, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, publicKeyCert, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1X509ObjectDigestInfo, otherObjectDigest, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1X509ObjectDigestInfo)

#endif // _OrgBouncycastleAsn1X509ObjectDigestInfo_H_
