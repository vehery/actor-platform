//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/math/ec/custom/sec/SecP224R1Curve.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/ECCurve.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP224R1Curve.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP224R1FieldElement.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP224R1Point.h"
#include "org/bouncycastle/util/encoders/Hex.h"

@interface OrgBouncycastleMathEcCustomSecSecP224R1Curve () {
}
@end

BOOL OrgBouncycastleMathEcCustomSecSecP224R1Curve_initialized = NO;

@implementation OrgBouncycastleMathEcCustomSecSecP224R1Curve

JavaMathBigInteger * OrgBouncycastleMathEcCustomSecSecP224R1Curve_q_;

- (instancetype)init {
  if (self = [super initWithJavaMathBigInteger:OrgBouncycastleMathEcCustomSecSecP224R1Curve_q_]) {
    self->infinity_ = [[OrgBouncycastleMathEcCustomSecSecP224R1Point alloc] initWithOrgBouncycastleMathEcECCurve:self withOrgBouncycastleMathEcECFieldElement:nil withOrgBouncycastleMathEcECFieldElement:nil];
    self->a_ = [self fromBigIntegerWithJavaMathBigInteger:[[JavaMathBigInteger alloc] initWithInt:1 withByteArray:OrgBouncycastleUtilEncodersHex_decodeWithNSString_(@"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE")]];
    self->b_ = [self fromBigIntegerWithJavaMathBigInteger:[[JavaMathBigInteger alloc] initWithInt:1 withByteArray:OrgBouncycastleUtilEncodersHex_decodeWithNSString_(@"B4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB4")]];
    self->order_ = [[JavaMathBigInteger alloc] initWithInt:1 withByteArray:OrgBouncycastleUtilEncodersHex_decodeWithNSString_(@"FFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D")];
    self->cofactor_ = JavaMathBigInteger_valueOfWithLong_(1);
    self->coord_ = OrgBouncycastleMathEcCustomSecSecP224R1Curve_SecP224R1_DEFAULT_COORDS;
  }
  return self;
}

- (OrgBouncycastleMathEcECCurve *)cloneCurve {
  return [[OrgBouncycastleMathEcCustomSecSecP224R1Curve alloc] init];
}

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord {
  switch (coord) {
    case OrgBouncycastleMathEcECCurve_COORD_JACOBIAN:
    return YES;
    default:
    return NO;
  }
}

- (JavaMathBigInteger *)getQ {
  return OrgBouncycastleMathEcCustomSecSecP224R1Curve_q_;
}

- (jint)getFieldSize {
  return [((JavaMathBigInteger *) nil_chk(OrgBouncycastleMathEcCustomSecSecP224R1Curve_q_)) bitLength];
}

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x {
  return [[OrgBouncycastleMathEcCustomSecSecP224R1FieldElement alloc] initWithJavaMathBigInteger:x];
}

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression {
  return [[OrgBouncycastleMathEcCustomSecSecP224R1Point alloc] initWithOrgBouncycastleMathEcECCurve:self withOrgBouncycastleMathEcECFieldElement:x withOrgBouncycastleMathEcECFieldElement:y withBoolean:withCompression];
}

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression {
  return [[OrgBouncycastleMathEcCustomSecSecP224R1Point alloc] initWithOrgBouncycastleMathEcECCurve:self withOrgBouncycastleMathEcECFieldElement:x withOrgBouncycastleMathEcECFieldElement:y withOrgBouncycastleMathEcECFieldElementArray:zs withBoolean:withCompression];
}

- (OrgBouncycastleMathEcECPoint *)getInfinity {
  return infinity_;
}

- (void)copyAllFieldsTo:(OrgBouncycastleMathEcCustomSecSecP224R1Curve *)other {
  [super copyAllFieldsTo:other];
  other->infinity_ = infinity_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleMathEcCustomSecSecP224R1Curve class]) {
    OrgBouncycastleMathEcCustomSecSecP224R1Curve_q_ = [[JavaMathBigInteger alloc] initWithInt:1 withByteArray:OrgBouncycastleUtilEncodersHex_decodeWithNSString_(@"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000001")];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleMathEcCustomSecSecP224R1Curve)
  }
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcCustomSecSecP224R1Curve)
