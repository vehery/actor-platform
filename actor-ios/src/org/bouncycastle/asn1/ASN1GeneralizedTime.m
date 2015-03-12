//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/org/bouncycastle/asn1/ASN1GeneralizedTime.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/io/IOException.h"
#include "java/lang/Exception.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/Integer.h"
#include "java/text/ParseException.h"
#include "java/text/SimpleDateFormat.h"
#include "java/util/Date.h"
#include "java/util/Locale.h"
#include "java/util/SimpleTimeZone.h"
#include "java/util/TimeZone.h"
#include "org/bouncycastle/asn1/ASN1GeneralizedTime.h"
#include "org/bouncycastle/asn1/ASN1OctetString.h"
#include "org/bouncycastle/asn1/ASN1OutputStream.h"
#include "org/bouncycastle/asn1/ASN1Primitive.h"
#include "org/bouncycastle/asn1/ASN1TaggedObject.h"
#include "org/bouncycastle/asn1/BERTags.h"
#include "org/bouncycastle/asn1/StreamUtil.h"
#include "org/bouncycastle/util/Arrays.h"
#include "org/bouncycastle/util/Strings.h"

__attribute__((unused)) static NSString *OrgBouncycastleAsn1ASN1GeneralizedTime_calculateGMTOffset(OrgBouncycastleAsn1ASN1GeneralizedTime *self);
__attribute__((unused)) static NSString *OrgBouncycastleAsn1ASN1GeneralizedTime_convertWithInt_(OrgBouncycastleAsn1ASN1GeneralizedTime *self, jint time);
__attribute__((unused)) static jboolean OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(OrgBouncycastleAsn1ASN1GeneralizedTime *self);

@interface OrgBouncycastleAsn1ASN1GeneralizedTime () {
 @public
  IOSByteArray *time_;
}

- (NSString *)calculateGMTOffset;

- (NSString *)convertWithInt:(jint)time;

- (jboolean)hasFractionalSeconds;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleAsn1ASN1GeneralizedTime, time_, IOSByteArray *)

@implementation OrgBouncycastleAsn1ASN1GeneralizedTime

+ (OrgBouncycastleAsn1ASN1GeneralizedTime *)getInstanceWithId:(id)obj {
  return OrgBouncycastleAsn1ASN1GeneralizedTime_getInstanceWithId_(obj);
}

+ (OrgBouncycastleAsn1ASN1GeneralizedTime *)getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject:(OrgBouncycastleAsn1ASN1TaggedObject *)obj
                                                                                   withBoolean:(jboolean)explicit_ {
  return OrgBouncycastleAsn1ASN1GeneralizedTime_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(obj, explicit_);
}

- (instancetype)initWithNSString:(NSString *)time {
  if (self = [super init]) {
    self->time_ = OrgBouncycastleUtilStrings_toByteArrayWithNSString_(time);
    @try {
      (void) [self getDate];
    }
    @catch (JavaTextParseException *e) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:JreStrcat("$$", @"invalid date string: ", [((JavaTextParseException *) nil_chk(e)) getMessage])];
    }
  }
  return self;
}

- (instancetype)initWithJavaUtilDate:(JavaUtilDate *)time {
  if (self = [super init]) {
    JavaTextSimpleDateFormat *dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss'Z'"];
    [dateF setTimeZoneWithJavaUtilTimeZone:[[JavaUtilSimpleTimeZone alloc] initWithInt:0 withNSString:@"Z"]];
    self->time_ = OrgBouncycastleUtilStrings_toByteArrayWithNSString_([dateF formatWithJavaUtilDate:time]);
  }
  return self;
}

- (instancetype)initWithJavaUtilDate:(JavaUtilDate *)time
                  withJavaUtilLocale:(JavaUtilLocale *)locale {
  if (self = [super init]) {
    JavaTextSimpleDateFormat *dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss'Z'" withJavaUtilLocale:locale];
    [dateF setTimeZoneWithJavaUtilTimeZone:[[JavaUtilSimpleTimeZone alloc] initWithInt:0 withNSString:@"Z"]];
    self->time_ = OrgBouncycastleUtilStrings_toByteArrayWithNSString_([dateF formatWithJavaUtilDate:time]);
  }
  return self;
}

- (instancetype)initWithByteArray:(IOSByteArray *)bytes {
  if (self = [super init]) {
    self->time_ = bytes;
  }
  return self;
}

- (NSString *)getTimeString {
  return OrgBouncycastleUtilStrings_fromByteArrayWithByteArray_(time_);
}

