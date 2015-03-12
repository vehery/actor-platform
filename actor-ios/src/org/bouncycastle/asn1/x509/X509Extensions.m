//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/x509/X509Extensions.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/util/Enumeration.h"
#include "java/util/Hashtable.h"
#include "java/util/Vector.h"
#include "org/bouncycastle/asn1/ASN1Boolean.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1ObjectIdentifier.h"
#include "org/bouncycastle/asn1/ASN1OctetString.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/x509/Extensions.h"
#include "org/bouncycastle/asn1/x509/X509Extension.h"
#include "org/bouncycastle/asn1/x509/X509Extensions.h"

__attribute__((unused)) static IOSObjectArray *OrgBouncycastleAsn1X509X509Extensions_getExtensionOIDsWithBoolean_(OrgBouncycastleAsn1X509X509Extensions *self, jboolean isCritical);
__attribute__((unused)) static IOSObjectArray *OrgBouncycastleAsn1X509X509Extensions_toOidArrayWithJavaUtilVector_(OrgBouncycastleAsn1X509X509Extensions *self, JavaUtilVector *oidVec);

@interface OrgBouncycastleAsn1X509X509Extensions () {
 @public
  JavaUtilHashtable *extensions_;
  JavaUtilVector *ordering_;
}

- (IOSObjectArray *)getExtensionOIDsWithBoolean:(jboolean)isCritical;

- (IOSObjectArray *)toOidArrayWithJavaUtilVector:(JavaUtilVector *)oidVec;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509X509Extensions, extensions_, JavaUtilHashtable *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1X509X509Extensions, ordering_, JavaUtilVector *)

BOOL OrgBouncycastleAsn1X509X509Extensions_initialized = NO;

@implementation OrgBouncycastleAsn1X509X509Extensions

OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_SubjectDirectoryAttributes_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_SubjectKeyIdentifier_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_KeyUsage_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_PrivateKeyUsagePeriod_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_SubjectAlternativeName_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_IssuerAlternativeName_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_BasicConstraints_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_CRLNumber_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_ReasonCode_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_InstructionCode_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_InvalidityDate_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_DeltaCRLIndicator_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_IssuingDistributionPoint_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_CertificateIssuer_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_NameConstraints_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_CRLDistributionPoints_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_CertificatePolicies_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_PolicyMappings_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_AuthorityKeyIdentifier_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_PolicyConstraints_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_ExtendedKeyUsage_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_FreshestCRL_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_InhibitAnyPolicy_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_AuthorityInfoAccess_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_SubjectInfoAccess_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_LogoType_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_BiometricInfo_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_QCStatements_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_AuditIdentity_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_NoRevAvail_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1X509X509Extensions_TargetInformation_;

+ (OrgBouncycastleAsn1X509X509Extensions *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                  withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1X509X509Extensions_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}

+ (OrgBouncycastleAsn1X509X509Extensions *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1X509X509Extensions_getInstanceWithId_(obj);
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    extensions_ = [[JavaUtilHashtable alloc] init];
    ordering_ = [[JavaUtilVector alloc] init];
    id<JavaUtilEnumeration> e = [((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjects];
    while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
      OrgBouncycastleAsn1ASN1Sequence *s = OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_([e nextElement]);
      if ([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(s)) size] == 3) {
        (void) [extensions_ putWithId:[s getObjectAtWithInt:0] withId:[[OrgBouncycastleAsn1X509X509Extension alloc] initWithOrgBouncycastleAsn1ASN1Boolean:OrgBouncycastleAsn1ASN1Boolean_getInstanceWithId_([s getObjectAtWithInt:1]) withOrgBouncycastleAsn1ASN1OctetString:OrgBouncycastleAsn1ASN1OctetString_getInstanceWithId_([s getObjectAtWithInt:2])]];
      }
      else if ([s size] == 2) {
        (void) [extensions_ putWithId:[s getObjectAtWithInt:0] withId:[[OrgBouncycastleAsn1X509X509Extension alloc] initWithBoolean:NO withOrgBouncycastleAsn1ASN1OctetString:OrgBouncycastleAsn1ASN1OctetString_getInstanceWithId_([s getObjectAtWithInt:1])]];
      }
      else {
        @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:JreStrcat("$I", @"Bad sequence size: ", [s size])];
      }
      [ordering_ addElementWithId:[s getObjectAtWithInt:0]];
    }
  }
  return self;
}

- (instancetype)initWithJavaUtilHashtable:(JavaUtilHashtable *)extensions {
  return [self initOrgBouncycastleAsn1X509X509ExtensionsWithJavaUtilVector:nil withJavaUtilHashtable:extensions];
}

