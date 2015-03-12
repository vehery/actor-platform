//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/mozilla/PublicKeyAndChallenge.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DERIA5String.h"
#include "org/bouncycastle/asn1/mozilla/PublicKeyAndChallenge.h"
#include "org/bouncycastle/asn1/x509/SubjectPublicKeyInfo.h"

@interface OrgBouncycastleAsn1MozillaPublicKeyAndChallenge () {
 @public
  OrgBouncycastleAsn1ASN1Sequence *pkacSeq_;
  OrgBouncycastleAsn1X509SubjectPublicKeyInfo *spki_;
  OrgBouncycastleAsn1DERIA5String *challenge_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1MozillaPublicKeyAndChallenge, pkacSeq_, OrgBouncycastleAsn1ASN1Sequence *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1MozillaPublicKeyAndChallenge, spki_, OrgBouncycastleAsn1X509SubjectPublicKeyInfo *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1MozillaPublicKeyAndChallenge, challenge_, OrgBouncycastleAsn1DERIA5String *)

@implementation OrgBouncycastleAsn1MozillaPublicKeyAndChallenge

+ (OrgBouncycastleAsn1MozillaPublicKeyAndChallenge *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1MozillaPublicKeyAndChallenge_getInstanceWithId_(obj);
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    pkacSeq_ = seq;
    spki_ = OrgBouncycastleAsn1X509SubjectPublicKeyInfo_getInstanceWithId_([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0]);
    challenge_ = OrgBouncycastleAsn1DERIA5String_getInstanceWithId_([seq getObjectAtWithInt:1]);
  }
  return self;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  return pkacSeq_;
}

- (OrgBouncycastleAsn1X509SubjectPublicKeyInfo *)getSubjectPublicKeyInfo {
  return spki_;
}

- (OrgBouncycastleAsn1DERIA5String *)getChallenge {
  return challenge_;
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1MozillaPublicKeyAndChallenge *)other {
  [super copyAllFieldsTo:other];
  other->pkacSeq_ = pkacSeq_;
  other->spki_ = spki_;
  other->challenge_ = challenge_;
}

@end

OrgBouncycastleAsn1MozillaPublicKeyAndChallenge *OrgBouncycastleAsn1MozillaPublicKeyAndChallenge_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1MozillaPublicKeyAndChallenge_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1MozillaPublicKeyAndChallenge class]]) {
    return (OrgBouncycastleAsn1MozillaPublicKeyAndChallenge *) check_class_cast(obj, [OrgBouncycastleAsn1MozillaPublicKeyAndChallenge class]);
  }
  else if (obj != nil) {
    return [[OrgBouncycastleAsn1MozillaPublicKeyAndChallenge alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1MozillaPublicKeyAndChallenge)
