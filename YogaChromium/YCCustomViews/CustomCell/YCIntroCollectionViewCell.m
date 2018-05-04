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
    if([model.type isEqualToString:@""] || [model.type isEqualToString:@""]){
        self.videoView.frame = CGRectZero;
        self.imageView.frame = CGRectZero;
        self.imageView.image = nil;
        [self.imageView setHidden:YES];
        [self.videoView setHidden:YES];
    } else if([model.type isEqualToString:@"image"]) {
        [self.imageView setHidden:NO];
        [self.videoView setHidden:YES];
        CGRect rect = self.imageView.frame;
        [self.imageView setFrame:rect];
        [self.imageView sd_setShowActivityIndicatorView:YES];
        [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:nil];
        self.videoView.frame = CGRectZero;
    } else if([model.type isEqualToString:@"video"]) {
        [self.imageView setHidden:YES];
        [self.videoView setHidden:NO];
        CGRect rect = self.imageView.frame;
        [self.videoView setFrame:rect];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.videoView loadWithVideoId:model.url];
        });
    }
    self.labelHeader.text = model.heading;
    self.labelDescription.text = model.content;
}
-(void)updateMainInfo:(NSString *)urlString atIndexPath:(NSIndexPath *)indexPath {
    [self.contentView setBackgroundColor:COLOR_SPECIFIC];
    self.labelHeader.text = @"";
    self.labelDescription.text = @"";
    CGRect headerRect = self.labelHeader.frame;
    headerRect.size.height = 0;
    self.labelHeader.frame = headerRect;
    CGRect descriptionRect = self.labelDescription.frame;
    descriptionRect.size.height = 0;
    self.labelDescription.frame = descriptionRect;
    self.videoView.frame = CGRectZero;
    CGRect rect = self.imageView.frame;
    rect.origin.y = 10;
    rect.size.height = self.frame.size.height -40;
    [self.imageView setFrame:rect];
    [self.imageView sd_setShowActivityIndicatorView:YES];
    [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:nil];
}
@end
