//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/math/raw/Mod.java
//


#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/System.h"
#include "java/util/Random.h"
#include "org/bouncycastle/math/raw/Mod.h"
#include "org/bouncycastle/math/raw/Nat.h"

@interface OrgBouncycastleMathRawMod ()

+ (void)inversionResultWithIntArray:(IOSIntArray *)p
                            withInt:(jint)ac
                       withIntArray:(IOSIntArray *)a
                       withIntArray:(IOSIntArray *)z;

+ (jint)inversionStepWithIntArray:(IOSIntArray *)p
                     withIntArray:(IOSIntArray *)u
                          withInt:(jint)uLen
                     withIntArray:(IOSIntArray *)x
                          withInt:(jint)xc;

+ (jint)getTrailingZeroesWithInt:(jint)x;

@end

__attribute__((unused)) static void OrgBouncycastleMathRawMod_inversionResultWithIntArray_withInt_withIntArray_withIntArray_(IOSIntArray *p, jint ac, IOSIntArray *a, IOSIntArray *z);

__attribute__((unused)) static jint OrgBouncycastleMathRawMod_inversionStepWithIntArray_withIntArray_withInt_withIntArray_withInt_(IOSIntArray *p, IOSIntArray *u, jint uLen, IOSIntArray *x, jint xc);

__attribute__((unused)) static jint OrgBouncycastleMathRawMod_getTrailingZeroesWithInt_(jint x);

@implementation OrgBouncycastleMathRawMod

+ (jint)inverse32WithInt:(jint)d {
  return OrgBouncycastleMathRawMod_inverse32WithInt_(d);
}

+ (void)invertWithIntArray:(IOSIntArray *)p
              withIntArray:(IOSIntArray *)x
              withIntArray:(IOSIntArray *)z {
  OrgBouncycastleMathRawMod_invertWithIntArray_withIntArray_withIntArray_(p, x, z);
}

+ (IOSIntArray *)randomWithIntArray:(IOSIntArray *)p {
  return OrgBouncycastleMathRawMod_randomWithIntArray_(p);
}

+ (void)addWithIntArray:(IOSIntArray *)p
           withIntArray:(IOSIntArray *)x
           withIntArray:(IOSIntArray *)y
           withIntArray:(IOSIntArray *)z {
  OrgBouncycastleMathRawMod_addWithIntArray_withIntArray_withIntArray_withIntArray_(p, x, y, z);
}

+ (void)subtractWithIntArray:(IOSIntArray *)p
                withIntArray:(IOSIntArray *)x
                withIntArray:(IOSIntArray *)y
                withIntArray:(IOSIntArray *)z {
  OrgBouncycastleMathRawMod_subtractWithIntArray_withIntArray_withIntArray_withIntArray_(p, x, y, z);
}

+ (void)inversionResultWithIntArray:(IOSIntArray *)p
                            withInt:(jint)ac
                       withIntArray:(IOSIntArray *)a
                       withIntArray:(IOSIntArray *)z {
  OrgBouncycastleMathRawMod_inversionResultWithIntArray_withInt_withIntArray_withIntArray_(p, ac, a, z);
}

+ (jint)inversionStepWithIntArray:(IOSIntArray *)p
                     withIntArray:(IOSIntArray *)u
                          withInt:(jint)uLen
                     withIntArray:(IOSIntArray *)x
                          withInt:(jint)xc {
  return OrgBouncycastleMathRawMod_inversionStepWithIntArray_withIntArray_withInt_withIntArray_withInt_(p, u, uLen, x, xc);
}

+ (jint)getTrailingZeroesWithInt:(jint)x {
  return OrgBouncycastleMathRawMod_getTrailingZeroesWithInt_(x);
}

- (instancetype)init {
  OrgBouncycastleMathRawMod_init(self);
  return self;
}

@end

jint OrgBouncycastleMathRawMod_inverse32WithInt_(jint d) {
  OrgBouncycastleMathRawMod_initialize();
  jint x = d;
  x *= 2 - d * x;
  x *= 2 - d * x;
  x *= 2 - d * x;
  x *= 2 - d * x;
  return x;
}

