//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/cms/MetaData.java
//

#ifndef _OrgBouncycastleAsn1CmsMetaData_H_
#define _OrgBouncycastleAsn1CmsMetaData_H_

@class OrgBouncycastleAsn1ASN1Boolean;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1Sequence;
@class OrgBouncycastleAsn1CmsAttributes;
@class OrgBouncycastleAsn1DERIA5String;
@class OrgBouncycastleAsn1DERUTF8String;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

@interface OrgBouncycastleAsn1CmsMetaData : OrgBouncycastleAsn1ASN1Object {
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Boolean:(OrgBouncycastleAsn1ASN1Boolean *)hashProtected
                  withOrgBouncycastleAsn1DERUTF8String:(OrgBouncycastleAsn1DERUTF8String *)fileName
                   withOrgBouncycastleAsn1DERIA5String:(OrgBouncycastleAsn1DERIA5String *)mediaType
                  withOrgBouncycastleAsn1CmsAttributes:(OrgBouncycastleAsn1CmsAttributes *)otherMetaData;

+ (OrgBouncycastleAsn1CmsMetaData *)getInstanceWithId:(id)obj;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

- (jboolean)isHashProtected;

- (OrgBouncycastleAsn1DERUTF8String *)getFileName;

- (OrgBouncycastleAsn1DERIA5String *)getMediaType;

- (OrgBouncycastleAsn1CmsAttributes *)getOtherMetaData;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1CmsMetaData)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1CmsMetaData *OrgBouncycastleAsn1CmsMetaData_getInstanceWithId_(id obj);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1CmsMetaData)

#endif // _OrgBouncycastleAsn1CmsMetaData_H_
