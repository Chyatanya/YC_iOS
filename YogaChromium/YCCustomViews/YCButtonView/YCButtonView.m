//
//  YCButtonView.m
//  YogaChromium
//
//  Created by chyatanya on 13/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCButtonView.h"

@implementation YCButtonView


#pragma mark - Initial Setup
- (id)initWithFrame:(CGRect)aRect
{
    if ((self = [super initWithFrame:aRect])) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
    if ((self = [super initWithCoder:coder])) {
        [self xibSetup];
    }
    return self;
}
-(void)xibSetup {
    UIView *view;
    view = [[[NSBundle mainBundle] loadNibNamed:@"YCButtonView" owner:self options:nil] objectAtIndex:0];
    view.frame = self.bounds;
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    [self buttonAction].tintColor = [UIColor clearColor];
    [self.labelTitle sizeToFit];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)clickedOnButton:(UIButton *)sender {
    if (self.buttonClickTaskCompletion != nil) {
        self.buttonClickTaskCompletion(sender);
    }
}
-(void)setRoundedViewCorner:(CGFloat)radious borderWith:(CGFloat)width borderColor:(UIColor*)color {
    [self setRoundedCorner:radious borderWith:width borderColor:color];
}
@end
