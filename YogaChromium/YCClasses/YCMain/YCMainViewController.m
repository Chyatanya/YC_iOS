//
//  YCMainViewController.m
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainViewController.h"
#import "YCMainCollectionViewCell.h"
#import "YCMainSlidingListModel.h"
#import "YCMainDataModel.h"

@interface YCMainViewController ()

@end

@implementation YCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupValues];
    [self.mainView setHidden:YES];
    [self getMainViewData];
    // Do any additional setup after loading the view.
}
-(void)setupValues {
    [self.navigationController.navigationBar setBarTintColor:COLOR_THEME];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:COLOR_WHITE}];
    [self.navigationController.navigationBar setTintColor:COLOR_WHITE];
    [self.navigationController.navigationBar.backItem setTitle:@" "];
    self.arrayTotalSlidingImages = [[NSMutableArray alloc] initWithCapacity:0];
    self.arrayMainData = [[NSMutableArray alloc] initWithCapacity:0];
    self.arraySliding = [NSArray new];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    [self.mainCollectionView registerClass:[YCMainCollectionViewCell class] forCellWithReuseIdentifier:@"YCMainCollectionViewCell"];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"YCMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"YCMainCollectionViewCell"];
    [self.gradientView applyHorizantalGradientEffectWithColor:COLOR_THEME viewFrame:self.view.bounds bottomColor:[UIColor lightGrayColor]];
    //Footer
    [self.footerView setRoundedCorner:15.0 borderWith:1.0 borderColor:[UIColor grayColor]];
    [self.buttonMoreInfo.labelTitle setText:@"Know More.."];
    [self.buttonMoreInfo.labelTitle setTextColor:COLOR_WHITE];
    [self.buttonMoreInfo setRoundedViewCorner:5.0 borderWith:1.0 borderColor:COLOR_WHITE];
    [self.buttonMoreInfo setBackgroundColor:[UIColor lightGrayColor]];
    self.buttonMoreInfo.buttonClickTaskCompletion = ^(UIButton *button) {
        // Navigate to more info view
        NSLog(@"More Info Clicked");
        
    };
    [self.labelFooterHeader setTextColor:COLOR_THEME];
    [self.labelFooterDescription setTextColor:[UIColor lightGrayColor]];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getMainViewData {
    YCMainViewController* __weak weakSelf = self;
    if (![[YCSingleton sharedInstance] isInternetConnectionAvailable]) {
        return;
    }
    [[YCSingleton sharedInstance] getDataFromChild:main_path withObserver:FIRDataEventTypeValue completionBlock:^(NSDictionary *responseObject) {
        [weakSelf loadMainDataValues:responseObject];
    } failure:^(NSError *error) {
        
    }];
}
-(void)loadMainDataValues:(NSDictionary *)mainDictionary {
    YCMainViewController* __weak weakSelf = self;
    [self.arrayTotalSlidingImages removeAllObjects];
    for (NSArray * slideData in [mainDictionary valueForKey:@"sliding_images"]) {
        if (![slideData isKindOfClass:[NSNull class]]) {
            YCMainSlidingListModel * ycMainObj = [[YCMainSlidingListModel alloc] initWithSideListData:slideData];
            [self.arrayTotalSlidingImages addObject:ycMainObj];
        }
    }
    [self.arrayMainData removeAllObjects];
    for (NSDictionary * capsuleData in [mainDictionary valueForKey:@"data"]) {
        NSLog(@"%@",capsuleData);
        if (![capsuleData isKindOfClass:[NSNull class]]) {
            YCMainDataModel * ycMainObj = [[YCMainDataModel alloc] initWithMainData:capsuleData];
            [self.arrayMainData addObject:ycMainObj];
        }
    }
    NSInteger indexValue = [[YCSingleton sharedInstance] getRandomValueFrom:self.arrayTotalSlidingImages.count];
    self.arraySliding = nil;
    YCMainSlidingListModel * model = [self.arrayTotalSlidingImages objectAtIndex:indexValue];
    YCMainDataModel* mainDataModel = [self.arrayMainData objectAtIndex:indexValue];
    [self setMainDataValues:mainDataModel indexValue:indexValue];
    self.arraySliding = [[NSArray alloc]initWithArray:model.slideListArray];
    [self.mainCollectionView reloadData];
    [self.mainCollectionView performBatchUpdates:^{}
                                       completion:^(BOOL finished) {
                                           if (weakSelf.arraySliding.count) {
                                               [weakSelf.mainView setHidden:NO];
                                           }
                                       }];
}
-(void)setMainDataValues:(YCMainDataModel* )model indexValue:(NSInteger)index {
    [self.labelFooterHeader setText:model.heading];
    [self.labelFooterDescription setText:model.content];
    [self.buttonMoreInfo.buttonAction setTag:index];
}
#pragma mark Collection View
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arraySliding.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YCMainCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YCMainCollectionViewCell" forIndexPath:indexPath];
    [cell updateMainInfo:[self.arraySliding objectAtIndex:indexPath.row] atIndexPath:indexPath];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH, collectionView.frame.size.height);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
