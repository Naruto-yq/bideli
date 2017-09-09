//
//  NSString+Extensions.m
//  app
//
//  Created by 余钦 on 2017/3/2.
//
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)
-(NSString *)encodeString:(NSString*)unencodedString{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

-(NSString *)decodeString:(NSString*)encodedString
{
    NSString *decodedString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                    (__bridge CFStringRef)encodedString,CFSTR(""),
                                                                                                                    CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

- (NSString *)stringWithJsonObject:(id)jsonObj {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObj options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSString *)stringByDecimalNumberStrForFixFund:(NSString *)string {
    NSDecimalNumberHandler *handleRound = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *handleRoundNum = [NSDecimalNumber decimalNumberWithString:string];
    handleRoundNum = [handleRoundNum decimalNumberByRoundingAccordingToBehavior:handleRound];
    NSString *deciStr = [NSString stringWithFormat:@"%@", handleRoundNum];
    
    if ([deciStr rangeOfString:@"."].length == 0) {
        deciStr = [deciStr stringByAppendingString:@".00"];
    }else{
        NSRange range = [deciStr rangeOfString:@"."];
        if (deciStr.length-range.location-1 == 2) {
            
        }else{
            deciStr = [deciStr stringByAppendingString:@"0"];
        }
    }
    return deciStr;
}

- (NSString *)stringByDecimalNumberStrForFundation:(NSString *)string {
    NSDecimalNumberHandler *handleRound = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *handleRoundNum = [NSDecimalNumber decimalNumberWithString:string];
    NSDecimalNumber *multiplyNum = [NSDecimalNumber decimalNumberWithString:@"100"];
    handleRoundNum = [handleRoundNum  decimalNumberByMultiplyingBy:multiplyNum];
    handleRoundNum = [handleRoundNum decimalNumberByRoundingAccordingToBehavior:handleRound];
    NSString *deciStr = [NSString stringWithFormat:@"%@", handleRoundNum];
    
    if ([deciStr rangeOfString:@"."].length == 0) {
        deciStr = [deciStr stringByAppendingString:@".00"];
    }else{
        NSRange range = [deciStr rangeOfString:@"."];
        if (deciStr.length-range.location-1 == 2) {
            
        }else{
            deciStr = [deciStr stringByAppendingString:@"0"];
        }
    }
    return deciStr;
}

- (NSString *)stringFormatWithMoney:(double)money {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithDouble:money]];
    
    return newAmount;
}

- (NSString *)stringFormatWithLimitAmount:(NSString *)limitAmountStr {
    float limitAmount = [limitAmountStr floatValue];
    
    int nLimitAmount = limitAmount/1000;
    
    float formatValue = (float)nLimitAmount/10;
    
    NSString *formatValueStr = [NSString stringWithFormat:@"%.1f", formatValue];
    
    NSRange dotRange = [formatValueStr rangeOfString:@"."];
    
    NSString *dotBehindStr = [formatValueStr substringFromIndex:dotRange.location+1];
    
    NSInteger nDotBehindValue = [dotBehindStr integerValue];
    
    if (nDotBehindValue == 0) {
        if (formatValue < 0.1) {
            return @"--";
        }
        return [formatValueStr substringToIndex:dotRange.location];
    }else {
        return [NSString stringWithFormat:@"%.1f", formatValue];
    }
}
@end
