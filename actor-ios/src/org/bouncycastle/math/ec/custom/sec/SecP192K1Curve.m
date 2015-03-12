//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/math/ec/custom/sec/SecP192K1Curve.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/math/ec/ECConstants.h"
#include "org/bouncycastle/math/ec/ECCurve.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP192K1Curve.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP192K1FieldElement.h"
#include "org/bouncycastle/math/ec/custom/sec/SecP192K1Point.h"
#include "org/bouncycastle/util/encoders/Hex.h"

@interface OrgBouncycastleMathEcCustomSecSecP192K1Curve () {
}
@end

BOOL OrgBouncycastleMathEcCustomSecSecP192K1Curve_initialized = NO;

@implementation OrgBouncycastleMathEcCustomSecSecP192K1Curve

JavaMathBigInteger * OrgBouncycastleMathEcCustomSecSecP192K1Curve_q_;

- (instancetype)init {
  if (self = [super initWithJavaMathBigInteger:OrgBouncycastleMathEcCustomSecSecP192K1Curve_q_]) {
    self->infinity_ = [[OrgBouncycastleMathEcCustomSecSecP192K1Point alloc] initWithOrgBouncycastleMathEcECCurve:self withOrgBouncycastleMathEcECFieldElement:nil withOrgBouncycastleMathEcECFieldElement:nil];
    self->a_ = [self fromBigIntegerWithJavaMathBigInteger:OrgBouncycastleMathEcECConstants_get_ZERO_()];
    self->b_ = [self fromBigIntegerWithJavaMathBigInteger:JavaMathBigInteger_valueOfWithLong_(3)];
    self->order_ = [[JavaMathBigInteger alloc] initWithInt:1 withByteArray:OrgBouncycastleUtilEncodersHex_decodeWithNSString_(@"FFFFFFFFFFFFFFFFFFFFFFFE26F2FC170F69466A74DEFD8D")];
    self->cofactor_ = JavaMathBigInteger_valueOfWithLong_(1);
    self->coord_ = OrgBouncycastleMathEcCustomSecSecP192K1Curve_SecP192K1_DEFAULT_COORDS;
  }
  return self;
}

- (OrgBouncycastleMathEcECCurve *)cloneCurve {
  return [[OrgBouncycastleMathEcCustomSecSecP192K1Curve alloc] init];
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
  return OrgBouncycastleMathEcCustomSecSecP192K1Curve_q_;
}

- (jint)getFieldSize {
  return [((JavaMathBigInteger *) nil_chk(OrgBouncycastleMathEcCustomSecSecP192K1Curve_q_)) bitLength];
}

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x {
  return [[OrgBouncycastleMathEcCustomSecSecP192K1FieldElement alloc] initWithJavaMathBigInteger:x];
}

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression {
  return [[OrgBouncycastleMathEcCustomSecSecP192K1Point alloc] initWithOrgBouncycastleMathEcECCurve:self withOrgBouncycastleMathEcECFieldElement:x withOrgBouncycastleMathEcECFieldElement:y withBoolean:withCompression];
}

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression {
  return [[OrgBouncycastleMathEcCustomSecSecP192K1Point alloc] initWithOrgBouncycastleMathEcECCurve:self withOrgBouncycastleMathEcECFieldElement:x withOrgBouncycastleMathEcECFieldElement:y withOrgBouncycastleMathEcECFieldElementArray:zs withBoolean:withCompression];
}

- (OrgBouncycastleMathEcECPoint *)getInfinity {
  return infinity_;
}

- (void)copyAllFieldsTo:(OrgBouncycastleMathEcCustomSecSecP192K1Curve *)other {
  [super copyAllFieldsTo:other];
  other->infinity_ = infinity_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleMathEcCustomSecSecP192K1Curve class]) {
    OrgBouncycastleMathEcCustomSecSecP192K1Curve_q_ = [[JavaMathBigInteger alloc] initWithInt:1 withByteArray:OrgBouncycastleUtilEncodersHex_decodeWithNSString_(@"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFEE37")];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleMathEcCustomSecSecP192K1Curve)
  }
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcCustomSecSecP192K1Curve)
