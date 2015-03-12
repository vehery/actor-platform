//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/DERExternalParser.java
//

#ifndef _OrgBouncycastleAsn1DERExternalParser_H_
#define _OrgBouncycastleAsn1DERExternalParser_H_

@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1StreamParser;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/InMemoryRepresentable.h"

@interface OrgBouncycastleAsn1DERExternalParser : NSObject < OrgBouncycastleAsn1ASN1Encodable, OrgBouncycastleAsn1InMemoryRepresentable > {
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1StreamParser:(OrgBouncycastleAsn1ASN1StreamParser *)parser;

- (id<OrgBouncycastleAsn1ASN1Encodable>)readObject;

- (OrgBouncycastleAsn1ASN1Primitive *)getLoadedObject;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1DERExternalParser)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1DERExternalParser)

#endif // _OrgBouncycastleAsn1DERExternalParser_H_