- (instancetype)initOrgBouncycastleAsn1X509X509ExtensionsWithJavaUtilVector:(JavaUtilVector *)ordering
                                                      withJavaUtilHashtable:(JavaUtilHashtable *)extensions {
  if (self = [super init]) {
    extensions_ = [[JavaUtilHashtable alloc] init];
    ordering_ = [[JavaUtilVector alloc] init];
    id<JavaUtilEnumeration> e;
    if (ordering == nil) {
      e = [((JavaUtilHashtable *) nil_chk(extensions)) keys];
    }
    else {
      e = [ordering elements];
    }
    while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
      [self->ordering_ addElementWithId:OrgBouncycastleAsn1ASN1ObjectIdentifier_getInstanceWithId_([e nextElement])];
    }
    e = [self->ordering_ elements];
    while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
      OrgBouncycastleAsn1ASN1ObjectIdentifier *oid = OrgBouncycastleAsn1ASN1ObjectIdentifier_getInstanceWithId_([e nextElement]);
      OrgBouncycastleAsn1X509X509Extension *ext = (OrgBouncycastleAsn1X509X509Extension *) check_class_cast([((JavaUtilHashtable *) nil_chk(extensions)) getWithId:oid], [OrgBouncycastleAsn1X509X509Extension class]);
      (void) [self->extensions_ putWithId:oid withId:ext];
    }
  }
  return self;
}

- (instancetype)initWithJavaUtilVector:(JavaUtilVector *)ordering
                 withJavaUtilHashtable:(JavaUtilHashtable *)extensions {
  return [self initOrgBouncycastleAsn1X509X509ExtensionsWithJavaUtilVector:ordering withJavaUtilHashtable:extensions];
}

- (instancetype)initWithJavaUtilVector:(JavaUtilVector *)objectIDs
                    withJavaUtilVector:(JavaUtilVector *)values {
  if (self = [super init]) {
    extensions_ = [[JavaUtilHashtable alloc] init];
    ordering_ = [[JavaUtilVector alloc] init];
    id<JavaUtilEnumeration> e = [((JavaUtilVector *) nil_chk(objectIDs)) elements];
    while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
      [self->ordering_ addElementWithId:[e nextElement]];
    }
    jint count = 0;
    e = [self->ordering_ elements];
    while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
      OrgBouncycastleAsn1ASN1ObjectIdentifier *oid = (OrgBouncycastleAsn1ASN1ObjectIdentifier *) check_class_cast([e nextElement], [OrgBouncycastleAsn1ASN1ObjectIdentifier class]);
      OrgBouncycastleAsn1X509X509Extension *ext = (OrgBouncycastleAsn1X509X509Extension *) check_class_cast([((JavaUtilVector *) nil_chk(values)) elementAtWithInt:count], [OrgBouncycastleAsn1X509X509Extension class]);
      (void) [self->extensions_ putWithId:oid withId:ext];
      count++;
    }
  }
  return self;
}

- (id<JavaUtilEnumeration>)oids {
  return [((JavaUtilVector *) nil_chk(ordering_)) elements];
}

- (OrgBouncycastleAsn1X509X509Extension *)getExtensionWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)oid {
  return (OrgBouncycastleAsn1X509X509Extension *) check_class_cast([((JavaUtilHashtable *) nil_chk(extensions_)) getWithId:oid], [OrgBouncycastleAsn1X509X509Extension class]);
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *vec = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  id<JavaUtilEnumeration> e = [((JavaUtilVector *) nil_chk(ordering_)) elements];
  while ([((id<JavaUtilEnumeration>) nil_chk(e)) hasMoreElements]) {
    OrgBouncycastleAsn1ASN1ObjectIdentifier *oid = (OrgBouncycastleAsn1ASN1ObjectIdentifier *) check_class_cast([e nextElement], [OrgBouncycastleAsn1ASN1ObjectIdentifier class]);
    OrgBouncycastleAsn1X509X509Extension *ext = (OrgBouncycastleAsn1X509X509Extension *) check_class_cast([((JavaUtilHashtable *) nil_chk(extensions_)) getWithId:oid], [OrgBouncycastleAsn1X509X509Extension class]);
    OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
    [v addWithOrgBouncycastleAsn1ASN1Encodable:oid];
    if ([((OrgBouncycastleAsn1X509X509Extension *) nil_chk(ext)) isCritical]) {
      [v addWithOrgBouncycastleAsn1ASN1Encodable:OrgBouncycastleAsn1ASN1Boolean_get_TRUE__()];
    }
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[ext getValue]];
    [vec addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v]];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:vec];
}

