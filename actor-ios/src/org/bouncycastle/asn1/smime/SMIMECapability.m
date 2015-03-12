//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/smime/SMIMECapability.java
//

#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1ObjectIdentifier.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/nist/NISTObjectIdentifiers.h"
#include "org/bouncycastle/asn1/pkcs/PKCSObjectIdentifiers.h"
#include "org/bouncycastle/asn1/smime/SMIMECapability.h"

@interface OrgBouncycastleAsn1SmimeSMIMECapability () {
 @public
  OrgBouncycastleAsn1ASN1ObjectIdentifier *capabilityID_;
  id<OrgBouncycastleAsn1ASN1Encodable> parameters_;
}
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1SmimeSMIMECapability, capabilityID_, OrgBouncycastleAsn1ASN1ObjectIdentifier *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1SmimeSMIMECapability, parameters_, id<OrgBouncycastleAsn1ASN1Encodable>)

BOOL OrgBouncycastleAsn1SmimeSMIMECapability_initialized = NO;

@implementation OrgBouncycastleAsn1SmimeSMIMECapability

OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_preferSignedData_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_canNotDecryptAny_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_sMIMECapabilitiesVersions_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_dES_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_dES_EDE3_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_rC2_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_aES128_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_aES192_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1SmimeSMIMECapability_aES256_CBC_;

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    capabilityID_ = (OrgBouncycastleAsn1ASN1ObjectIdentifier *) check_class_cast([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0], [OrgBouncycastleAsn1ASN1ObjectIdentifier class]);
    if ([seq size] > 1) {
      parameters_ = (OrgBouncycastleAsn1ASN1Primitive *) check_class_cast([seq getObjectAtWithInt:1], [OrgBouncycastleAsn1ASN1Primitive class]);
    }
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1ObjectIdentifier:(OrgBouncycastleAsn1ASN1ObjectIdentifier *)capabilityID
                           withOrgBouncycastleAsn1ASN1Encodable:(id<OrgBouncycastleAsn1ASN1Encodable>)parameters {
  if (self = [super init]) {
    self->capabilityID_ = capabilityID;
    self->parameters_ = parameters;
  }
  return self;
}

+ (OrgBouncycastleAsn1SmimeSMIMECapability *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1SmimeSMIMECapability_getInstanceWithId_(obj);
}

- (OrgBouncycastleAsn1ASN1ObjectIdentifier *)getCapabilityID {
  return capabilityID_;
}

- (id<OrgBouncycastleAsn1ASN1Encodable>)getParameters {
  return parameters_;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:capabilityID_];
  if (parameters_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:parameters_];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1SmimeSMIMECapability *)other {
  [super copyAllFieldsTo:other];
  other->capabilityID_ = capabilityID_;
  other->parameters_ = parameters_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleAsn1SmimeSMIMECapability class]) {
    OrgBouncycastleAsn1SmimeSMIMECapability_preferSignedData_ = OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers_get_preferSignedData_();
    OrgBouncycastleAsn1SmimeSMIMECapability_canNotDecryptAny_ = OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers_get_canNotDecryptAny_();
    OrgBouncycastleAsn1SmimeSMIMECapability_sMIMECapabilitiesVersions_ = OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers_get_sMIMECapabilitiesVersions_();
    OrgBouncycastleAsn1SmimeSMIMECapability_dES_CBC_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"1.3.14.3.2.7"];
    OrgBouncycastleAsn1SmimeSMIMECapability_dES_EDE3_CBC_ = OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers_get_des_EDE3_CBC_();
    OrgBouncycastleAsn1SmimeSMIMECapability_rC2_CBC_ = OrgBouncycastleAsn1PkcsPKCSObjectIdentifiers_get_RC2_CBC_();
    OrgBouncycastleAsn1SmimeSMIMECapability_aES128_CBC_ = OrgBouncycastleAsn1NistNISTObjectIdentifiers_get_id_aes128_CBC_();
    OrgBouncycastleAsn1SmimeSMIMECapability_aES192_CBC_ = OrgBouncycastleAsn1NistNISTObjectIdentifiers_get_id_aes192_CBC_();
    OrgBouncycastleAsn1SmimeSMIMECapability_aES256_CBC_ = OrgBouncycastleAsn1NistNISTObjectIdentifiers_get_id_aes256_CBC_();
    J2OBJC_SET_INITIALIZED(OrgBouncycastleAsn1SmimeSMIMECapability)
  }
}

@end

OrgBouncycastleAsn1SmimeSMIMECapability *OrgBouncycastleAsn1SmimeSMIMECapability_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1SmimeSMIMECapability_init();
  if (obj == nil || [obj isKindOfClass:[OrgBouncycastleAsn1SmimeSMIMECapability class]]) {
    return (OrgBouncycastleAsn1SmimeSMIMECapability *) check_class_cast(obj, [OrgBouncycastleAsn1SmimeSMIMECapability class]);
  }
  if ([obj isKindOfClass:[OrgBouncycastleAsn1ASN1Sequence class]]) {
    return [[OrgBouncycastleAsn1SmimeSMIMECapability alloc] initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *) check_class_cast(obj, [OrgBouncycastleAsn1ASN1Sequence class])];
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:@"Invalid SMIMECapability"];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1SmimeSMIMECapability)
