//
//  UIColor+YCColor.h
//  YogaChromium
//
//  Created by chyatanya on 02/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YCColor)
+ (UIColor *)colorWithHex:(UInt32)color;
+ (UIColor *)colorWithHexString:(NSString *)hexaColorString;
@end