- (jboolean)equivalentWithOrgBouncycastleAsn1X509X509Extensions:(OrgBouncycastleAsn1X509X509Extensions *)other {
  if ([((JavaUtilHashtable *) nil_chk(extensions_)) size] != [((OrgBouncycastleAsn1X509X509Extensions *) nil_chk(other))->extensions_ size]) {
    return NO;
  }
  id<JavaUtilEnumeration> e1 = [extensions_ keys];
  while ([((id<JavaUtilEnumeration>) nil_chk(e1)) hasMoreElements]) {
    id key = [e1 nextElement];
    if (![nil_chk([extensions_ getWithId:key]) isEqual:[other->extensions_ getWithId:key]]) {
      return NO;
    }
  }
  return YES;
}

- (IOSObjectArray *)getExtensionOIDs {
  return OrgBouncycastleAsn1X509X509Extensions_toOidArrayWithJavaUtilVector_(self, ordering_);
}

- (IOSObjectArray *)getNonCriticalExtensionOIDs {
  return OrgBouncycastleAsn1X509X509Extensions_getExtensionOIDsWithBoolean_(self, NO);
}

- (IOSObjectArray *)getCriticalExtensionOIDs {
  return OrgBouncycastleAsn1X509X509Extensions_getExtensionOIDsWithBoolean_(self, YES);
}

- (IOSObjectArray *)getExtensionOIDsWithBoolean:(jboolean)isCritical {
  return OrgBouncycastleAsn1X509X509Extensions_getExtensionOIDsWithBoolean_(self, isCritical);
}

- (IOSObjectArray *)toOidArrayWithJavaUtilVector:(JavaUtilVector *)oidVec {
  return OrgBouncycastleAsn1X509X509Extensions_toOidArrayWithJavaUtilVector_(self, oidVec);
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1X509X509Extensions *)other {
  [super copyAllFieldsTo:other];
  other->extensions_ = extensions_;
  other->ordering_ = ordering_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleAsn1X509X509Extensions class]) {
    OrgBouncycastleAsn1X509X509Extensions_SubjectDirectoryAttributes_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.9"];
    OrgBouncycastleAsn1X509X509Extensions_SubjectKeyIdentifier_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.14"];
    OrgBouncycastleAsn1X509X509Extensions_KeyUsage_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.15"];
    OrgBouncycastleAsn1X509X509Extensions_PrivateKeyUsagePeriod_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.16"];
    OrgBouncycastleAsn1X509X509Extensions_SubjectAlternativeName_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.17"];
    OrgBouncycastleAsn1X509X509Extensions_IssuerAlternativeName_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.18"];
    OrgBouncycastleAsn1X509X509Extensions_BasicConstraints_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.19"];
    OrgBouncycastleAsn1X509X509Extensions_CRLNumber_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.20"];
    OrgBouncycastleAsn1X509X509Extensions_ReasonCode_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.21"];
    OrgBouncycastleAsn1X509X509Extensions_InstructionCode_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.23"];
    OrgBouncycastleAsn1X509X509Extensions_InvalidityDate_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.24"];
    OrgBouncycastleAsn1X509X509Extensions_DeltaCRLIndicator_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.27"];
    OrgBouncycastleAsn1X509X509Extensions_IssuingDistributionPoint_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.28"];
    OrgBouncycastleAsn1X509X509Extensions_CertificateIssuer_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.29"];
    OrgBouncycastleAsn1X509X509Extensions_NameConstraints_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.30"];
    OrgBouncycastleAsn1X509X509Extensions_CRLDistributionPoints_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.31"];
    OrgBouncycastleAsn1X509X509Extensions_CertificatePolicies_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.32"];
    OrgBouncycastleAsn1X509X509Extensions_PolicyMappings_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.33"];
    OrgBouncycastleAsn1X509X509Extensions_AuthorityKeyIdentifier_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.35"];
    OrgBouncycastleAsn1X509X509Extensions_PolicyConstraints_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.36"];
    OrgBouncycastleAsn1X509X509Extensions_ExtendedKeyUsage_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.37"];
    OrgBouncycastleAsn1X509X509Extensions_FreshestCRL_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.46"];
    OrgBouncycastleAsn1X509X509Extensions_InhibitAnyPolicy_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.54"];
    OrgBouncycastleAsn1X509X509Extensions_AuthorityInfoAccess_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.6.1.5.5.7.1.1"];
    OrgBouncycastleAsn1X509X509Extensions_SubjectInfoAccess_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.6.1.5.5.7.1.11"];
    OrgBouncycastleAsn1X509X509Extensions_LogoType_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.6.1.5.5.7.1.12"];
    OrgBouncycastleAsn1X509X509Extensions_BiometricInfo_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.6.1.5.5.7.1.2"];
    OrgBouncycastleAsn1X509X509Extensions_QCStatements_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.6.1.5.5.7.1.3"];
    OrgBouncycastleAsn1X509X509Extensions_AuditIdentity_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.6.1.5.5.7.1.4"];
    OrgBouncycastleAsn1X509X509Extensions_NoRevAvail_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.56"];
    OrgBouncycastleAsn1X509X509Extensions_TargetInformation_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.5.29.55"];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleAsn1X509X509Extensions)
  }
}

