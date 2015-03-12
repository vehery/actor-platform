//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/x509/qualified/SemanticsInformation.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/util/Enumeration.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1ObjectIdentifier.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/x509/GeneralName.h"
#include "org/bouncycastle/asn1/x509/qualified/SemanticsInformation.h"

@interface OrgBouncycastleAsn1X509QualifiedSemanticsInformation () {
 @public
  OrgBouncycastleAsn1ASN1ObjectIdentifier *semanticsIdentifier_;
  IOSObjectArray *nameRegistrationAuthorities_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509QualifiedSemanticsInformation, semanticsIdentifier_, OrgBouncycastleAsn1ASN1ObjectIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509QualifiedSemanticsInformation, nameRegistrationAuthorities_, IOSObjectArray *)

@implementation OrgBouncycastleAsn1X509QualifiedSemanticsInformation

+ (OrgBouncycastleAsn1X509QualifiedSemanticsInformation *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1X509QualifiedSemanticsInformation_getInstanceWithId_(obj);
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    id<JavaUtilEnumeration> e = [((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjects];
    if ([seq size] < 1) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:@"no objects in SemanticsInformation"];
    }
    id object = [((id<JavaUtilEnumeration>) nil_chk(e)) nextElement];
    if ([object isKindOfClass:[OrgBouncycastleAsn1ASN1ObjectIdentifier class]]) {
      semanticsIdentifier_ = OrgBouncycastleAsn1ASN1ObjectIdentifier_getInstanceWithId_(object);
      if ([e hasMoreElements]) {
        object = [e nextElement];
      }
      else {
        object = nil;
      }
    }
    if (object != nil) {
      OrgBouncycastleAsn1ASN1Sequence *generalNameSeq = OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(object);
      nameRegistrationAuthorities_ = [IOSObjectArray newArrayWithLength:[((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(generalNameSeq)) size] type:OrgBouncycastleAsn1X509GeneralName_class_()];
      for (jint i = 0; i < [generalNameSeq size]; i++) {
        IOSObjectArray_Set(nameRegistrationAuthorities_, i, OrgBouncycastleAsn1X509GeneralName_getInstanceWithId_([generalNameSeq getObjectAtWithInt:i]));
      }
    }
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)semanticsIdentifier
                    withOrgBouncycastleAsn1X509GeneralNameArray:(IOSObjectArray *)generalNames {
  if (self = [super init]) {
    self->semanticsIdentifier_ = semanticsIdentifier;
    self->nameRegistrationAuthorities_ = generalNames;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)semanticsIdentifier {
  if (self = [super init]) {
    self->semanticsIdentifier_ = semanticsIdentifier;
    self->nameRegistrationAuthorities_ = nil;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1X509GeneralNameArray:(IOSObjectArray *)generalNames {
  if (self = [super init]) {
    self->semanticsIdentifier_ = nil;
    self->nameRegistrationAuthorities_ = generalNames;
  }
  return self;
}

- (OrgBouncycastleAsn1ASN1ObjectIdentifier *)getSemanticsIdentifier {
  return semanticsIdentifier_;
}

- (IOSObjectArray *)getNameRegistrationAuthorities {
  return nameRegistrationAuthorities_;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *seq = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  if (self->semanticsIdentifier_ != nil) {
    [seq addWithOrgBouncycastleAsn1ASN1Encodable:semanticsIdentifier_];
  }
  if (self->nameRegistrationAuthorities_ != nil) {
    OrgBouncycastleAsn1ASN1EncodableVector *seqname = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
    for (jint i = 0; i < nameRegistrationAuthorities_->size_; i++) {
      [seqname addWithOrgBouncycastleAsn1ASN1Encodable:IOSObjectArray_Get(nameRegistrationAuthorities_, i)];
    }
    [seq addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:seqname]];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:seq];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1X509QualifiedSemanticsInformation *)other {
  [super copyAllFieldsTo:other];
  other->semanticsIdentifier_ = semanticsIdentifier_;
  other->nameRegistrationAuthorities_ = nameRegistrationAuthorities_;
}

@end

OrgBouncycastleAsn1X509QualifiedSemanticsInformation *OrgBouncycastleAsn1X509QualifiedSemanticsInformation_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1X509QualifiedSemanticsInformation_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1X509QualifiedSemanticsInformation class]]) {
    return (OrgBouncycastleAsn1X509QualifiedSemanticsInformation *) check_class_cast(obj, [OrgBouncycastleAsn1X509QualifiedSemanticsInformation class]);
  }
  if (obj != nil) {
    return [[OrgBouncycastleAsn1X509QualifiedSemanticsInformation alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1X509QualifiedSemanticsInformation)
