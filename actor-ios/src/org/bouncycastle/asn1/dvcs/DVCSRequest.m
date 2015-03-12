//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/dvcs/DVCSRequest.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/dvcs/DVCSRequest.h"
#include "org/bouncycastle/asn1/dvcs/DVCSRequestInformation.h"
#include "org/bouncycastle/asn1/dvcs/Data.h"
#include "org/bouncycastle/asn1/x509/GeneralName.h"

@interface OrgBouncycastleAsn1DvcsDVCSRequest () {
 @public
  OrgBouncycastleAsn1DvcsDVCSRequestInformation *requestInformation_;
  OrgBouncycastleAsn1DvcsData *data_;
  OrgBouncycastleAsn1X509GeneralName *transactionIdentifier_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1DvcsDVCSRequest, requestInformation_, OrgBouncycastleAsn1DvcsDVCSRequestInformation *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1DvcsDVCSRequest, data_, OrgBouncycastleAsn1DvcsData *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1DvcsDVCSRequest, transactionIdentifier_, OrgBouncycastleAsn1X509GeneralName *)

@implementation OrgBouncycastleAsn1DvcsDVCSRequest

- (instancetype)initWithOrgBouncycastleAsn1DvcsDVCSRequestInformation:(OrgBouncycastleAsn1DvcsDVCSRequestInformation *)requestInformation
                                      withOrgBouncycastleAsn1DvcsData:(OrgBouncycastleAsn1DvcsData *)data {
  return [self initOrgBouncycastleAsn1DvcsDVCSRequestWithOrgBouncycastleAsn1DvcsDVCSRequestInformation:requestInformation withOrgBouncycastleAsn1DvcsData:data withOrgBouncycastleAsn1X509GeneralName:nil];
}

- (instancetype)initOrgBouncycastleAsn1DvcsDVCSRequestWithOrgBouncycastleAsn1DvcsDVCSRequestInformation:(OrgBouncycastleAsn1DvcsDVCSRequestInformation *)requestInformation
                                                                        withOrgBouncycastleAsn1DvcsData:(OrgBouncycastleAsn1DvcsData *)data
                                                                 withOrgBouncycastleAsn1X509GeneralName:(OrgBouncycastleAsn1X509GeneralName *)transactionIdentifier {
  if (self = [super init]) {
    self->requestInformation_ = requestInformation;
    self->data_ = data;
    self->transactionIdentifier_ = transactionIdentifier;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1DvcsDVCSRequestInformation:(OrgBouncycastleAsn1DvcsDVCSRequestInformation *)requestInformation
                                      withOrgBouncycastleAsn1DvcsData:(OrgBouncycastleAsn1DvcsData *)data
                               withOrgBouncycastleAsn1X509GeneralName:(OrgBouncycastleAsn1X509GeneralName *)transactionIdentifier {
  return [self initOrgBouncycastleAsn1DvcsDVCSRequestWithOrgBouncycastleAsn1DvcsDVCSRequestInformation:requestInformation withOrgBouncycastleAsn1DvcsData:data withOrgBouncycastleAsn1X509GeneralName:transactionIdentifier];
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    requestInformation_ = OrgBouncycastleAsn1DvcsDVCSRequestInformation_getInstanceWithId_([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0]);
    data_ = OrgBouncycastleAsn1DvcsData_getInstanceWithId_([seq getObjectAtWithInt:1]);
    if ([seq size] > 2) {
      transactionIdentifier_ = OrgBouncycastleAsn1X509GeneralName_getInstanceWithId_([seq getObjectAtWithInt:2]);
    }
  }
  return self;
}

+ (OrgBouncycastleAsn1DvcsDVCSRequest *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1DvcsDVCSRequest_getInstanceWithId_(obj);
}

+ (OrgBouncycastleAsn1DvcsDVCSRequest *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                               withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1DvcsDVCSRequest_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:requestInformation_];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:data_];
  if (transactionIdentifier_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:transactionIdentifier_];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (NSString *)description {
  return JreStrcat("$@$@C$$", @"DVCSRequest {\nrequestInformation: ", requestInformation_, @"\ndata: ", data_, 0x000a, (transactionIdentifier_ != nil ? JreStrcat("$@C", @"transactionIdentifier: ", transactionIdentifier_, 0x000a) : @""), @"}\n");
}

- (OrgBouncycastleAsn1DvcsData *)getData {
  return data_;
}

- (OrgBouncycastleAsn1DvcsDVCSRequestInformation *)getRequestInformation {
  return requestInformation_;
}

- (OrgBouncycastleAsn1X509GeneralName *)getTransactionIdentifier {
  return transactionIdentifier_;
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1DvcsDVCSRequest *)other {
  [super copyAllFieldsTo:other];
  other->requestInformation_ = requestInformation_;
  other->data_ = data_;
  other->transactionIdentifier_ = transactionIdentifier_;
}

@end

OrgBouncycastleAsn1DvcsDVCSRequest *OrgBouncycastleAsn1DvcsDVCSRequest_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1DvcsDVCSRequest_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1DvcsDVCSRequest class]]) {
    return (OrgBouncycastleAsn1DvcsDVCSRequest *) check_class_cast(obj, [OrgBouncycastleAsn1DvcsDVCSRequest class]);
  }
  else if (obj != nil) {
    return [[OrgBouncycastleAsn1DvcsDVCSRequest alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

OrgBouncycastleAsn1DvcsDVCSRequest *OrgBouncycastleAsn1DvcsDVCSRequest_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1DvcsDVCSRequest_init();
  return OrgBouncycastleAsn1DvcsDVCSRequest_getInstanceWithId_(OrgBouncycastleAsn1ASN1Sequence_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1DvcsDVCSRequest)
