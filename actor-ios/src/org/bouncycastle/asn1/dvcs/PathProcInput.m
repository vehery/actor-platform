//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/dvcs/PathProcInput.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Boolean.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/DERTaggedObject.h"
#include "org/bouncycastle/asn1/dvcs/PathProcInput.h"
#include "org/bouncycastle/asn1/x509/PolicyInformation.h"

__attribute__((unused)) static IOSObjectArray *OrgBouncycastleAsn1DvcsPathProcInput_fromSequenceWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq);
__attribute__((unused)) static void OrgBouncycastleAsn1DvcsPathProcInput_setInhibitPolicyMappingWithBoolean_(OrgBouncycastleAsn1DvcsPathProcInput *self, jboolean inhibitPolicyMapping);
__attribute__((unused)) static void OrgBouncycastleAsn1DvcsPathProcInput_setExplicitPolicyReqdWithBoolean_(OrgBouncycastleAsn1DvcsPathProcInput *self, jboolean explicitPolicyReqd);
__attribute__((unused)) static void OrgBouncycastleAsn1DvcsPathProcInput_setInhibitAnyPolicyWithBoolean_(OrgBouncycastleAsn1DvcsPathProcInput *self, jboolean inhibitAnyPolicy);

@interface OrgBouncycastleAsn1DvcsPathProcInput () {
 @public
  IOSObjectArray *acceptablePolicySet_;
  jboolean inhibitPolicyMapping_;
  jboolean explicitPolicyReqd_;
  jboolean inhibitAnyPolicy_;
}

+ (IOSObjectArray *)fromSequenceWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;

- (void)setInhibitPolicyMappingWithBoolean:(jboolean)inhibitPolicyMapping;

- (void)setExplicitPolicyReqdWithBoolean:(jboolean)explicitPolicyReqd;

- (void)setInhibitAnyPolicyWithBoolean:(jboolean)inhibitAnyPolicy;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1DvcsPathProcInput, acceptablePolicySet_, IOSObjectArray *)

@implementation OrgBouncycastleAsn1DvcsPathProcInput

- (instancetype)initWithOrgBouncycastleAsn1X509PolicyInformationArray:(IOSObjectArray *)acceptablePolicySet {
  if (self = [super init]) {
    inhibitPolicyMapping_ = NO;
    explicitPolicyReqd_ = NO;
    inhibitAnyPolicy_ = NO;
    self->acceptablePolicySet_ = acceptablePolicySet;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1X509PolicyInformationArray:(IOSObjectArray *)acceptablePolicySet
                                                          withBoolean:(jboolean)inhibitPolicyMapping
                                                          withBoolean:(jboolean)explicitPolicyReqd
                                                          withBoolean:(jboolean)inhibitAnyPolicy {
  if (self = [super init]) {
    inhibitPolicyMapping_ = NO;
    explicitPolicyReqd_ = NO;
    inhibitAnyPolicy_ = NO;
    self->acceptablePolicySet_ = acceptablePolicySet;
    self->inhibitPolicyMapping_ = inhibitPolicyMapping;
    self->explicitPolicyReqd_ = explicitPolicyReqd;
    self->inhibitAnyPolicy_ = inhibitAnyPolicy;
  }
  return self;
}

+ (IOSObjectArray *)fromSequenceWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  return OrgBouncycastleAsn1DvcsPathProcInput_fromSequenceWithOrgBouncycastleAsn1ASN1Sequence_(seq);
}

+ (OrgBouncycastleAsn1DvcsPathProcInput *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1DvcsPathProcInput_getInstanceWithId_(obj);
}

+ (OrgBouncycastleAsn1DvcsPathProcInput *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                 withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1DvcsPathProcInput_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  OrgBouncycastleAsn1ASN1EncodableVector *pV = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  for (jint i = 0; i != ((IOSObjectArray *) nil_chk(acceptablePolicySet_))->size_; i++) {
    [pV addWithOrgBouncycastleAsn1ASN1Encodable:IOSObjectArray_Get(acceptablePolicySet_, i)];
  }
  [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:pV]];
  if (inhibitPolicyMapping_) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1ASN1Boolean alloc] initWithBoolean:inhibitPolicyMapping_]];
  }
  if (explicitPolicyReqd_) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:NO withInt:0 withOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1ASN1Boolean alloc] initWithBoolean:explicitPolicyReqd_]]];
  }
  if (inhibitAnyPolicy_) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:NO withInt:1 withOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1ASN1Boolean alloc] initWithBoolean:inhibitAnyPolicy_]]];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (NSString *)description {
  return JreStrcat("$@$Z$Z$Z$", @"PathProcInput: {\nacceptablePolicySet: ", acceptablePolicySet_, @"\ninhibitPolicyMapping: ", inhibitPolicyMapping_, @"\nexplicitPolicyReqd: ", explicitPolicyReqd_, @"\ninhibitAnyPolicy: ", inhibitAnyPolicy_, @"\n}\n");
}

- (IOSObjectArray *)getAcceptablePolicySet {
  return acceptablePolicySet_;
}

- (jboolean)isInhibitPolicyMapping {
  return inhibitPolicyMapping_;
}

- (void)setInhibitPolicyMappingWithBoolean:(jboolean)inhibitPolicyMapping {
  OrgBouncycastleAsn1DvcsPathProcInput_setInhibitPolicyMappingWithBoolean_(self, inhibitPolicyMapping);
}

- (jboolean)isExplicitPolicyReqd {
  return explicitPolicyReqd_;
}

