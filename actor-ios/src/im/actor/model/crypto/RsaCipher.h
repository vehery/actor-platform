//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/crypto/RsaCipher.java
//

#ifndef _AMRsaCipher_H_
#define _AMRsaCipher_H_

@class IOSByteArray;

#include "J2ObjC_header.h"
#include "im/actor/model/crypto/RsaEncryptCipher.h"

@protocol AMRsaCipher < AMRsaEncryptCipher, NSObject, JavaObject >
- (IOSByteArray *)decryptWithByteArray:(IOSByteArray *)sourceData;

@end

J2OBJC_EMPTY_STATIC_INIT(AMRsaCipher)

#define ImActorModelCryptoRsaCipher AMRsaCipher

J2OBJC_TYPE_LITERAL_HEADER(AMRsaCipher)

#endif // _AMRsaCipher_H_
