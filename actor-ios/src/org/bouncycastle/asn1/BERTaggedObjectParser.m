//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/BERTaggedObjectParser.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "java/io/IOException.h"
#include "org/bouncycastle/asn1/ASN1Encodable.h"
#include "org/bouncycastle/asn1/ASN1ParsingException.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1StreamParser.h"
#include "org/bouncycastle/asn1/BERTaggedObjectParser.h"

@interface OrgBouncycastleAsn1BERTaggedObjectParser () {
 @public
  jboolean _constructed_;
  jint _tagNumber_;
  OrgBouncycastleAsn1ASN1StreamParser *_parser_;
}
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1BERTaggedObjectParser, _parser_, OrgBouncycastleAsn1ASN1StreamParser *)

@implementation OrgBouncycastleAsn1BERTaggedObjectParser

- (instancetype)initWithBoolean:(jboolean)constructed
                        withInt:(jint)tagNumber
withOrgBouncycastleAsn1ASN1StreamParser:(OrgBouncycastleAsn1ASN1StreamParser *)parser {
  if (self = [super init]) {
    _constructed_ = constructed;
    _tagNumber_ = tagNumber;
    _parser_ = parser;
  }
  return self;
}

- (jboolean)isConstructed {
  return _constructed_;
}

- (jint)getTagNo {
  return _tagNumber_;
}

- (id<OrgBouncycastleAsn1ASN1Encodable>)getObjectParserWithInt:(jint)tag
                                                   withBoolean:(jboolean)isExplicit {
  if (isExplicit) {
    if (!_constructed_) {
      @throw [[JavaIoIOException alloc] initWithNSString:@"Explicit tags must be constructed (see X.690 8.14.2)"];
    }
    return [((OrgBouncycastleAsn1ASN1StreamParser *) nil_chk(_parser_)) readObject];
  }
  return [((OrgBouncycastleAsn1ASN1StreamParser *) nil_chk(_parser_)) readImplicitWithBoolean:_constructed_ withInt:tag];
}

- (OrgBouncycastleAsn1ASN1Primitive *)getLoadedObject {
  return [((OrgBouncycastleAsn1ASN1StreamParser *) nil_chk(_parser_)) readTaggedObjectWithBoolean:_constructed_ withInt:_tagNumber_];
}

- (OrgBouncycastleAsn1ASN1Primitive *)toASN1Primitive {
  @try {
    return [self getLoadedObject];
  }
  @catch (JavaIoIOException *e) {
    @throw [[OrgBouncycastleAsn1ASN1ParsingException alloc] initWithNSString:[((JavaIoIOException *) nil_chk(e)) getMessage]];
  }
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1BERTaggedObjectParser *)other {
  [super copyAllFieldsTo:other];
  other->_constructed_ = _constructed_;
  other->_tagNumber_ = _tagNumber_;
  other->_parser_ = _parser_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1BERTaggedObjectParser)
