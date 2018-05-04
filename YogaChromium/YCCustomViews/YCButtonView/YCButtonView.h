//
//  YCButtonView.h
//  YogaChromium
//
//  Created by chyatanya on 13/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCButtonView : UIView
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *buttonAction;
- (IBAction)clickedOnButton:(UIButton *)sender;
-(void)setRoundedViewCorner:(CGFloat)radious borderWith:(CGFloat)width borderColor:(UIColor*)color;
// YCbutton
@property(readwrite, nonatomic, copy) YCButtonViewTargetCompletionHandler buttonClickTaskCompletion;
@end