@end

OrgBouncycastleAsn1X509X509Extensions *OrgBouncycastleAsn1X509X509Extensions_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1X509X509Extensions_init();
  return OrgBouncycastleAsn1X509X509Extensions_getInstanceWithId_(OrgBouncycastleAsn1ASN1Sequence_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_));
}

OrgBouncycastleAsn1X509X509Extensions *OrgBouncycastleAsn1X509X509Extensions_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1X509X509Extensions_init();
  if (obj == nil || [obj isKindOfClass:[OrgBouncycastleAsn1X509X509Extensions class]]) {
    return (OrgBouncycastleAsn1X509X509Extensions *) check_class_cast(obj, [OrgBouncycastleAsn1X509X509Extensions class]);
  }
  if ([obj isKindOfClass:[OrgBouncycastleAsn1ASN1Sequence class]]) {
    return [[OrgBouncycastleAsn1X509X509Extensions alloc] initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *) check_class_cast(obj, [OrgBouncycastleAsn1ASN1Sequence class])];
  }
  if ([obj isKindOfClass:[OrgBouncycastleAsn1X509Extensions class]]) {
    return [[OrgBouncycastleAsn1X509X509Extensions alloc] initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *) check_class_cast([((OrgBouncycastleAsn1X509Extensions *) nil_chk(((OrgBouncycastleAsn1X509Extensions *) check_class_cast(obj, [OrgBouncycastleAsn1X509Extensions class])))) toASN1Primitive], [OrgBouncycastleAsn1ASN1Sequence class])];
  }
  if ([obj isKindOfClass:[OrgBouncycastleAsn1ASN1TaggedObject class]]) {
    return OrgBouncycastleAsn1X509X509Extensions_getInstanceWithId_([((OrgBouncycastleAsn1ASN1TaggedObject *) nil_chk(((OrgBouncycastleAsn1ASN1TaggedObject *) check_class_cast(obj, [OrgBouncycastleAsn1ASN1TaggedObject class])))) getObject]);
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:JreStrcat("$$", @"illegal object in getInstance: ", [[nil_chk(obj) getClass] getName])];
}

IOSObjectArray *OrgBouncycastleAsn1X509X509Extensions_getExtensionOIDsWithBoolean_(OrgBouncycastleAsn1X509X509Extensions *self, jboolean isCritical) {
  JavaUtilVector *oidVec = [[JavaUtilVector alloc] init];
  for (jint i = 0; i != [((JavaUtilVector *) nil_chk(self->ordering_)) size]; i++) {
    id oid = [self->ordering_ elementAtWithInt:i];
    if ([((OrgBouncycastleAsn1X509X509Extension *) nil_chk(((OrgBouncycastleAsn1X509X509Extension *) check_class_cast([((JavaUtilHashtable *) nil_chk(self->extensions_)) getWithId:oid], [OrgBouncycastleAsn1X509X509Extension class])))) isCritical] == isCritical) {
      [oidVec addElementWithId:oid];
    }
  }
  return OrgBouncycastleAsn1X509X509Extensions_toOidArrayWithJavaUtilVector_(self, oidVec);
}

IOSObjectArray *OrgBouncycastleAsn1X509X509Extensions_toOidArrayWithJavaUtilVector_(OrgBouncycastleAsn1X509X509Extensions *self, JavaUtilVector *oidVec) {
  IOSObjectArray *oids = [IOSObjectArray newArrayWithLength:[((JavaUtilVector *) nil_chk(oidVec)) size] type:OrgBouncycastleAsn1ASN1ObjectIdentifier_class_()];
  for (jint i = 0; i != oids->size_; i++) {
    IOSObjectArray_Set(oids, i, (OrgBouncycastleAsn1ASN1ObjectIdentifier *) check_class_cast([oidVec elementAtWithInt:i], [OrgBouncycastleAsn1ASN1ObjectIdentifier class]));
  }
  return oids;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1X509X509Extensions)
