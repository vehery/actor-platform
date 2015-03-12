//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/icao/CscaMasterList.java
//

#ifndef _OrgBouncycastleAsn1IcaoCscaMasterList_H_
#define _OrgBouncycastleAsn1IcaoCscaMasterList_H_

@class IOSObjectArray;
@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1IcaoCscaMasterList : OrgBouncycastleAsn1ASN1Object {
}

+ (OrgBouncycastleAsn1IcaoCscaMasterList *)getInstanceWithId:(id)obj;

- (instancetype)initWithOrgBouncycastleAsn1X509CertificateArray:(IOSObjectArray *)certStructs;

- (jint)getVersion;

- (IOSObjectArray *)getCertStructs;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1IcaoCscaMasterList)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1IcaoCscaMasterList *OrgBouncycastleAsn1IcaoCscaMasterList_getInstanceWithId_(id obj);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1IcaoCscaMasterList)

#endif // _OrgBouncycastleAsn1IcaoCscaMasterList_H_
