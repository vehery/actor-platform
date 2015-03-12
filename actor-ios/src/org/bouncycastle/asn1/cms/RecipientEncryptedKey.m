//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/cms/RecipientEncryptedKey.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1OctetString.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/cms/KeyAgreeRecipientIdentifier.h"
#include "org/bouncycastle/asn1/cms/RecipientEncryptedKey.h"

@interface OrgBouncycastleAsn1CmsRecipientEncryptedKey () {
 @public
  OrgBouncycastleAsn1CmsKeyAgreeRecipientIdentifier *identifier_;
  OrgBouncycastleAsn1ASN1OctetString *encryptedKey_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsRecipientEncryptedKey, identifier_, OrgBouncycastleAsn1CmsKeyAgreeRecipientIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsRecipientEncryptedKey, encryptedKey_, OrgBouncycastleAsn1ASN1OctetString *)

@implementation OrgBouncycastleAsn1CmsRecipientEncryptedKey

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    identifier_ = OrgBouncycastleAsn1CmsKeyAgreeRecipientIdentifier_getInstanceWithId_([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0]);
    encryptedKey_ = (OrgBouncycastleAsn1ASN1OctetString *) check_class_cast([seq getObjectAtWithInt:1], [OrgBouncycastleAsn1ASN1OctetString class]);
  }
  return self;
}

+ (OrgBouncycastleAsn1CmsRecipientEncryptedKey *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                        withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1CmsRecipientEncryptedKey_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}

+ (OrgBouncycastleAsn1CmsRecipientEncryptedKey *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1CmsRecipientEncryptedKey_getInstanceWithId_(obj);
}

- (instancetype)initWithOrgBouncycastleAsn1CmsKeyAgreeRecipientIdentifier:(OrgBouncycastleAsn1CmsKeyAgreeRecipientIdentifier *)id_
                                   withOrgBouncycastleAsn1ASN1OctetString:(OrgBouncycastleAsn1ASN1OctetString *)encryptedKey {
  if (self = [super init]) {
    self->identifier_ = id_;
    self->encryptedKey_ = encryptedKey;
  }
  return self;
}

- (OrgBouncycastleAsn1CmsKeyAgreeRecipientIdentifier *)getIdentifier {
  return identifier_;
}

- (OrgBouncycastleAsn1ASN1OctetString *)getEncryptedKey {
  return encryptedKey_;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:identifier_];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:encryptedKey_];
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1CmsRecipientEncryptedKey *)other {
  [super copyAllFieldsTo:other];
  other->identifier_ = identifier_;
  other->encryptedKey_ = encryptedKey_;
}

@end

OrgBouncycastleAsn1CmsRecipientEncryptedKey *OrgBouncycastleAsn1CmsRecipientEncryptedKey_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1CmsRecipientEncryptedKey_init();
  return OrgBouncycastleAsn1CmsRecipientEncryptedKey_getInstanceWithId_(OrgBouncycastleAsn1ASN1Sequence_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_));
}

OrgBouncycastleAsn1CmsRecipientEncryptedKey *OrgBouncycastleAsn1CmsRecipientEncryptedKey_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1CmsRecipientEncryptedKey_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1CmsRecipientEncryptedKey class]]) {
    return (OrgBouncycastleAsn1CmsRecipientEncryptedKey *) check_class_cast(obj, [OrgBouncycastleAsn1CmsRecipientEncryptedKey class]);
  }
  if (obj != nil) {
    return [[OrgBouncycastleAsn1CmsRecipientEncryptedKey alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1CmsRecipientEncryptedKey)
