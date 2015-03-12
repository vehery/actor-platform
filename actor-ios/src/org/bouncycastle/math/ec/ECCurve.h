//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/math/ec/ECCurve.java
//

#ifndef _OrgBouncycastleMathEcECCurve_H_
#define _OrgBouncycastleMathEcECCurve_H_

@class IOSByteArray;
@class IOSIntArray;
@class IOSObjectArray;
@class JavaMathBigInteger;
@class OrgBouncycastleMathEcECCurve;
@class OrgBouncycastleMathEcECFieldElement;
@class OrgBouncycastleMathEcECPoint;
@class OrgBouncycastleMathEcECPoint_F2m;
@class OrgBouncycastleMathEcECPoint_Fp;
@protocol OrgBouncycastleMathEcECMultiplier;
@protocol OrgBouncycastleMathEcEndoECEndomorphism;
@protocol OrgBouncycastleMathEcPreCompInfo;
@protocol OrgBouncycastleMathFieldFiniteField;

#include "J2ObjC_header.h"

@interface OrgBouncycastleMathEcECCurve_Config : NSObject {
 @public
  jint coord_;
  id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism_;
  id<OrgBouncycastleMathEcECMultiplier> multiplier_;
}

- (instancetype)initWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)outer$
                                             withInt:(jint)coord
         withOrgBouncycastleMathEcEndoECEndomorphism:(id<OrgBouncycastleMathEcEndoECEndomorphism>)endomorphism
               withOrgBouncycastleMathEcECMultiplier:(id<OrgBouncycastleMathEcECMultiplier>)multiplier;

- (OrgBouncycastleMathEcECCurve_Config *)setCoordinateSystemWithInt:(jint)coord;

- (OrgBouncycastleMathEcECCurve_Config *)setEndomorphismWithOrgBouncycastleMathEcEndoECEndomorphism:(id<OrgBouncycastleMathEcEndoECEndomorphism>)endomorphism;

- (OrgBouncycastleMathEcECCurve_Config *)setMultiplierWithOrgBouncycastleMathEcECMultiplier:(id<OrgBouncycastleMathEcECMultiplier>)multiplier;

- (OrgBouncycastleMathEcECCurve *)create;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_Config)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Config, endomorphism_, id<OrgBouncycastleMathEcEndoECEndomorphism>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Config, multiplier_, id<OrgBouncycastleMathEcECMultiplier>)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_Config)

#define OrgBouncycastleMathEcECCurve_COORD_AFFINE 0
#define OrgBouncycastleMathEcECCurve_COORD_HOMOGENEOUS 1
#define OrgBouncycastleMathEcECCurve_COORD_JACOBIAN 2
#define OrgBouncycastleMathEcECCurve_COORD_JACOBIAN_CHUDNOVSKY 3
#define OrgBouncycastleMathEcECCurve_COORD_JACOBIAN_MODIFIED 4
#define OrgBouncycastleMathEcECCurve_COORD_LAMBDA_AFFINE 5
#define OrgBouncycastleMathEcECCurve_COORD_LAMBDA_PROJECTIVE 6
#define OrgBouncycastleMathEcECCurve_COORD_SKEWED 7

@interface OrgBouncycastleMathEcECCurve : NSObject {
 @public
  id<OrgBouncycastleMathFieldFiniteField> field_;
  OrgBouncycastleMathEcECFieldElement *a_, *b_;
  JavaMathBigInteger *order_, *cofactor_;
  jint coord_;
  id<OrgBouncycastleMathEcEndoECEndomorphism> endomorphism_;
  id<OrgBouncycastleMathEcECMultiplier> multiplier_;
}

+ (IOSIntArray *)getAllCoordinateSystems;

- (instancetype)initWithOrgBouncycastleMathFieldFiniteField:(id<OrgBouncycastleMathFieldFiniteField>)field;

- (jint)getFieldSize;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (OrgBouncycastleMathEcECCurve_Config *)configure;

- (OrgBouncycastleMathEcECPoint *)validatePointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                               withJavaMathBigInteger:(JavaMathBigInteger *)y;

- (OrgBouncycastleMathEcECPoint *)validatePointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                               withJavaMathBigInteger:(JavaMathBigInteger *)y
                                                          withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createPointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                             withJavaMathBigInteger:(JavaMathBigInteger *)y;

- (OrgBouncycastleMathEcECPoint *)createPointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                             withJavaMathBigInteger:(JavaMathBigInteger *)y
                                                        withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression;

- (id<OrgBouncycastleMathEcECMultiplier>)createDefaultMultiplier;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

- (id<OrgBouncycastleMathEcPreCompInfo>)getPreCompInfoWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)point
                                                                          withNSString:(NSString *)name;

- (void)setPreCompInfoWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)point
                                          withNSString:(NSString *)name
                  withOrgBouncycastleMathEcPreCompInfo:(id<OrgBouncycastleMathEcPreCompInfo>)preCompInfo;

- (OrgBouncycastleMathEcECPoint *)importPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p;

- (void)normalizeAllWithOrgBouncycastleMathEcECPointArray:(IOSObjectArray *)points;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

- (id<OrgBouncycastleMathFieldFiniteField>)getField;

- (OrgBouncycastleMathEcECFieldElement *)getA;

- (OrgBouncycastleMathEcECFieldElement *)getB;

- (JavaMathBigInteger *)getOrder;

- (JavaMathBigInteger *)getCofactor;

- (jint)getCoordinateSystem;

- (OrgBouncycastleMathEcECPoint *)decompressPointWithInt:(jint)yTilde
                                  withJavaMathBigInteger:(JavaMathBigInteger *)X1;

