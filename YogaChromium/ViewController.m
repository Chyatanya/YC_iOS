//
//  ViewController.m
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "ViewController.h"
#import "YCIntroModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.introductionArray = [[NSMutableArray alloc]initWithCapacity:0];
    ViewController* __weak weakSelf = self;
    if (![[YCSingleton sharedInstance] isInternetConnectionAvailable]) {
        return;
    }
    [[YCSingleton sharedInstance] getDataFromChild:intro_path withObserver:FIRDataEventTypeValue completionBlock:^(NSDictionary *responseObject) {
        [weakSelf loadIntroValues:responseObject];
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"fail");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadIntroValues:(NSDictionary *)introDictionary {
    for (NSDictionary * introObj in [introDictionary valueForKey:@"data"]) {
        YCIntroModel * model = [[YCIntroModel alloc] initWithIntroData:introObj];
        [self.introductionArray addObject:model];
    }
    NSLog(@"%@",self.introductionArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
