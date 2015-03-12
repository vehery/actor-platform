//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/BEROctetString.java
//

#ifndef _OrgBouncycastleAsn1BEROctetString_H_
#define _OrgBouncycastleAsn1BEROctetString_H_

@class IOSByteArray;
@class IOSObjectArray;
@class JavaUtilVector;
@class OrgBouncycastleAsn1ASN1OutputStream;
@class OrgBouncycastleAsn1ASN1Sequence;

#include "J2ObjC_header.h"
#include "java/util/Enumeration.h"
#include "org/bouncycastle/asn1/ASN1OctetString.h"

#define OrgBouncycastleAsn1BEROctetString_MAX_LENGTH 1000

@interface OrgBouncycastleAsn1BEROctetString : OrgBouncycastleAsn1ASN1OctetString {
}

- (instancetype)initWithByteArray:(IOSByteArray *)string;

- (instancetype)initWithOrgBouncycastleAsn1ASN1OctetStringArray:(IOSObjectArray *)octs;

- (IOSByteArray *)getOctets;

- (id<JavaUtilEnumeration>)getObjects;

- (jboolean)isConstructed;

- (jint)encodedLength;

- (void)encodeWithOrgBouncycastleAsn1ASN1OutputStream:(OrgBouncycastleAsn1ASN1OutputStream *)outArg;

+ (OrgBouncycastleAsn1BEROctetString *)fromSequenceWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1BEROctetString)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1BEROctetString *OrgBouncycastleAsn1BEROctetString_fromSequenceWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1BEROctetString, MAX_LENGTH, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1BEROctetString)

@interface OrgBouncycastleAsn1BEROctetString_$1 : NSObject < JavaUtilEnumeration > {
 @public
  jint counter_;
}

- (jboolean)hasMoreElements;

- (id)nextElement;

- (instancetype)initWithOrgBouncycastleAsn1BEROctetString:(OrgBouncycastleAsn1BEROctetString *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1BEROctetString_$1)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1BEROctetString_$1)

#endif // _OrgBouncycastleAsn1BEROctetString_H_
