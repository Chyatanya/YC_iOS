//
//  YCIntroViewController.m
//  YogaChromium
//
//  Created by chyatanya on 13/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCIntroViewController.h"
#import "YCIntroModel.h"
#import "YCIntroCollectionViewCell.h"
#import "BaseViewController.h"
#define Default_Section 0
@interface YCIntroViewController ()

@end

@implementation YCIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.footerView setHidden:YES];
    [self setupInitialValues];
    [self getIntroData];
    // Do any additional setup after loading the view.
}
-(void)setupInitialValues {
    self.arrayIntroduction = [[NSMutableArray alloc]initWithCapacity:0];
    [self.introCollectionView registerClass:[YCIntroCollectionViewCell class] forCellWithReuseIdentifier:@"YCIntroCollectionViewCell"];
    [self.introCollectionView registerNib:[UINib nibWithNibName:@"YCIntroCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"YCIntroCollectionViewCell"];
    __weak YCIntroViewController *weakSelf = self;
    self.buttonMoreInfo.labelTitle.text = @"MoreInfo";
    [self.buttonMoreInfo setBackgroundColor:COLOR_THEME];
    [self.buttonMoreInfo.labelTitle setTextColor:COLOR_MIXED_WHITE];
    self.buttonNext.labelTitle.text = @"Next";
    [self.buttonNext setBackgroundColor:COLOR_SPECIFIC];
    [self.buttonNext.labelTitle setTextColor:COLOR_THEME];
    self.buttonMoreInfo.buttonClickTaskCompletion = ^(UIButton *button) {
      // Navigate to more info view
        NSLog(@"More Info Clicked");

    };
    self.buttonNext.buttonClickTaskCompletion = ^(UIButton *button) {
        // load next item
        NSArray *visibleItems = [weakSelf.introCollectionView indexPathsForVisibleItems];
        NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
        if (currentItem.item < weakSelf.arrayIntroduction.count-1) {
            NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
            dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.introCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            });
        } else {
            // Navigate to Main View from Intro view
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf navigateToMainController];
            });
        }
        
    };
}
-(void)navigateToMainController {
    [[YCSingleton sharedInstance] removeFireBaseObservers];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"YCScreensStoryboard" bundle:nil]; //NSBundle.mainBundle
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationViewController"];
    [navigationController setViewControllers:@[[storyboard instantiateViewControllerWithIdentifier:@"YCMainViewController"]]];
    BaseViewController *mainViewController = [storyboard instantiateInitialViewController];
    mainViewController.rootViewController = navigationController;
    [mainViewController setupWithType:1];
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    window.rootViewController = mainViewController;
    [UIView transitionWithView:window
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:nil
                    completion:nil];

}
-(void)getIntroData {
    YCIntroViewController* __weak weakSelf = self;
    if (![[YCSingleton sharedInstance] isInternetConnectionAvailable]) {
        return;
    }
    [[YCSingleton sharedInstance] getDataFromChild:intro_path withObserver:FIRDataEventTypeValue completionBlock:^(NSDictionary *responseObject) {
        [weakSelf loadIntroValues:responseObject];
    } failure:^(NSError *error) {
        
    }];
}
-(void)loadIntroValues:(NSDictionary *)introDictionary {
    YCIntroViewController* __weak weakSelf = self;
    for (NSDictionary * introObj in [introDictionary valueForKey:@"data"]) {
        YCIntroModel * model = [[YCIntroModel alloc] initWithIntroData:introObj];
        [self.arrayIntroduction addObject:model];
    }
    [self.introCollectionView reloadData];
    [self.introCollectionView performBatchUpdates:^{}
                   completion:^(BOOL finished) {
                       if (weakSelf.arrayIntroduction.count) {
                           [weakSelf.footerView setHidden:NO];
                       }
                   }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayIntroduction.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YCIntroCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YCIntroCollectionViewCell" forIndexPath:indexPath];
    YCIntroModel * model = [self.arrayIntroduction objectAtIndex:indexPath.item];
    [cell updateIntroModel:model atIndexPath:indexPath];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self setNextTitle];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH-10, collectionView.frame.size.height);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 5, 0, 5);
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
-(void)setNextTitle {
    NSArray *visibleItems = [self.introCollectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    if (currentItem.item == self.arrayIntroduction.count-1) {
        self.buttonNext.labelTitle.text = @"Finished";
    } else {
        self.buttonNext.labelTitle.text = @"Next";
    }
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
