//
//  YCIntroCollectionViewCell.h
//  YogaChromium
//
//  Created by chyatanya on 13/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCIntroModel.h"

@interface YCIntroCollectionViewCell : UICollectionViewCell {
    CGRect originalFrame;
}
@property (weak, nonatomic) IBOutlet UILabel *labelHeader;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;


-(void)updateIntroModel:(YCIntroModel *)model atIndexPath:(NSIndexPath *)indexPath;
@end