- (id<OrgBouncycastleMathEcEndoECEndomorphism>)getEndomorphism;

- (id<OrgBouncycastleMathEcECMultiplier>)getMultiplier;

- (OrgBouncycastleMathEcECPoint *)decodePointWithByteArray:(IOSByteArray *)encoded;

- (void)checkPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)point;

- (void)checkPointsWithOrgBouncycastleMathEcECPointArray:(IOSObjectArray *)points;

- (jboolean)equalsWithOrgBouncycastleMathEcECCurve:(OrgBouncycastleMathEcECCurve *)other;

- (jboolean)isEqual:(id)obj;

- (NSUInteger)hash;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, field_, id<OrgBouncycastleMathFieldFiniteField>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, a_, OrgBouncycastleMathEcECFieldElement *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, b_, OrgBouncycastleMathEcECFieldElement *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, order_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, cofactor_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, endomorphism_, id<OrgBouncycastleMathEcEndoECEndomorphism>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve, multiplier_, id<OrgBouncycastleMathEcECMultiplier>)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastleMathEcECCurve_getAllCoordinateSystems();

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_AFFINE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_HOMOGENEOUS, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_JACOBIAN, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_JACOBIAN_CHUDNOVSKY, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_JACOBIAN_MODIFIED, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_LAMBDA_AFFINE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_LAMBDA_PROJECTIVE, jint)

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve, COORD_SKEWED, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve)

@interface OrgBouncycastleMathEcECCurve_AbstractFp : OrgBouncycastleMathEcECCurve {
}

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q;

- (OrgBouncycastleMathEcECPoint *)decompressPointWithInt:(jint)yTilde
                                  withJavaMathBigInteger:(JavaMathBigInteger *)X1;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_AbstractFp)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_AbstractFp)

#define OrgBouncycastleMathEcECCurve_Fp_FP_DEFAULT_COORDS 4

@interface OrgBouncycastleMathEcECCurve_Fp : OrgBouncycastleMathEcECCurve_AbstractFp {
 @public
  JavaMathBigInteger *q_, *r_;
  OrgBouncycastleMathEcECPoint_Fp *infinity_;
}

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)a
                    withJavaMathBigInteger:(JavaMathBigInteger *)b;

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)a
                    withJavaMathBigInteger:(JavaMathBigInteger *)b
                    withJavaMathBigInteger:(JavaMathBigInteger *)order
                    withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)r
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b;

- (instancetype)initWithJavaMathBigInteger:(JavaMathBigInteger *)q
                    withJavaMathBigInteger:(JavaMathBigInteger *)r
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
   withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
                    withJavaMathBigInteger:(JavaMathBigInteger *)order
                    withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

- (JavaMathBigInteger *)getQ;

- (jint)getFieldSize;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)importPointWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_Fp)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Fp, q_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Fp, r_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathEcECCurve_Fp, infinity_, OrgBouncycastleMathEcECPoint_Fp *)

CF_EXTERN_C_BEGIN

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve_Fp, FP_DEFAULT_COORDS, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_Fp)

@interface OrgBouncycastleMathEcECCurve_AbstractF2m : OrgBouncycastleMathEcECCurve {
}

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_AbstractF2m)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_AbstractF2m)

#define OrgBouncycastleMathEcECCurve_F2m_F2M_DEFAULT_COORDS 6

@interface OrgBouncycastleMathEcECCurve_F2m : OrgBouncycastleMathEcECCurve_AbstractF2m {
}

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b
     withJavaMathBigInteger:(JavaMathBigInteger *)order
     withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3
     withJavaMathBigInteger:(JavaMathBigInteger *)a
     withJavaMathBigInteger:(JavaMathBigInteger *)b
     withJavaMathBigInteger:(JavaMathBigInteger *)order
     withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (instancetype)initWithInt:(jint)m
                    withInt:(jint)k1
                    withInt:(jint)k2
                    withInt:(jint)k3
withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)a
withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)b
     withJavaMathBigInteger:(JavaMathBigInteger *)order
     withJavaMathBigInteger:(JavaMathBigInteger *)cofactor;

- (OrgBouncycastleMathEcECCurve *)cloneCurve;

- (jboolean)supportsCoordinateSystemWithInt:(jint)coord;

- (id<OrgBouncycastleMathEcECMultiplier>)createDefaultMultiplier;

- (jint)getFieldSize;

- (OrgBouncycastleMathEcECFieldElement *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

- (OrgBouncycastleMathEcECPoint *)createPointWithJavaMathBigInteger:(JavaMathBigInteger *)x
                                             withJavaMathBigInteger:(JavaMathBigInteger *)y
                                                        withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)createRawPointWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)x
                                                withOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)y
                                           withOrgBouncycastleMathEcECFieldElementArray:(IOSObjectArray *)zs
                                                                            withBoolean:(jboolean)withCompression;

- (OrgBouncycastleMathEcECPoint *)getInfinity;

- (jboolean)isKoblitz;

- (jbyte)getMu;

- (IOSObjectArray *)getSi;

- (OrgBouncycastleMathEcECPoint *)decompressPointWithInt:(jint)yTilde
                                  withJavaMathBigInteger:(JavaMathBigInteger *)X1;

- (jint)getM;

- (jboolean)isTrinomial;

- (jint)getK1;

- (jint)getK2;

- (jint)getK3;

- (JavaMathBigInteger *)getN;

- (JavaMathBigInteger *)getH;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathEcECCurve_F2m)

CF_EXTERN_C_BEGIN

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathEcECCurve_F2m, F2M_DEFAULT_COORDS, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathEcECCurve_F2m)

#endif // _OrgBouncycastleMathEcECCurve_H_
