//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/cms/TimeStampedDataParser.java
//

#ifndef _OrgBouncycastleAsn1CmsTimeStampedDataParser_H_
#define _OrgBouncycastleAsn1CmsTimeStampedDataParser_H_

@class OrgBouncycastleAsn1ASN1Integer;
@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1CmsEvidence;
@class OrgBouncycastleAsn1CmsMetaData;
@class OrgBouncycastleAsn1DERIA5String;
@protocol OrgBouncycastleAsn1ASN1OctetStringParser;
@protocol OrgBouncycastleAsn1ASN1SequenceParser;

#include "J2ObjC_header.h"

@interface OrgBouncycastleAsn1CmsTimeStampedDataParser : NSObject {
}

+ (OrgBouncycastleAsn1CmsTimeStampedDataParser *)getInstanceWithId:(id)obj;

- (OrgBouncycastleAsn1DERIA5String *)getDataUri;

- (OrgBouncycastleAsn1CmsMetaData *)getMetaData;

- (id<OrgBouncycastleAsn1ASN1OctetStringParser>)getContent;

- (OrgBouncycastleAsn1CmsEvidence *)getTemporalEvidence;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1CmsTimeStampedDataParser)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1CmsTimeStampedDataParser *OrgBouncycastleAsn1CmsTimeStampedDataParser_getInstanceWithId_(id obj);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1CmsTimeStampedDataParser)

#endif // _OrgBouncycastleAsn1CmsTimeStampedDataParser_H_
