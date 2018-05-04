//
//  YCMainViewController.h
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCGradientView.h"
#import "YCButtonView.h"


@interface YCMainViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (nonatomic, strong) NSArray * arraySliding;
@property (nonatomic, strong) NSMutableArray * arrayTotalSlidingImages;
@property (nonatomic, strong) NSMutableArray * arrayMainData;
@property (weak, nonatomic) IBOutlet YCGradientView *gradientView;
//Footer View
@property (weak, nonatomic) IBOutlet YCButtonView *buttonMoreInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelFooterHeader;
@property (weak, nonatomic) IBOutlet UILabel *labelFooterDescription;


@end
