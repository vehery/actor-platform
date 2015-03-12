//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/x509/NoticeReference.java
//

#ifndef _OrgBouncycastleAsn1X509NoticeReference_H_
#define _OrgBouncycastleAsn1X509NoticeReference_H_

@class IOSObjectArray;
@class JavaUtilVector;
@class OrgBouncycastleAsn1ASN1EncodableVector;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1X509DisplayText;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1X509NoticeReference : OrgBouncycastleAsn1ASN1Object {
}

- (instancetype)initWithNSString:(NSString *)organization
              withJavaUtilVector:(JavaUtilVector *)numbers;

- (instancetype)initWithNSString:(NSString *)organization
withOrgBouncycastleAsn1ASN1EncodableVector:(OrgBouncycastleAsn1ASN1EncodableVector *)noticeNumbers;

- (instancetype)initWithOrgBouncycastleAsn1X509DisplayText:(OrgBouncycastleAsn1X509DisplayText *)organization
                withOrgBouncycastleAsn1ASN1EncodableVector:(OrgBouncycastleAsn1ASN1EncodableVector *)noticeNumbers;

+ (OrgBouncycastleAsn1X509NoticeReference *)getInstanceWithId:(id)as;

- (OrgBouncycastleAsn1X509DisplayText *)getOrganization;

- (IOSObjectArray *)getNoticeNumbers;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1X509NoticeReference)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1X509NoticeReference *OrgBouncycastleAsn1X509NoticeReference_getInstanceWithId_(id as);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1X509NoticeReference)

#endif // _OrgBouncycastleAsn1X509NoticeReference_H_