void OrgBouncycastleMathRawMod_invertWithIntArray_withIntArray_withIntArray_(IOSIntArray *p, IOSIntArray *x, IOSIntArray *z) {
  OrgBouncycastleMathRawMod_initialize();
  jint len = ((IOSIntArray *) nil_chk(p))->size_;
  if (OrgBouncycastleMathRawNat_isZeroWithInt_withIntArray_(len, x)) {
    @throw new_JavaLangIllegalArgumentException_initWithNSString_(@"'x' cannot be 0");
  }
  if (OrgBouncycastleMathRawNat_isOneWithInt_withIntArray_(len, x)) {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(x, 0, z, 0, len);
    return;
  }
  IOSIntArray *u = OrgBouncycastleMathRawNat_copy__WithInt_withIntArray_(len, x);
  IOSIntArray *a = OrgBouncycastleMathRawNat_createWithInt_(len);
  *IOSIntArray_GetRef(nil_chk(a), 0) = 1;
  jint ac = 0;
  if ((IOSIntArray_Get(nil_chk(u), 0) & 1) == 0) {
    ac = OrgBouncycastleMathRawMod_inversionStepWithIntArray_withIntArray_withInt_withIntArray_withInt_(p, u, len, a, ac);
  }
  if (OrgBouncycastleMathRawNat_isOneWithInt_withIntArray_(len, u)) {
    OrgBouncycastleMathRawMod_inversionResultWithIntArray_withInt_withIntArray_withIntArray_(p, ac, a, z);
    return;
  }
  IOSIntArray *v = OrgBouncycastleMathRawNat_copy__WithInt_withIntArray_(len, p);
  IOSIntArray *b = OrgBouncycastleMathRawNat_createWithInt_(len);
  jint bc = 0;
  jint uvLen = len;
  for (; ; ) {
    while (IOSIntArray_Get(u, uvLen - 1) == 0 && IOSIntArray_Get(nil_chk(v), uvLen - 1) == 0) {
      --uvLen;
    }
    if (OrgBouncycastleMathRawNat_gteWithInt_withIntArray_withIntArray_(uvLen, u, v)) {
      OrgBouncycastleMathRawNat_subFromWithInt_withIntArray_withIntArray_(uvLen, v, u);
      ac += OrgBouncycastleMathRawNat_subFromWithInt_withIntArray_withIntArray_(len, b, a) - bc;
      ac = OrgBouncycastleMathRawMod_inversionStepWithIntArray_withIntArray_withInt_withIntArray_withInt_(p, u, uvLen, a, ac);
      if (OrgBouncycastleMathRawNat_isOneWithInt_withIntArray_(uvLen, u)) {
        OrgBouncycastleMathRawMod_inversionResultWithIntArray_withInt_withIntArray_withIntArray_(p, ac, a, z);
        return;
      }
    }
    else {
      OrgBouncycastleMathRawNat_subFromWithInt_withIntArray_withIntArray_(uvLen, u, v);
      bc += OrgBouncycastleMathRawNat_subFromWithInt_withIntArray_withIntArray_(len, a, b) - ac;
      bc = OrgBouncycastleMathRawMod_inversionStepWithIntArray_withIntArray_withInt_withIntArray_withInt_(p, v, uvLen, b, bc);
      if (OrgBouncycastleMathRawNat_isOneWithInt_withIntArray_(uvLen, v)) {
        OrgBouncycastleMathRawMod_inversionResultWithIntArray_withInt_withIntArray_withIntArray_(p, bc, b, z);
        return;
      }
    }
  }
}

IOSIntArray *OrgBouncycastleMathRawMod_randomWithIntArray_(IOSIntArray *p) {
  OrgBouncycastleMathRawMod_initialize();
  jint len = ((IOSIntArray *) nil_chk(p))->size_;
  JavaUtilRandom *rand = new_JavaUtilRandom_init();
  IOSIntArray *s = OrgBouncycastleMathRawNat_createWithInt_(len);
  jint m = IOSIntArray_Get(p, len - 1);
  m |= URShift32(m, 1);
  m |= URShift32(m, 2);
  m |= URShift32(m, 4);
  m |= URShift32(m, 8);
  m |= URShift32(m, 16);
  do {
    for (jint i = 0; i != len; i++) {
      *IOSIntArray_GetRef(nil_chk(s), i) = [rand nextInt];
    }
    *IOSIntArray_GetRef(nil_chk(s), len - 1) &= m;
  }
  while (OrgBouncycastleMathRawNat_gteWithInt_withIntArray_withIntArray_(len, s, p));
  return s;
}

