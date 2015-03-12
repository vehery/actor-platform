//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/math/raw/Nat192.java
//

#ifndef _OrgBouncycastleMathRawNat192_H_
#define _OrgBouncycastleMathRawNat192_H_

@class IOSIntArray;
@class JavaMathBigInteger;

#include "J2ObjC_header.h"

#define OrgBouncycastleMathRawNat192_M 4294967295LL

@interface OrgBouncycastleMathRawNat192 : NSObject {
}

+ (jint)addWithIntArray:(IOSIntArray *)x
           withIntArray:(IOSIntArray *)y
           withIntArray:(IOSIntArray *)z;

+ (jint)addBothToWithIntArray:(IOSIntArray *)x
                 withIntArray:(IOSIntArray *)y
                 withIntArray:(IOSIntArray *)z;

+ (jint)addToWithIntArray:(IOSIntArray *)x
             withIntArray:(IOSIntArray *)z;

+ (jint)addToWithIntArray:(IOSIntArray *)x
                  withInt:(jint)xOff
             withIntArray:(IOSIntArray *)z
                  withInt:(jint)zOff
                  withInt:(jint)cIn;

+ (jint)addToEachOtherWithIntArray:(IOSIntArray *)u
                           withInt:(jint)uOff
                      withIntArray:(IOSIntArray *)v
                           withInt:(jint)vOff;

+ (void)copy__WithIntArray:(IOSIntArray *)x
              withIntArray:(IOSIntArray *)z OBJC_METHOD_FAMILY_NONE;

+ (IOSIntArray *)create;

+ (IOSIntArray *)createExt;

+ (jboolean)diffWithIntArray:(IOSIntArray *)x
                     withInt:(jint)xOff
                withIntArray:(IOSIntArray *)y
                     withInt:(jint)yOff
                withIntArray:(IOSIntArray *)z
                     withInt:(jint)zOff;

+ (jboolean)eqWithIntArray:(IOSIntArray *)x
              withIntArray:(IOSIntArray *)y;

+ (IOSIntArray *)fromBigIntegerWithJavaMathBigInteger:(JavaMathBigInteger *)x;

+ (jint)getBitWithIntArray:(IOSIntArray *)x
                   withInt:(jint)bit;

+ (jboolean)gteWithIntArray:(IOSIntArray *)x
               withIntArray:(IOSIntArray *)y;

+ (jboolean)gteWithIntArray:(IOSIntArray *)x
                    withInt:(jint)xOff
               withIntArray:(IOSIntArray *)y
                    withInt:(jint)yOff;

+ (jboolean)isOneWithIntArray:(IOSIntArray *)x;

+ (jboolean)isZeroWithIntArray:(IOSIntArray *)x;

+ (void)mulWithIntArray:(IOSIntArray *)x
           withIntArray:(IOSIntArray *)y
           withIntArray:(IOSIntArray *)zz;

+ (void)mulWithIntArray:(IOSIntArray *)x
                withInt:(jint)xOff
           withIntArray:(IOSIntArray *)y
                withInt:(jint)yOff
           withIntArray:(IOSIntArray *)zz
                withInt:(jint)zzOff;

+ (jint)mulAddToWithIntArray:(IOSIntArray *)x
                withIntArray:(IOSIntArray *)y
                withIntArray:(IOSIntArray *)zz;

+ (jint)mulAddToWithIntArray:(IOSIntArray *)x
                     withInt:(jint)xOff
                withIntArray:(IOSIntArray *)y
                     withInt:(jint)yOff
                withIntArray:(IOSIntArray *)zz
                     withInt:(jint)zzOff;

+ (jlong)mul33AddWithInt:(jint)w
            withIntArray:(IOSIntArray *)x
                 withInt:(jint)xOff
            withIntArray:(IOSIntArray *)y
                 withInt:(jint)yOff
            withIntArray:(IOSIntArray *)z
                 withInt:(jint)zOff;

+ (jint)mulWordAddExtWithInt:(jint)x
                withIntArray:(IOSIntArray *)yy
                     withInt:(jint)yyOff
                withIntArray:(IOSIntArray *)zz
                     withInt:(jint)zzOff;

+ (jint)mul33DWordAddWithInt:(jint)x
                    withLong:(jlong)y
                withIntArray:(IOSIntArray *)z
                     withInt:(jint)zOff;

+ (jint)mul33WordAddWithInt:(jint)x
                    withInt:(jint)y
               withIntArray:(IOSIntArray *)z
                    withInt:(jint)zOff;

+ (jint)mulWordDwordAddWithInt:(jint)x
                      withLong:(jlong)y
                  withIntArray:(IOSIntArray *)z
                       withInt:(jint)zOff;

+ (jint)mulWordWithInt:(jint)x
          withIntArray:(IOSIntArray *)y
          withIntArray:(IOSIntArray *)z
               withInt:(jint)zOff;

+ (void)squareWithIntArray:(IOSIntArray *)x
              withIntArray:(IOSIntArray *)zz;

+ (void)squareWithIntArray:(IOSIntArray *)x
                   withInt:(jint)xOff
              withIntArray:(IOSIntArray *)zz
                   withInt:(jint)zzOff;