- (void)setExplicitPolicyReqdWithBoolean:(jboolean)explicitPolicyReqd {
  OrgBouncycastleAsn1DvcsPathProcInput_setExplicitPolicyReqdWithBoolean_(self, explicitPolicyReqd);
}

- (jboolean)isInhibitAnyPolicy {
  return inhibitAnyPolicy_;
}

- (void)setInhibitAnyPolicyWithBoolean:(jboolean)inhibitAnyPolicy {
  OrgBouncycastleAsn1DvcsPathProcInput_setInhibitAnyPolicyWithBoolean_(self, inhibitAnyPolicy);
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1DvcsPathProcInput *)other {
  [super copyAllFieldsTo:other];
  other->acceptablePolicySet_ = acceptablePolicySet_;
  other->inhibitPolicyMapping_ = inhibitPolicyMapping_;
  other->explicitPolicyReqd_ = explicitPolicyReqd_;
  other->inhibitAnyPolicy_ = inhibitAnyPolicy_;
}

@end

IOSObjectArray *OrgBouncycastleAsn1DvcsPathProcInput_fromSequenceWithOrgBouncycastleAsn1ASN1Sequence_(OrgBouncycastleAsn1ASN1Sequence *seq) {
  OrgBouncycastleAsn1DvcsPathProcInput_init();
  IOSObjectArray *tmp = [IOSObjectArray newArrayWithLength:[((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) size] type:OrgBouncycastleAsn1X509PolicyInformation_class_()];
  for (jint i = 0; i != tmp->size_; i++) {
    IOSObjectArray_Set(tmp, i, OrgBouncycastleAsn1X509PolicyInformation_getInstanceWithId_([seq getObjectAtWithInt:i]));
  }
  return tmp;
}

OrgBouncycastleAsn1DvcsPathProcInput *OrgBouncycastleAsn1DvcsPathProcInput_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1DvcsPathProcInput_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1DvcsPathProcInput class]]) {
    return (OrgBouncycastleAsn1DvcsPathProcInput *) check_class_cast(obj, [OrgBouncycastleAsn1DvcsPathProcInput class]);
  }
  else if (obj != nil) {
    OrgBouncycastleAsn1ASN1Sequence *seq = OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj);
    OrgBouncycastleAsn1ASN1Sequence *policies = OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0]);
    OrgBouncycastleAsn1DvcsPathProcInput *result = [[OrgBouncycastleAsn1DvcsPathProcInput alloc] initWithOrgBouncycastleAsn1X509PolicyInformationArray:OrgBouncycastleAsn1DvcsPathProcInput_fromSequenceWithOrgBouncycastleAsn1ASN1Sequence_(policies)];
    for (jint i = 1; i < [seq size]; i++) {
      id o = [seq getObjectAtWithInt:i];
      if ([o isKindOfClass:[OrgBouncycastleAsn1ASN1Boolean class]]) {
        OrgBouncycastleAsn1ASN1Boolean *x = OrgBouncycastleAsn1ASN1Boolean_getInstanceWithId_(o);
        OrgBouncycastleAsn1DvcsPathProcInput_setInhibitPolicyMappingWithBoolean_(result, [((OrgBouncycastleAsn1ASN1Boolean *) nil_chk(x)) isTrue]);
      }
      else if ([o isKindOfClass:[OrgBouncycastleAsn1ASN1TaggedObject class]]) {
        OrgBouncycastleAsn1ASN1TaggedObject *t = OrgBouncycastleAsn1ASN1TaggedObject_getInstanceWithId_(o);
        OrgBouncycastleAsn1ASN1Boolean *x;
        switch ([((OrgBouncycastleAsn1ASN1TaggedObject *) nil_chk(t)) getTagNo]) {
          case 0:
          x = OrgBouncycastleAsn1ASN1Boolean_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(t, NO);
          OrgBouncycastleAsn1DvcsPathProcInput_setExplicitPolicyReqdWithBoolean_(result, [((OrgBouncycastleAsn1ASN1Boolean *) nil_chk(x)) isTrue]);
          break;
          case 1:
          x = OrgBouncycastleAsn1ASN1Boolean_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(t, NO);
          OrgBouncycastleAsn1DvcsPathProcInput_setInhibitAnyPolicyWithBoolean_(result, [((OrgBouncycastleAsn1ASN1Boolean *) nil_chk(x)) isTrue]);
        }
      }
    }
    return result;
  }
  return nil;
}

OrgBouncycastleAsn1DvcsPathProcInput *OrgBouncycastleAsn1DvcsPathProcInput_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1DvcsPathProcInput_init();
  return OrgBouncycastleAsn1DvcsPathProcInput_getInstanceWithId_(OrgBouncycastleAsn1ASN1Sequence_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_));
}

void OrgBouncycastleAsn1DvcsPathProcInput_setInhibitPolicyMappingWithBoolean_(OrgBouncycastleAsn1DvcsPathProcInput *self, jboolean inhibitPolicyMapping) {
  self->inhibitPolicyMapping_ = inhibitPolicyMapping;
}

void OrgBouncycastleAsn1DvcsPathProcInput_setExplicitPolicyReqdWithBoolean_(OrgBouncycastleAsn1DvcsPathProcInput *self, jboolean explicitPolicyReqd) {
  self->explicitPolicyReqd_ = explicitPolicyReqd;
}

void OrgBouncycastleAsn1DvcsPathProcInput_setInhibitAnyPolicyWithBoolean_(OrgBouncycastleAsn1DvcsPathProcInput *self, jboolean inhibitAnyPolicy) {
  self->inhibitAnyPolicy_ = inhibitAnyPolicy;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1DvcsPathProcInput)
