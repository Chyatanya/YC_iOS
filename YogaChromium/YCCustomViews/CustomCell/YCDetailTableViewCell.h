//
//  YCDetailTableViewCell.h
//  YogaChromium
//
//  Created by chyatanya on 03/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCDetailModel.h"

@interface YCDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelText;
-(void)loadDetailValues:(YCDetailModel*)model atIndex:(NSIndexPath*)index;
@end