void OrgBouncycastleMathRawMod_addWithIntArray_withIntArray_withIntArray_withIntArray_(IOSIntArray *p, IOSIntArray *x, IOSIntArray *y, IOSIntArray *z) {
  OrgBouncycastleMathRawMod_initialize();
  jint len = ((IOSIntArray *) nil_chk(p))->size_;
  jint c = OrgBouncycastleMathRawNat_addWithInt_withIntArray_withIntArray_withIntArray_(len, x, y, z);
  if (c != 0) {
    OrgBouncycastleMathRawNat_subFromWithInt_withIntArray_withIntArray_(len, p, z);
  }
}

void OrgBouncycastleMathRawMod_subtractWithIntArray_withIntArray_withIntArray_withIntArray_(IOSIntArray *p, IOSIntArray *x, IOSIntArray *y, IOSIntArray *z) {
  OrgBouncycastleMathRawMod_initialize();
  jint len = ((IOSIntArray *) nil_chk(p))->size_;
  jint c = OrgBouncycastleMathRawNat_subWithInt_withIntArray_withIntArray_withIntArray_(len, x, y, z);
  if (c != 0) {
    OrgBouncycastleMathRawNat_addToWithInt_withIntArray_withIntArray_(len, p, z);
  }
}

void OrgBouncycastleMathRawMod_inversionResultWithIntArray_withInt_withIntArray_withIntArray_(IOSIntArray *p, jint ac, IOSIntArray *a, IOSIntArray *z) {
  OrgBouncycastleMathRawMod_initialize();
  if (ac < 0) {
    OrgBouncycastleMathRawNat_addWithInt_withIntArray_withIntArray_withIntArray_(((IOSIntArray *) nil_chk(p))->size_, a, p, z);
  }
  else {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a, 0, z, 0, ((IOSIntArray *) nil_chk(p))->size_);
  }
}

jint OrgBouncycastleMathRawMod_inversionStepWithIntArray_withIntArray_withInt_withIntArray_withInt_(IOSIntArray *p, IOSIntArray *u, jint uLen, IOSIntArray *x, jint xc) {
  OrgBouncycastleMathRawMod_initialize();
  jint len = ((IOSIntArray *) nil_chk(p))->size_;
  jint count = 0;
  while (IOSIntArray_Get(nil_chk(u), 0) == 0) {
    OrgBouncycastleMathRawNat_shiftDownWordWithInt_withIntArray_withInt_(uLen, u, 0);
    count += 32;
  }
  {
    jint zeroes = OrgBouncycastleMathRawMod_getTrailingZeroesWithInt_(IOSIntArray_Get(u, 0));
    if (zeroes > 0) {
      OrgBouncycastleMathRawNat_shiftDownBitsWithInt_withIntArray_withInt_withInt_(uLen, u, zeroes, 0);
      count += zeroes;
    }
  }
  for (jint i = 0; i < count; ++i) {
    if ((IOSIntArray_Get(nil_chk(x), 0) & 1) != 0) {
      if (xc < 0) {
        xc += OrgBouncycastleMathRawNat_addToWithInt_withIntArray_withIntArray_(len, p, x);
      }
      else {
        xc += OrgBouncycastleMathRawNat_subFromWithInt_withIntArray_withIntArray_(len, p, x);
      }
    }
    OrgBouncycastleMathRawNat_shiftDownBitWithInt_withIntArray_withInt_(len, x, xc);
  }
  return xc;
}

jint OrgBouncycastleMathRawMod_getTrailingZeroesWithInt_(jint x) {
  OrgBouncycastleMathRawMod_initialize();
  jint count = 0;
  while ((x & 1) == 0) {
    URShiftAssignInt(&x, 1);
    ++count;
  }
  return count;
}

void OrgBouncycastleMathRawMod_init(OrgBouncycastleMathRawMod *self) {
  (void) NSObject_init(self);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathRawMod)
