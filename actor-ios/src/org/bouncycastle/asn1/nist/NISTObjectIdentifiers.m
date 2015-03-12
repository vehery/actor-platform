//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/nist/NISTObjectIdentifiers.java
//

#include "J2ObjC_source.h"
#include "org/bouncycastle/asn1/ASN1ObjectIdentifier.h"
#include "org/bouncycastle/asn1/nist/NISTObjectIdentifiers.h"

BOOL OrgBouncycastleAsn1NistNISTObjectIdentifiers_initialized = NO;

OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_nistAlgorithm_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha256_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha384_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha512_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha224_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha512_224_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha512_256_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_ECB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_OFB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_CFB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_wrap_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_GCM_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_CCM_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_ECB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_OFB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_CFB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_wrap_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_GCM_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_CCM_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_ECB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_CBC_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_OFB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_CFB_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_wrap_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_GCM_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_CCM_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_dsa_with_sha2_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha224_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha256_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha384_;
OrgBouncycastleAsn1ASN1ObjectIdentifier * OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha512_;

@implementation OrgBouncycastleAsn1NistNISTObjectIdentifiers

+ (void)initialize {
  if (self == [OrgBouncycastleAsn1NistNISTObjectIdentifiers class]) {
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_nistAlgorithm_ = [[OrgBouncycastleAsn1ASN1ObjectIdentifier alloc] initWithNSString:@"2.16.840.1.101.3.4"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_nistAlgorithm_ branchWithNSString:@"2"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha256_ = [((OrgBouncycastleAsn1ASN1ObjectIdentifier *) nil_chk(OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_)) branchWithNSString:@"1"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha384_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_ branchWithNSString:@"2"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha512_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_ branchWithNSString:@"3"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha224_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_ branchWithNSString:@"4"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha512_224_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_ branchWithNSString:@"5"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_sha512_256_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_hashAlgs_ branchWithNSString:@"6"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_nistAlgorithm_ branchWithNSString:@"1"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_ECB_ = [((OrgBouncycastleAsn1ASN1ObjectIdentifier *) nil_chk(OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_)) branchWithNSString:@"1"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_CBC_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"2"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_OFB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"3"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_CFB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"4"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_wrap_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"5"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_GCM_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"6"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes128_CCM_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"7"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_ECB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"21"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_CBC_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"22"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_OFB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"23"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_CFB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"24"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_wrap_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"25"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_GCM_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"26"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes192_CCM_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"27"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_ECB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"41"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_CBC_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"42"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_OFB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"43"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_CFB_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"44"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_wrap_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"45"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_GCM_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"46"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_aes256_CCM_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_aes_ branchWithNSString:@"47"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_dsa_with_sha2_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_nistAlgorithm_ branchWithNSString:@"3"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha224_ = [((OrgBouncycastleAsn1ASN1ObjectIdentifier *) nil_chk(OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_dsa_with_sha2_)) branchWithNSString:@"1"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha256_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_dsa_with_sha2_ branchWithNSString:@"2"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha384_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_dsa_with_sha2_ branchWithNSString:@"3"];
    OrgBouncycastleAsn1NistNISTObjectIdentifiers_dsa_with_sha512_ = [OrgBouncycastleAsn1NistNISTObjectIdentifiers_id_dsa_with_sha2_ branchWithNSString:@"4"];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleAsn1NistNISTObjectIdentifiers)
  }
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1NistNISTObjectIdentifiers)
