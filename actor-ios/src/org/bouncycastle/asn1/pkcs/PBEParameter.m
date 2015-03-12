//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/pkcs/PBEParameter.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1EncodableVector.h"
#include "org/bouncycastle/asn1/ASN1Integer.h"
#include "org/bouncycastle/asn1/ASN1OctetString.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1Sequence.h"
#include "org/bouncycastle/asn1/DEROctetString.h"
#include "org/bouncycastle/asn1/DERSequence.h"
#include "org/bouncycastle/asn1/pkcs/PBEParameter.h"

@interface OrgBouncycastleAsn1PkcsPBEParameter ()
- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq;
@end

@implementation OrgBouncycastleAsn1PkcsPBEParameter

- (instancetype)initWithByteArray:(IOSByteArray *)salt
                          withInt:(jint)iterations {
  if (self = [super init]) {
    if (((IOSByteArray *) nil_chk(salt))->size_ != 8) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:@"salt length must be 8"];
    }
    self->salt_ = [[OrgBouncycastleAsn1DEROctetString alloc] initWithByteArray:salt];
    self->iterations_ = [[OrgBouncycastleAsn1ASN1Integer alloc] initWithLong:iterations];
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleAsn1ASN1Sequence:(OrgBouncycastleAsn1ASN1Sequence *)seq {
  if (self = [super init]) {
    salt_ = (OrgBouncycastleAsn1ASN1OctetString *) check_class_cast([((OrgBouncycastleAsn1ASN1Sequence *) nil_chk(seq)) getObjectAtWithInt:0], [OrgBouncycastleAsn1ASN1OctetString class]);
    iterations_ = (OrgBouncycastleAsn1ASN1Integer *) check_class_cast([seq getObjectAtWithInt:1], [OrgBouncycastleAsn1ASN1Integer class]);
  }
  return self;
}

+ (OrgBouncycastleAsn1PkcsPBEParameter *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1PkcsPBEParameter_getInstanceWithId_(obj);
}

- (JavaMathBigInteger *)getIterationCount {
  return [((OrgBouncycastleAsn1ASN1Integer *) nil_chk(iterations_)) getValue];
}

- (IOSByteArray *)getSalt {
  return [((OrgBouncycastleAsn1ASN1OctetString *) nil_chk(salt_)) getOctets];
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  OrgBouncycastleAsn1ASN1EncodableVector *v = [[OrgBouncycastleAsn1ASN1EncodableVector alloc] init];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:salt_];
  [v addWithOrgBouncycastleAsn1ASN1Encodable:iterations_];
  return [[OrgBouncycastleAsn1DERSequence alloc] initWithOrgBouncycastleAsn1ASN1EncodableVector:v];
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1PkcsPBEParameter *)other {
  [super copyAllFieldsTo:other];
  other->iterations_ = iterations_;
  other->salt_ = salt_;
}

@end

OrgBouncycastleAsn1PkcsPBEParameter *OrgBouncycastleAsn1PkcsPBEParameter_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1PkcsPBEParameter_init();
  if ([obj isKindOfClass:[OrgBouncycastleAsn1PkcsPBEParameter class]]) {
    return (OrgBouncycastleAsn1PkcsPBEParameter *) check_class_cast(obj, [OrgBouncycastleAsn1PkcsPBEParameter class]);
  }
  else if (obj != nil) {
    return [[OrgBouncycastleAsn1PkcsPBEParameter alloc] initWithOrgBouncycastleAsn1ASN1Sequence:OrgBouncycastleAsn1ASN1Sequence_getInstanceWithId_(obj)];
  }
  return nil;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1PkcsPBEParameter)
