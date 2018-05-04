//
//  YCMainCollectionViewCell.m
//  YogaChromium
//
//  Created by chyatanya on 27/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainCollectionViewCell.h"

@implementation YCMainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)updateMainInfo:(NSString *)urlString atIndexPath:(NSIndexPath *)indexPath {
    [self.contentView setBackgroundColor:COLOR_SPECIFIC];
    [self.imageViewSlide sd_setShowActivityIndicatorView:YES];
    [self.imageViewSlide sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.imageViewSlide sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:nil];
}
@end
