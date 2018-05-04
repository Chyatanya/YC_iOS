//
//  UIView+YCView.m
//  YogaChromium
//
//  Created by chyatanya on 30/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "UIView+YCView.h"

@implementation UIView (YCView)
-(void)setRoundedCorner:(CGFloat)radious borderWith:(CGFloat)width borderColor:(UIColor*)color {
    self.layer.cornerRadius = radious;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}
@end
