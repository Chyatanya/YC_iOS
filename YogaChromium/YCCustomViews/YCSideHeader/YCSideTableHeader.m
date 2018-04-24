//
//  YCSideTableHeader.m
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCSideTableHeader.h"

@implementation YCSideTableHeader

-(instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self xibSetup];
    }
    return self;
}
-(void)xibSetup {
    UIView *view;
    view = [[[NSBundle mainBundle] loadNibNamed:@"YCSideTableHeader" owner:self options:nil] objectAtIndex:0];
    view.frame = self.bounds;
    NSLog(@"view.frame : %@ && self.Frame %@",view,self);
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    [self.gradientView applyGradientEffectWithColor:COLOR_THEME viewFrame:view.frame bottomColor:COLOR_SPECIFIC];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
