//
//  NSString+Extensions.h
//  app
//
//  Created by 余钦 on 2017/3/2.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)
- (NSString *)encodeString:(NSString*)unencodedString;
- (NSString *)decodeString:(NSString*)encodedString;
- (NSString *)stringWithJsonObject:(id)jsonObj;
- (NSString *)stringByDecimalNumberStrForFixFund:(NSString *)string;
- (NSString *)stringByDecimalNumberStrForFundation:(NSString *)string;
- (NSString *)stringFormatWithMoney:(double)money;
- (NSString *)stringFormatWithLimitAmount:(NSString *)limitAmountStr;
@end
