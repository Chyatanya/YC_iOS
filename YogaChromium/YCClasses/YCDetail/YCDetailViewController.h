//
//  YCDetailViewController.h
//  YogaChromium
//
//  Created by chyatanya on 25/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSString * urlStringPath;
@property (weak, nonatomic) IBOutlet UITableView *tableViewDetail;
@property (nonatomic, strong) NSMutableArray * detailInfoArray;
@end
