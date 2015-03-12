//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/cms/MetaData.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1Boolean.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DERIA5String.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/DERUTF8String.h"
#include "org/bouncycastle/asn1/cms/Attributes.h"
#include "org/bouncycastle/asn1/cms/MetaData.h"

@interface OrgBouncycastleAsn1CmsMetaData () {
 @public
  OrgBouncycastleAsn1ASN1Boolean *hashProtected_;
  OrgBouncycastleAsn1DERUTF8String *fileName_;
  OrgBouncycastleAsn1DERIA5String *mediaType_;
  OrgBouncycastleAsn1CmsAttributes *otherMetaData_;
}
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsMetaData, hashProtected_, OrgBouncycastleAsn1ASN1Boolean *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsMetaData, fileName_, OrgBouncycastleAsn1DERUTF8String *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsMetaData, mediaType_, OrgBouncycastleAsn1DERIA5String *)
J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1CmsMetaData, otherMetaData_, OrgBouncycastleAsn1CmsAttributes *)

@implementation OrgBouncycastleAsn1CmsMetaData

- (instancetype)initWithOrgBouncycastleAsn1ASN1Boolean:(OrgBouncycastleAsn1ASN1Boolean *)hashProtected
                  withOrgBouncycastleAsn1DERUTF8String:(OrgBouncycastleAsn1DERUTF8String *)fileName
                   withOrgBouncycastleAsn1DERIA5String:(OrgBouncycastleAsn1DERIA5String *)mediaType
                  withOrgBouncycastleAsn1CmsAttributes:(OrgBouncycastleAsn1CmsAttributes *)otherMetaData {
  if (self = [super init]) {
    self->hashProtected_ = hashProtected;
    self->fileName_ = fileName;
    self->mediaType_ = mediaType;
    self->otherMetaData_ = otherMetaData;
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    self->hashProtected_ = OrgBouncycastleAsn1ASN1Boolean_getInstanceWithId_([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0]);
    jint index = 1;
    if (index < [seq size] && [[seq getObjectAtWithInt:index] isKindOfClass:[OrgBouncycastleAsn1DERUTF8String class]]) {
      self->fileName_ = OrgBouncycastleAsn1DERUTF8String_getInstanceWithId_([seq getObjectAtWithInt:index++]);
    }
    if (index < [seq size] && [[seq getObjectAtWithInt:index] isKindOfClass:[OrgBouncycastleAsn1DERIA5String class]]) {
      self->mediaType_ = OrgBouncycastleAsn1DERIA5String_getInstanceWithId_([seq getObjectAtWithInt:index++]);
    }
    if (index < [seq size]) {
      self->otherMetaData_ = OrgBouncycastleAsn1CmsAttributes_getInstanceWithId_([seq getObjectAtWithInt:index++]);
    }
  }
  return self;
}

+ (OrgBouncycastleAsn1CmsMetaData *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1CmsMetaData_getInstanceWithId_(obj);
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:hashProtected_];
  if (fileName_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:fileName_];
  }
  if (mediaType_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:mediaType_];
  }
  if (otherMetaData_ != nil) {
    [v addWithOrgBouncycastleAsn1ASN1Encodable:otherMetaData_];
  }
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (jboolean)isHashProtected {
  return [((OrgBouncycastleAsn1ASN1Boolean *) nil_chk(hashProtected_)) isTrue];
}

- (OrgBouncycastleAsn1DERUTF8String *)getFileName {
  return self->fileName_;
}

- (OrgBouncycastleAsn1DERIA5String *)getMediaType {
  return self->mediaType_;
}

- (OrgBouncycastleAsn1CmsAttributes *)getOtherMetaData {
  return otherMetaData_;
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1CmsMetaData *)other {
  [super copyAllFieldsTo:other];
  other->hashProtected_ = hashProtected_;
  other->fileName_ = fileName_;
  other->mediaType_ = mediaType_;
  other->otherMetaData_ = otherMetaData_;
}

@end

OrgBouncycastleAsn1CmsMetaData *OrgBouncycastleAsn1CmsMetaData_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1CmsMetaData_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1CmsMetaData class]]) {
    return (OrgBouncycastleAsn1CmsMetaData *) check_class_cast(obj, [OrgBouncycastleAsn1CmsMetaData class]);
  }
  else if (obj != nil) {
    return [[OrgBouncycastleAsn1CmsMetaData alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1CmsMetaData)
