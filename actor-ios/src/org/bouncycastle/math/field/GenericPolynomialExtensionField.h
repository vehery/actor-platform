//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/math/field/GenericPolynomialExtensionField.java
//

#ifndef _OrgBouncycastleMathFieldGenericPolynomialExtensionField_H_
#define _OrgBouncycastleMathFieldGenericPolynomialExtensionField_H_

@class JavaMathBigInteger;
@protocol OrgBouncycastleMathFieldFiniteField;
@protocol OrgBouncycastleMathFieldPolynomial;

#include "J2ObjC_header.h"
#include "org/bouncycastle/math/field/PolynomialExtensionField.h"

@interface OrgBouncycastleMathFieldGenericPolynomialExtensionField : NSObject < OrgBouncycastleMathFieldPolynomialExtensionField > {
 @public
  id<OrgBouncycastleMathFieldFiniteField> subfield_;
  id<OrgBouncycastleMathFieldPolynomial> minimalPolynomial_;
}

- (instancetype)initWithOrgBouncycastleMathFieldFiniteField:(id<OrgBouncycastleMathFieldFiniteField>)subfield
                     withOrgBouncycastleMathFieldPolynomial:(id<OrgBouncycastleMathFieldPolynomial>)polynomial;

- (JavaMathBigInteger *)getCharacteristic;

- (jint)getDimension;

- (id<OrgBouncycastleMathFieldFiniteField>)getSubfield;

- (jint)getDegree;

- (id<OrgBouncycastleMathFieldPolynomial>)getMinimalPolynomial;

- (jboolean)isEqual:(id)obj;

- (NSUInteger)hash;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleMathFieldGenericPolynomialExtensionField)

J2OBJC_FIELD_SETTER(OrgBouncycastleMathFieldGenericPolynomialExtensionField, subfield_, id<OrgBouncycastleMathFieldFiniteField>)
J2OBJC_FIELD_SETTER(OrgBouncycastleMathFieldGenericPolynomialExtensionField, minimalPolynomial_, id<OrgBouncycastleMathFieldPolynomial>)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleMathFieldGenericPolynomialExtensionField)

#endif // _OrgBouncycastleMathFieldGenericPolynomialExtensionField_H_
