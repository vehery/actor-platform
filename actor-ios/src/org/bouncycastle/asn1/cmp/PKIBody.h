//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/cmp/PKIBody.java
//

#ifndef _OrgBouncycastleAsn1CmpPKIBody_H_
#define _OrgBouncycastleAsn1CmpPKIBody_H_

@class OrgBouncycastleAsn1ASN1Primitive;
@class OrgBouncycastleAsn1ASN1TaggedObject;
@protocol OrgBouncycastleAsn1ASN1Encodable;

#include "J2ObjC_header.h"
#include "org/bouncycastle/asn1/ASN1Choice.h"
#include "org/bouncycastle/asn1/ASN1Object.h"

#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CA_KEY_UPDATE_ANN 15
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CERT_ANN 16
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CERT_CONFIRM 24
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CERT_REP 3
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CERT_REQ 2
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CONFIRM 19
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CRL_ANN 18
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CROSS_CERT_REP 14
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_CROSS_CERT_REQ 13
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_ERROR 23
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_GEN_MSG 21
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_GEN_REP 22
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_INIT_REP 1
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_INIT_REQ 0
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_KEY_RECOVERY_REP 10
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_KEY_RECOVERY_REQ 9
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_KEY_UPDATE_REP 8
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_KEY_UPDATE_REQ 7
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_NESTED 20
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_P10_CERT_REQ 4
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_POLL_REP 26
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_POLL_REQ 25
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_POPO_CHALL 5
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_POPO_REP 6
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_REVOCATION_ANN 17
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_REVOCATION_REP 12
#define OrgBouncycastleAsn1CmpPKIBody_TYPE_REVOCATION_REQ 11

@interface OrgBouncycastleAsn1CmpPKIBody : OrgBouncycastleAsn1ASN1Object < OrgBouncycastleAsn1ASN1Choice > {
}

+ (OrgBouncycastleAsn1CmpPKIBody *)getInstanceWithId:(id)o;

- (instancetype)initWithInt:(jint)type
withOrgBouncycastleAsn1ASN1Encodable:(id<OrgBouncycastleAsn1ASN1Encodable>)content;

- (jint)getType;

- (id<OrgBouncycastleAsn1ASN1Encodable>)getContent;

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleAsn1CmpPKIBody)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT OrgBouncycastleAsn1CmpPKIBody *OrgBouncycastleAsn1CmpPKIBody_getInstanceWithId_(id o);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_INIT_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_INIT_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CERT_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CERT_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_P10_CERT_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_POPO_CHALL, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_POPO_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_KEY_UPDATE_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_KEY_UPDATE_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_KEY_RECOVERY_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_KEY_RECOVERY_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_REVOCATION_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_REVOCATION_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CROSS_CERT_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CROSS_CERT_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CA_KEY_UPDATE_ANN, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CERT_ANN, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_REVOCATION_ANN, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CRL_ANN, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CONFIRM, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_NESTED, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_GEN_MSG, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_GEN_REP, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_ERROR, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_CERT_CONFIRM, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_POLL_REQ, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleAsn1CmpPKIBody, TYPE_POLL_REP, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleAsn1CmpPKIBody)

#endif // _OrgBouncycastleAsn1CmpPKIBody_H_
