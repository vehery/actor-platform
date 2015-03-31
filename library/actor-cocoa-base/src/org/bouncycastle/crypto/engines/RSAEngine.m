//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/crypto/engines/RSAEngine.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/crypto/engines/RSAEngine.java"

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/IllegalStateException.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/crypto/engines/RSACoreEngine.h"
#include "org/bouncycastle/crypto/engines/RSAEngine.h"
#include "org/bouncycastle/crypto/params/ParametersWithRandom.h"

@interface OrgBouncycastleCryptoEnginesRSAEngine () {
 @public
  OrgBouncycastleCryptoEnginesRSACoreEngine *core_;
}
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoEnginesRSAEngine, core_, OrgBouncycastleCryptoEnginesRSACoreEngine *)


#line 11
@implementation OrgBouncycastleCryptoEnginesRSAEngine


#line 21
- (void)init__WithBoolean:(jboolean)forEncryption
withOrgBouncycastleCryptoParamsParametersWithRandom:(OrgBouncycastleCryptoParamsParametersWithRandom *)param {
  
#line 24
  if (core_ == nil) {
    core_ = [[OrgBouncycastleCryptoEnginesRSACoreEngine alloc] init];
  }
  
#line 28
  [((OrgBouncycastleCryptoEnginesRSACoreEngine *) nil_chk(core_)) init__WithBoolean:forEncryption withOrgBouncycastleCryptoParamsParametersWithRandom:param];
}


#line 38
- (jint)getInputBlockSize {
  
#line 39
  return [((OrgBouncycastleCryptoEnginesRSACoreEngine *) nil_chk(core_)) getInputBlockSize];
}


#line 49
- (jint)getOutputBlockSize {
  
#line 50
  return [((OrgBouncycastleCryptoEnginesRSACoreEngine *) nil_chk(core_)) getOutputBlockSize];
}


#line 62
- (IOSByteArray *)processBlockWithByteArray:(IOSByteArray *)inArg
                                    withInt:(jint)inOff
                                    withInt:(jint)inLen {
  
#line 66
  if (core_ == nil) {
    @throw [[JavaLangIllegalStateException alloc] initWithNSString:@"RSA engine not initialised"];
  }
  
#line 70
  return [core_ convertOutputWithJavaMathBigInteger:[core_ processBlockWithJavaMathBigInteger:[((OrgBouncycastleCryptoEnginesRSACoreEngine *) nil_chk(core_)) convertInputWithByteArray:inArg withInt:inOff withInt:inLen]]];
}

- (instancetype)init {
  return [super init];
}

- (void)copyAllFieldsTo:(OrgBouncycastleCryptoEnginesRSAEngine *)other {
  [super copyAllFieldsTo:other];
  other->core_ = core_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoEnginesRSAEngine)