+ (jint)subWithIntArray:(IOSIntArray *)x
           withIntArray:(IOSIntArray *)y
           withIntArray:(IOSIntArray *)z;

+ (jint)subWithIntArray:(IOSIntArray *)x
                withInt:(jint)xOff
           withIntArray:(IOSIntArray *)y
                withInt:(jint)yOff
           withIntArray:(IOSIntArray *)z
                withInt:(jint)zOff;

+ (jint)subBothFromWithIntArray:(IOSIntArray *)x
                   withIntArray:(IOSIntArray *)y
                   withIntArray:(IOSIntArray *)z;

+ (jint)subFromWithIntArray:(IOSIntArray *)x
               withIntArray:(IOSIntArray *)z;

+ (jint)subFromWithIntArray:(IOSIntArray *)x
                    withInt:(jint)xOff
               withIntArray:(IOSIntArray *)z
                    withInt:(jint)zOff;

+ (JavaMathBigInteger *)toBigIntegerWithIntArray:(IOSIntArray *)x;

+ (void)zeroWithIntArray:(IOSIntArray *)z;

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathRawNat192)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_addWithIntArray_withIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y, IOSIntArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_addBothToWithIntArray_withIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y, IOSIntArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_addToWithIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_addToWithIntArray_withInt_withIntArray_withInt_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *z, jint zOff, jint cIn);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_addToEachOtherWithIntArray_withInt_withIntArray_withInt_(IOSIntArray *u, jint uOff, IOSIntArray *v, jint vOff);

FOUNDATION_EXPORT void OrgBouncycastleMathRawNat192_copy__WithIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *z);

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastleMathRawNat192_create();

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastleMathRawNat192_createExt();

FOUNDATION_EXPORT jboolean OrgBouncycastleMathRawNat192_diffWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *y, jint yOff, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT jboolean OrgBouncycastleMathRawNat192_eqWithIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y);

FOUNDATION_EXPORT IOSIntArray *OrgBouncycastleMathRawNat192_fromBigIntegerWithJavaMathBigInteger_(JavaMathBigInteger *x);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_getBitWithIntArray_withInt_(IOSIntArray *x, jint bit);

FOUNDATION_EXPORT jboolean OrgBouncycastleMathRawNat192_gteWithIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y);

FOUNDATION_EXPORT jboolean OrgBouncycastleMathRawNat192_gteWithIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *y, jint yOff);

FOUNDATION_EXPORT jboolean OrgBouncycastleMathRawNat192_isOneWithIntArray_(IOSIntArray *x);

FOUNDATION_EXPORT jboolean OrgBouncycastleMathRawNat192_isZeroWithIntArray_(IOSIntArray *x);

FOUNDATION_EXPORT void OrgBouncycastleMathRawNat192_mulWithIntArray_withIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y, IOSIntArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathRawNat192_mulWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *y, jint yOff, IOSIntArray *zz, jint zzOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mulAddToWithIntArray_withIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y, IOSIntArray *zz);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mulAddToWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *y, jint yOff, IOSIntArray *zz, jint zzOff);

FOUNDATION_EXPORT jlong OrgBouncycastleMathRawNat192_mul33AddWithInt_withIntArray_withInt_withIntArray_withInt_withIntArray_withInt_(jint w, IOSIntArray *x, jint xOff, IOSIntArray *y, jint yOff, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mulWordAddExtWithInt_withIntArray_withInt_withIntArray_withInt_(jint x, IOSIntArray *yy, jint yyOff, IOSIntArray *zz, jint zzOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mul33DWordAddWithInt_withLong_withIntArray_withInt_(jint x, jlong y, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mul33WordAddWithInt_withInt_withIntArray_withInt_(jint x, jint y, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mulWordDwordAddWithInt_withLong_withIntArray_withInt_(jint x, jlong y, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_mulWordWithInt_withIntArray_withIntArray_withInt_(jint x, IOSIntArray *y, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT void OrgBouncycastleMathRawNat192_squareWithIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *zz);

FOUNDATION_EXPORT void OrgBouncycastleMathRawNat192_squareWithIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *zz, jint zzOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_subWithIntArray_withIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y, IOSIntArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_subWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *y, jint yOff, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_subBothFromWithIntArray_withIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *y, IOSIntArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_subFromWithIntArray_withIntArray_(IOSIntArray *x, IOSIntArray *z);

FOUNDATION_EXPORT jint OrgBouncycastleMathRawNat192_subFromWithIntArray_withInt_withIntArray_withInt_(IOSIntArray *x, jint xOff, IOSIntArray *z, jint zOff);

FOUNDATION_EXPORT JavaMathBigInteger *OrgBouncycastleMathRawNat192_toBigIntegerWithIntArray_(IOSIntArray *x);

FOUNDATION_EXPORT void OrgBouncycastleMathRawNat192_zeroWithIntArray_(IOSIntArray *z);

J2OBJC_STATIC_FIELD_GETTER(OrgBouncycastleMathRawNat192, M, jlong)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathRawNat192)

#endif // _OrgBouncycastleMathRawNat192_H_