- (NSString *)getTime {
  NSString *stime = OrgBouncycastleUtilStrings_fromByteArrayWithByteArray_(time_);
  if ([stime charAtWithInt:((jint) [((NSString *) nil_chk(stime)) length]) - 1] == 'Z') {
    return JreStrcat("$$", [stime substring:0 endIndex:((jint) [stime length]) - 1], @"GMT+00:00");
  }
  else {
    jint signPos = ((jint) [stime length]) - 5;
    jchar sign = [stime charAtWithInt:signPos];
    if (sign == '-' || sign == '+') {
      return JreStrcat("$$$C$", [stime substring:0 endIndex:signPos], @"GMT", [stime substring:signPos endIndex:signPos + 3], ':', [stime substring:signPos + 3]);
    }
    else {
      signPos = ((jint) [stime length]) - 3;
      sign = [stime charAtWithInt:signPos];
      if (sign == '-' || sign == '+') {
        return JreStrcat("$$$$", [stime substring:0 endIndex:signPos], @"GMT", [stime substring:signPos], @":00");
      }
    }
  }
  return JreStrcat("$$", stime, OrgBouncycastleAsn1ASN1GeneralizedTime_calculateGMTOffset(self));
}

- (NSString *)calculateGMTOffset {
  return OrgBouncycastleAsn1ASN1GeneralizedTime_calculateGMTOffset(self);
}

- (NSString *)convertWithInt:(jint)time {
  return OrgBouncycastleAsn1ASN1GeneralizedTime_convertWithInt_(self, time);
}

- (JavaUtilDate *)getDate {
  JavaTextSimpleDateFormat *dateF;
  NSString *stime = OrgBouncycastleUtilStrings_fromByteArrayWithByteArray_(time_);
  NSString *d = stime;
  if ([((NSString *) nil_chk(stime)) hasSuffix:@"Z"]) {
    if (OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(self)) {
      dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss.SSS'Z'"];
    }
    else {
      dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss'Z'"];
    }
    [((JavaTextSimpleDateFormat *) nil_chk(dateF)) setTimeZoneWithJavaUtilTimeZone:[[JavaUtilSimpleTimeZone alloc] initWithInt:0 withNSString:@"Z"]];
  }
  else if ([stime indexOf:'-'] > 0 || [stime indexOf:'+'] > 0) {
    d = [self getTime];
    if (OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(self)) {
      dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss.SSSz"];
    }
    else {
      dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmssz"];
    }
    [((JavaTextSimpleDateFormat *) nil_chk(dateF)) setTimeZoneWithJavaUtilTimeZone:[[JavaUtilSimpleTimeZone alloc] initWithInt:0 withNSString:@"Z"]];
  }
  else {
    if (OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(self)) {
      dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss.SSS"];
    }
    else {
      dateF = [[JavaTextSimpleDateFormat alloc] initWithNSString:@"yyyyMMddHHmmss"];
    }
    [((JavaTextSimpleDateFormat *) nil_chk(dateF)) setTimeZoneWithJavaUtilTimeZone:[[JavaUtilSimpleTimeZone alloc] initWithInt:0 withNSString:[((JavaUtilTimeZone *) nil_chk(JavaUtilTimeZone_getDefault())) getID]]];
  }
  if (OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(self)) {
    NSString *frac = [((NSString *) nil_chk(d)) substring:14];
    jint index;
    for (index = 1; index < ((jint) [((NSString *) nil_chk(frac)) length]); index++) {
      jchar ch = [frac charAtWithInt:index];
      if (!('0' <= ch && ch <= '9')) {
        break;
      }
    }
    if (index - 1 > 3) {
      frac = JreStrcat("$$", [frac substring:0 endIndex:4], [frac substring:index]);
      d = JreStrcat("$$", [d substring:0 endIndex:14], frac);
    }
    else if (index - 1 == 1) {
      frac = JreStrcat("$$$", [frac substring:0 endIndex:index], @"00", [frac substring:index]);
      d = JreStrcat("$$", [d substring:0 endIndex:14], frac);
    }
    else if (index - 1 == 2) {
      frac = JreStrcat("$C$", [frac substring:0 endIndex:index], '0', [frac substring:index]);
      d = JreStrcat("$$", [d substring:0 endIndex:14], frac);
    }
  }
  return [((JavaTextSimpleDateFormat *) nil_chk(dateF)) parseWithNSString:d];
}

- (jboolean)hasFractionalSeconds {
  return OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(self);
}

- (jboolean)isConstructed {
  return NO;
}

- (jint)encodedLength {
  jint length = ((IOSByteArray *) nil_chk(time_))->size_;
  return 1 + OrgBouncycastleAsn1StreamUtil_calculateBodyLengthWithInt_(length) + length;
}

- (void)encodeWithOrgBouncycastleAsn1ASN1OutputStream:(OrgBouncycastleAsn1ASN1OutputStream *)outArg {
  [((OrgBouncycastleAsn1ASN1OutputStream *) nil_chk(outArg)) writeEncodedWithInt:OrgBouncycastleAsn1BERTags_GENERALIZED_TIME withByteArray:time_];
}

- (jboolean)asn1EqualsWithOrgBouncycastleAsn1ASN1Primitive:(OrgBouncycastleAsn1ASN1Primitive *)o {
  if (!([o isKindOfClass:[OrgBouncycastleAsn1ASN1GeneralizedTime class]])) {
    return NO;
  }
  return OrgBouncycastleUtilArrays_areEqualWithByteArray_withByteArray_(time_, ((OrgBouncycastleAsn1ASN1GeneralizedTime *) nil_chk(((OrgBouncycastleAsn1ASN1GeneralizedTime *) check_class_cast(o, [OrgBouncycastleAsn1ASN1GeneralizedTime class]))))->time_);
}

