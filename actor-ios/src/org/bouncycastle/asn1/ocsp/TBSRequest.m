//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/ocsp/TBSRequest.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Integer.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/DERTaggedObject.h"
#include "org/bouncycastle/asn1/ocsp/TBSRequest.h"
#include "org/bouncycastle/asn1/x509/Extensions.h"
#include "org/bouncycastle/asn1/x509/GeneralName.h"
#include "org/bouncycastle/asn1/x509/X509Extensions.h"

@interface OrgBouncycastleAsn1OcspTBSRequest () {
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

BOOL OrgBouncycastleAsn1OcspTBSRequest_initialized = NO;

@implementation OrgBouncycastleAsn1OcspTBSRequest

OrgBouncycastleAsn1ASN1Integer * OrgBouncycastleAsn1OcspTBSRequest_V1_;

- (instancetype)initWithOrgBouncycastleAsn1X509GeneralName:(OrgBouncycastleAsn1X509GeneralName *)requestorName
                       withOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)requestList
                 withOrgBouncycastleAsn1X509X509Extensions:(OrgBouncycastleAsn1X509X509Extensions *)requestExtensions {
  if (self = [super init]) {
    self->version__ = OrgBouncycastleAsn1OcspTBSRequest_V1_;
    self->requestorName_ = requestorName;
    self->requestList_ = requestList;
    self->requestExtensions_ = OrgBouncycastleAsn1X509Extensions_getInstanceWithId_(requestExtensions);
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1X509GeneralName:(OrgBouncycastleAsn1X509GeneralName *)requestorName
                       withOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)requestList
                     withOrgBouncycastleAsn1X509Extensions:(OrgBouncycastleAsn1X509Extensions *)requestExtensions {
  if (self = [super init]) {
    self->version__ = OrgBouncycastleAsn1OcspTBSRequest_V1_;
    self->requestorName_ = requestorName;
    self->requestList_ = requestList;
    self->requestExtensions_ = requestExtensions;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    jint index = 0;
    if ([[((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0] isKindOfClass:[OrgBouncycastleAsn1ASN1TaggedObject class]]) {
      OrgBouncycastleAsn1ASN1TaggedObject *o = (OrgBouncycastleAsn1ASN1TaggedObject *) check_class_cast([seq getObjectAtWithInt:0], [OrgBouncycastleAsn1ASN1TaggedObject class]);
      if ([((OrgBouncycastleAsn1ASN1TaggedObject *) nil_chk(o)) getTagNo] == 0) {
        versionSet_ = YES;
        version__ = OrgBouncycastleAsn1ASN1Integer_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_((OrgBouncycastleAsn1ASN1TaggedObject *) check_class_cast([seq getObjectAtWithInt:0], [OrgBouncycastleAsn1ASN1TaggedObject class]), YES);
        index++;
      }
      else {
        version__ = OrgBouncycastleAsn1OcspTBSRequest_V1_;
      }
    }
    else {
      version__ = OrgBouncycastleAsn1OcspTBSRequest_V1_;
    }
    if ([[seq getObjectAtWithInt:index] isKindOfClass:[OrgBouncycastleAsn1ASN1TaggedObject class]]) {
      requestorName_ = OrgBouncycastleAsn1X509GeneralName_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_((OrgBouncycastleAsn1ASN1TaggedObject *) check_class_cast([seq getObjectAtWithInt:index++], [OrgBouncycastleAsn1ASN1TaggedObject class]), YES);
    }
    requestList_ = (OrgBouncycastleAsn1ASN1Sequence *) check_class_cast([seq getObjectAtWithInt:index++], [OrgBouncycastleAsn1ASN1Sequence class]);
    if ([seq size] == (index + 1)) {
      requestExtensions_ = OrgBouncycastleAsn1X509Extensions_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_((OrgBouncycastleAsn1ASN1TaggedObject *) check_class_cast([seq getObjectAtWithInt:index], [OrgBouncycastleAsn1ASN1TaggedObject class]), YES);
    }
  }
  return self;
}

+ (OrgBouncycastleAsn1OcspTBSRequest *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                              withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1OcspTBSRequest_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}

+ (OrgBouncycastleAsn1OcspTBSRequest *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1OcspTBSRequest_getInstanceWithId_(obj);
}

- (OrgBouncycastleAsn1ASN1Integer *)getVersion {
  return version__;
}

- (OrgBouncycastleAsn1X509GeneralName *)getRequestorName {
  return requestorName_;
}

- (OrgBouncycastleAsn1ASN1Sequence *)getRequestList {
  return requestList_;
}

- (OrgBouncycastleAsn1X509Extensions *)getRequestExtensions {
  return requestExtensions_;
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  if (![((OrgBouncycastleAsn1ASN1Integer *) nil_chk(version__)) isEqual:OrgBouncycastleAsn1OcspTBSRequest_V1_] || versionSet_) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:YES withInt:0 withOrgBouncycastleAsn1ASN1Encodable:version__]];
  }
  if (requestorName_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:YES withInt:1 withOrgBouncycastleAsn1ASN1Encodable:requestorName_]];
  }
  [v addWithOrgBouncycastleAsn1ASN1Encodable:requestList_];
  if (requestExtensions_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:[[OrgBouncycastleAsn1DERTaggedObject alloc] initWithBoolean:YES withInt:2 withOrgBouncycastleAsn1ASN1Encodable:requestExtensions_]];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1OcspTBSRequest *)other {
  [super copyAllFieldsTo:other];
  other->version__ = version__;
  other->requestorName_ = requestorName_;
  other->requestList_ = requestList_;
  other->requestExtensions_ = requestExtensions_;
  other->versionSet_ = versionSet_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleAsn1OcspTBSRequest class]) {
    OrgBouncycastleAsn1OcspTBSRequest_V1_ = [[OrgBouncycastleAsn1ASN1Integer alloc] initWithLong:0];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleAsn1OcspTBSRequest)
  }
}

@end

OrgBouncycastleAsn1OcspTBSRequest *OrgBouncycastleAsn1OcspTBSRequest_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1OcspTBSRequest_init();
  return OrgBouncycastleAsn1OcspTBSRequest_getInstanceWithId_(OrgBouncycastleAsn1ASN1Sequence_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_));
}

OrgBouncycastleAsn1OcspTBSRequest *OrgBouncycastleAsn1OcspTBSRequest_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1OcspTBSRequest_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1OcspTBSRequest class]]) {
    return (OrgBouncycastleAsn1OcspTBSRequest *) check_class_cast(obj, [OrgBouncycastleAsn1OcspTBSRequest class]);
  }
  else if (obj != nil) {
    return [[OrgBouncycastleAsn1OcspTBSRequest alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1OcspTBSRequest)
