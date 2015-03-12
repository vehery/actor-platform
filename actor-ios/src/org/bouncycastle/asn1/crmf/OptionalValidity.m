//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/crmf/OptionalValidity.java
//

#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/util/Enumeration.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/DERTaggedObject.h"
#include "org/bouncycastle/asn1/crmf/OptionalValidity.h"
#include "org/bouncycastle/asn1/x509/Time.h"

@interface OrgBouncycastleAsn1CrmfOptionalValidity () {
 @public
  OrgBouncycastleAsn1X509Time *notBefore_;
  OrgBouncycastleAsn1X509Time *notAfter_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CrmfOptionalValidity, notBefore_, OrgBouncycastleAsn1X509Time *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CrmfOptionalValidity, notAfter_, OrgBouncycastleAsn1X509Time *)

@implementation OrgBouncycastleAsn1CrmfOptionalValidity

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    id<JavaUtilEnumeration> en = [((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjects];
    while ([((id<JavaUtilEnumeration>) nil_chk(en)) hasMoreElements]) {
      OrgBouncycastleAsn1ASN1TaggedObject *tObj = (OrgBouncycastleAsn1ASN1TaggedObject *) check_class_cast([en nextElement], [OrgBouncycastleAsn1ASN1TaggedObject class]);
      if ([((OrgBouncycastleAsn1ASN1TaggedObject *) nil_chk(tObj)) getTagNo] == 0) {
        notBefore_ = OrgBouncycastleAsn1X509Time_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(tObj, YES);
      }
      else {
        notAfter_ = OrgBouncycastleAsn1X509Time_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(tObj, YES);
      }
    }
  }
  return self;
}

+ (OrgBouncycastleAsn1CrmfOptionalValidity *)getInstanceWithId:(id)o {
  return OrgBouncycastleAsn1CrmfOptionalValidity_getInstanceWithId_(o);
}

- (instancetype)initWithOrgBouncycastleAsn1X509Time:(OrgBouncycastleAsn1X509Time *)notBefore
                    withOrgBouncycastleAsn1X509Time:(OrgBouncycastleAsn1X509Time *)notAfter {
  if (self = [super init]) {
    if (notBefore == nil && notAfter == nil) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:@"at least one of notBefore/notAfter must not be null."];
    }
    self->notBefore_ = notBefore;
    self->notAfter_ = notAfter;
  }
  return self;
}

- (OrgBouncycastleAsn1X509Time *)getNotBefore {
  return notBefore_;
}

- (OrgBouncycastleAsn1X509Time *)getNotAfter {
  return notAfter_;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  if (notBefore_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:YES withInt:0 withOrgBouncycastleAsn1ASN1Encodable:notBefore_]];
  }
  if (notAfter_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:YES withInt:1 withOrgBouncycastleAsn1ASN1Encodable:notAfter_]];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1CrmfOptionalValidity *)other {
  [super copyAllFieldsTo:other];
  other->notBefore_ = notBefore_;
  other->notAfter_ = notAfter_;
}

@end

OrgBouncycastleAsn1CrmfOptionalValidity *OrgBouncycastleAsn1CrmfOptionalValidity_getInstanceWithId_(id o) {
  OrgBouncycastleAsn1CrmfOptionalValidity_init();
  if ([o isKindOfClass:[OrgBouncycastleAsn1CrmfOptionalValidity class]]) {
    return (OrgBouncycastleAsn1CrmfOptionalValidity *) check_class_cast(o, [OrgBouncycastleAsn1CrmfOptionalValidity class]);
  }
  if (o != nil) {
    return [[OrgBouncycastleAsn1CrmfOptionalValidity alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(o)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1CrmfOptionalValidity)
