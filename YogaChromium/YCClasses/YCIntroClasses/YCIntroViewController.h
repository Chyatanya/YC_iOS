//
//  YCIntroViewController.h
//  YogaChromium
//
//  Created by chyatanya on 13/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCButtonView.h"

@interface YCIntroViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *introCollectionView;
@property (nonatomic, strong) NSMutableArray* arrayIntroduction;
@property (weak, nonatomic) IBOutlet YCButtonView *buttonMoreInfo;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet YCButtonView *buttonNext;
@end
