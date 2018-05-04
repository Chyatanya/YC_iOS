//
//  YCGradientView.m
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCGradientView.h"

@implementation YCGradientView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

-(void)applyGradientEffectWithColor:(UIColor *)color viewFrame:(CGRect)frame bottomColor:(UIColor *)bottomColor {
    [self removePreviousLayers];
    //    self.backgroundColor = color;
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    NSArray *colors =  [NSArray arrayWithObjects:(id)color.CGColor, bottomColor.CGColor, nil];
    gradientLayer.colors = colors;
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    [self.layer insertSublayer:gradientLayer atIndex:0];
}
-(void)applyHorizantalGradientEffectWithColor:(UIColor *)color viewFrame:(CGRect)frame bottomColor:(UIColor *)bottomColor {
    [self removePreviousLayers];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    NSArray *colors =  [NSArray arrayWithObjects:(id)color.CGColor, bottomColor.CGColor, nil];
    gradientLayer.colors = colors;
    gradientLayer.locations = @[@0.0, @1.0];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}
-(void)removePreviousLayers {
    CAGradientLayer *layerToRemove;
    for (CALayer *aLayer in self.layer.sublayers) {
        if ([aLayer isKindOfClass:[CAGradientLayer class]]) {
            layerToRemove = (CAGradientLayer *)aLayer;
        }
    }
    if (layerToRemove != nil) {
        [layerToRemove removeFromSuperlayer];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
