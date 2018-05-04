//
//  YCDetailTableViewCell.m
//  YogaChromium
//
//  Created by chyatanya on 03/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCDetailTableViewCell.h"

@implementation YCDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadDetailValues:(YCDetailModel*)model atIndex:(NSIndexPath*)index {
    NSString * contentString = [NSString stringWithFormat:@"%@\n%@\n%@",model.heading,model.content,model.type];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    self.labelText.numberOfLines = 0;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 1.5;
    UIFont * labelFont = [UIFont fontWithName:@"Helvetica" size:12];
    UIColor * heading_Color = [UIColor colorWithHexString:model.heading_color];
    NSAttributedString *labelText = [[NSAttributedString alloc] initWithString : contentString
                                                                    attributes : @{
                                                                                   NSParagraphStyleAttributeName : paragraphStyle,
                                                                                   NSFontAttributeName : labelFont,
                                                                                   NSForegroundColorAttributeName : [UIColor blueColor]}];
    NSMutableAttributedString *coloredText = [[NSMutableAttributedString alloc] initWithAttributedString:labelText];
    [coloredText addAttribute:NSForegroundColorAttributeName value:heading_Color range:[contentString rangeOfString:model.heading]];
    [coloredText addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:[contentString rangeOfString:model.heading]];
    
    [self.labelText setAttributedText:coloredText];
}
@end