- (NSUInteger)hash {
  return OrgBouncycastleUtilArrays_hashCodeWithByteArray_(time_);
}

- (void)copyAllFieldsTo:(OrgBouncycastleAsn1ASN1GeneralizedTime *)other {
  [super copyAllFieldsTo:other];
  other->time_ = time_;
}

@end

OrgBouncycastleAsn1ASN1GeneralizedTime *OrgBouncycastleAsn1ASN1GeneralizedTime_getInstanceWithId_(id obj) {
  OrgBouncycastleAsn1ASN1GeneralizedTime_init();
  if (obj == nil || [obj isKindOfClass:[OrgBouncycastleAsn1ASN1GeneralizedTime class]]) {
    return (OrgBouncycastleAsn1ASN1GeneralizedTime *) check_class_cast(obj, [OrgBouncycastleAsn1ASN1GeneralizedTime class]);
  }
  if ([obj isKindOfClass:[IOSByteArray class]]) {
    @try {
      return (OrgBouncycastleAsn1ASN1GeneralizedTime *) check_class_cast(OrgBouncycastleAsn1ASN1Primitive_fromByteArrayWithByteArray_((IOSByteArray *) check_class_cast(obj, [IOSByteArray class])), [OrgBouncycastleAsn1ASN1GeneralizedTime class]);
    }
    @catch (JavaLangException *e) {
      @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:JreStrcat("$$", @"encoding error in getInstance: ", [((JavaLangException *) nil_chk(e)) description])];
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:JreStrcat("$$", @"illegal object in getInstance: ", [[nil_chk(obj) getClass] getName])];
}

OrgBouncycastleAsn1ASN1GeneralizedTime *OrgBouncycastleAsn1ASN1GeneralizedTime_getInstanceWithOrgBouncycastleAsn1ASN1TaggedObject_withBoolean_(OrgBouncycastleAsn1ASN1TaggedObject *obj, jboolean explicit_) {
  OrgBouncycastleAsn1ASN1GeneralizedTime_init();
  OrgBouncycastleAsn1ASN1Primitive *o = [((OrgBouncycastleAsn1ASN1TaggedObject *) nil_chk(obj)) getObject];
  if (explicit_ || [o isKindOfClass:[OrgBouncycastleAsn1ASN1GeneralizedTime class]]) {
    return OrgBouncycastleAsn1ASN1GeneralizedTime_getInstanceWithId_(o);
  }
  else {
    return [[OrgBouncycastleAsn1ASN1GeneralizedTime alloc] initWithByteArray:[((OrgBouncycastleAsn1ASN1OctetString *) nil_chk(((OrgBouncycastleAsn1ASN1OctetString *) check_class_cast(o, [OrgBouncycastleAsn1ASN1OctetString class])))) getOctets]];
  }
}

NSString *OrgBouncycastleAsn1ASN1GeneralizedTime_calculateGMTOffset(OrgBouncycastleAsn1ASN1GeneralizedTime *self) {
  NSString *sign = @"+";
  JavaUtilTimeZone *timeZone = JavaUtilTimeZone_getDefault();
  jint offset = [((JavaUtilTimeZone *) nil_chk(timeZone)) getRawOffset];
  if (offset < 0) {
    sign = @"-";
    offset = -offset;
  }
  jint hours = offset / (60 * 60 * 1000);
  jint minutes = (offset - (hours * 60 * 60 * 1000)) / (60 * 1000);
  @try {
    if ([timeZone useDaylightTime] && [timeZone inDaylightTimeWithJavaUtilDate:[self getDate]]) {
      hours += [sign isEqual:@"+"] ? 1 : -1;
    }
  }
  @catch (JavaTextParseException *e) {
  }
  return JreStrcat("$$$C$", @"GMT", sign, OrgBouncycastleAsn1ASN1GeneralizedTime_convertWithInt_(self, hours), ':', OrgBouncycastleAsn1ASN1GeneralizedTime_convertWithInt_(self, minutes));
}

NSString *OrgBouncycastleAsn1ASN1GeneralizedTime_convertWithInt_(OrgBouncycastleAsn1ASN1GeneralizedTime *self, jint time) {
  if (time < 10) {
    return JreStrcat("CI", '0', time);
  }
  return JavaLangInteger_toStringWithInt_(time);
}

jboolean OrgBouncycastleAsn1ASN1GeneralizedTime_hasFractionalSeconds(OrgBouncycastleAsn1ASN1GeneralizedTime *self) {
  for (jint i = 0; i != ((IOSByteArray *) nil_chk(self->time_))->size_; i++) {
    if (IOSByteArray_Get(self->time_, i) == '.') {
      if (i == 14) {
        return YES;
      }
    }
  }
  return NO;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleAsn1ASN1GeneralizedTime)
