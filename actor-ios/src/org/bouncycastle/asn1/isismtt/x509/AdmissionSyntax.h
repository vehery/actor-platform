//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/isismtt/x509/AdmissionSyntax.java
//

#ifndef _OrgBouncycastleAsn1IsismttX509AdmissionSyntax_H_
#define _OrgBouncycastleAsn1IsismttX509AdmissionSyntax_H_

@class IOSObjectArray;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1X509GeneralName;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1IsismttX509AdmissionSyntax : OrgBouncycastleAsn1ASN1Object {
}

+ (OrgBouncycastleAsn1IsismttX509AdmissionSyntax *)getInstanceWithId:(id)obj;

- (instancetype)initWithOrgBouncycastleAsn1X509GeneralName:(OrgBouncycastleAsn1X509GeneralName *)admissionAuthority
                       withOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)contentsOfAdmissions;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

- (OrgBouncycastleAsn1X509GeneralName *)getAdmissionAuthority;

- (IOSObjectArray *)getContentsOfAdmissions;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1IsismttX509AdmissionSyntax)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1IsismttX509AdmissionSyntax *OrgBouncycastleAsn1IsismttX509AdmissionSyntax_getInstanceWithId_(id obj);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1IsismttX509AdmissionSyntax)

#endif // _OrgBouncycastleAsn1IsismttX509AdmissionSyntax_H_
