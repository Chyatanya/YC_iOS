//
//  YCGradientView.h
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCGradientView : UIView
-(void)applyGradientEffectWithColor:(UIColor *)color viewFrame:(CGRect)frame bottomColor:(UIColor *)bottomColor;
-(void)applyHorizantalGradientEffectWithColor:(UIColor *)color viewFrame:(CGRect)frame bottomColor:(UIColor *)bottomColor;

@end
