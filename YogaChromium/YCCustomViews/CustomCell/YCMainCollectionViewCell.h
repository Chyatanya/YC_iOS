//
//  YCMainCollectionViewCell.h
//  YogaChromium
//
//  Created by chyatanya on 27/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSlide;
-(void)updateMainInfo:(NSString *)urlString atIndexPath:(NSIndexPath *)indexPath;
@end
