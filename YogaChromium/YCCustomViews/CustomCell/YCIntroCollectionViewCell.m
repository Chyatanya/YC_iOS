//
//  YCIntroCollectionViewCell.m
//  YogaChromium
//
//  Created by chyatanya on 13/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCIntroCollectionViewCell.h"

@implementation YCIntroCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    originalFrame = self.imageView.frame;
    // Initialization code
}
-(void)updateIntroModel:(YCIntroModel *)model atIndexPath:(NSIndexPath *)indexPath {
    if([model.typeString isEqualToString:@""] || [model.typeString isEqualToString:@""]){
        self.videoView.frame = CGRectZero;
        self.imageView.frame = CGRectZero;
        self.imageView.image = nil;
        [self.imageView setHidden:YES];
        [self.videoView setHidden:YES];

    } else if([model.typeString isEqualToString:@"image"]) {
        [self.imageView setHidden:NO];
        [self.videoView setHidden:YES];
        CGRect rect = self.imageView.frame;
        [self.imageView setFrame:rect];
        [self.imageView sd_setShowActivityIndicatorView:YES];
        [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.urlString] placeholderImage:nil];
        self.videoView.frame = CGRectZero;
    } else if([model.typeString isEqualToString:@"video"]) {
        [self.imageView setHidden:YES];
        [self.videoView setHidden:NO];
        CGRect rect = self.imageView.frame;
        [self.videoView setFrame:rect];
    }
    self.labelHeader.text = model.headingString;
    self.labelDescription.text = model.contentString;
}

@end
