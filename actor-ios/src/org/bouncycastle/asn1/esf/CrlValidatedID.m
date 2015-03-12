//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/esf/CrlValidatedID.java
//

#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/esf/CrlIdentifier.h"
#include "org/bouncycastle/asn1/esf/CrlValidatedID.h"
#include "org/bouncycastle/asn1/esf/OtherHash.h"

@interface OrgBouncycastleAsn1EsfCrlValidatedID () {
 @public
  OrgBouncycastleAsn1EsfOtherHash *crlHash_;
  OrgBouncycastleAsn1EsfCrlIdentifier *crlIdentifier_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1EsfCrlValidatedID, crlHash_, OrgBouncycastleAsn1EsfOtherHash *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1EsfCrlValidatedID, crlIdentifier_, OrgBouncycastleAsn1EsfCrlIdentifier *)

@implementation OrgBouncycastleAsn1EsfCrlValidatedID

+ (OrgBouncycastleAsn1EsfCrlValidatedID *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1EsfCrlValidatedID_getInstanceWithId_(obj);
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    if ([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) size] < 1 || [seq size] > 2) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:JreStrcat("$I", @"Bad sequence size: ", [seq size])];
    }
    self->crlHash_ = OrgBouncycastleAsn1EsfOtherHash_getInstanceWithId_([seq getObjectAtWithInt:0]);
    if ([seq size] > 1) {
      self->crlIdentifier_ = OrgBouncycastleAsn1EsfCrlIdentifier_getInstanceWithId_([seq getObjectAtWithInt:1]);
    }
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1EsfOtherHash:(OrgBouncycastleAsn1EsfOtherHash *)crlHash {
  return [self initOrgBouncycastleAsn1EsfCrlValidatedIDWithOrgBouncycastleAsn1EsfOtherHash:crlHash withOrgBouncycastleAsn1EsfCrlIdentifier:nil];
}

- (instancetype)initOrgBouncycastleAsn1EsfCrlValidatedIDWithOrgBouncycastleAsn1EsfOtherHash:(OrgBouncycastleAsn1EsfOtherHash *)crlHash
                                                    withOrgBouncycastleAsn1EsfCrlIdentifier:(OrgBouncycastleAsn1EsfCrlIdentifier *)crlIdentifier {
  if (self = [super init]) {
    self->crlHash_ = crlHash;
    self->crlIdentifier_ = crlIdentifier;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1EsfOtherHash:(OrgBouncycastleAsn1EsfOtherHash *)crlHash
                withOrgBouncycastleAsn1EsfCrlIdentifier:(OrgBouncycastleAsn1EsfCrlIdentifier *)crlIdentifier {
  return [self initOrgBouncycastleAsn1EsfCrlValidatedIDWithOrgBouncycastleAsn1EsfOtherHash:crlHash withOrgBouncycastleAsn1EsfCrlIdentifier:crlIdentifier];
}

- (OrgBouncycastleAsn1EsfOtherHash *)getCrlHash {
  return self->crlHash_;
}

- (OrgBouncycastleAsn1EsfCrlIdentifier *)getCrlIdentifier {
  return self->crlIdentifier_;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:[((OrgBouncycastleAsn1EsfOtherHash *) nil_chk(self->crlHash_)) toASN1Primitive]];
  if (nil != self->crlIdentifier_) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[self->crlIdentifier_ toASN1Primitive]];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1EsfCrlValidatedID *)other {
  [super copyAllFieldsTo:other];
  other->crlHash_ = crlHash_;
  other->crlIdentifier_ = crlIdentifier_;
}

@end

OrgBouncycastleAsn1EsfCrlValidatedID *OrgBouncycastleAsn1EsfCrlValidatedID_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1EsfCrlValidatedID_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1EsfCrlValidatedID class]]) {
    return (OrgBouncycastleAsn1EsfCrlValidatedID *) check_class_cast(obj, [OrgBouncycastleAsn1EsfCrlValidatedID class]);
  }
  else if (obj != nil) {
    return [[OrgBouncycastleAsn1EsfCrlValidatedID alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1EsfCrlValidatedID)
