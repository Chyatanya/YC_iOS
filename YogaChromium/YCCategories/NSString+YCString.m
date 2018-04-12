//
//  NSString+YCString.m
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "NSString+YCString.h"

@implementation NSString (YCString)
-(BOOL)isYCStringEmpty {
    // Return true if it is empty or nil
    if (self == nil || !self.length) {
        return YES;
    } else {
        return NO;
    }
}
-(NSString *)removeWhiteSpaces {
    NSMutableString * textViewString = [[NSMutableString alloc]initWithString:[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    return textViewString;
}
+(NSString *)getStringWithoutNull:(NSString *)valueString {
    if(valueString && ![valueString isKindOfClass:[NSNull class]]) {
        return valueString;
    }
    return @"";
}
@end
