//
//  UIColor+YCColor.m
//  YogaChromium
//
//  Created by chyatanya on 02/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "UIColor+YCColor.h"

@implementation UIColor (YCColor)
+ (UIColor *)colorWithHexString:(NSString *)hexaColorString {
    const char *cStr = [hexaColorString cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor colorWithHex:(UInt32)x];
}
+ (UIColor *)colorWithHex:(UInt32)color {
    unsigned char r, g, b;
    b = color & 0xFF;
    g = (color >> 8) & 0xFF;
    r = (color >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}
@end
