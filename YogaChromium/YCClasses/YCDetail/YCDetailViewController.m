//
//  YCDetailViewController.m
//  YogaChromium
//
//  Created by chyatanya on 25/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCDetailViewController.h"
#import "YCDetailModel.h"
#import "YCDetailTableViewCell.h"

@interface YCDetailViewController ()

@end

@implementation YCDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDetailData];
    [self setUpInitials];
    if (self.navigationController.navigationBar.isHidden) {
        NSLog(@"navigationBar hidden");
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [self.navigationController.navigationBar setBarTintColor:COLOR_THEME];
        [self.navigationController.navigationBar setTitleTextAttributes:
         @{NSForegroundColorAttributeName:COLOR_WHITE}];
        [self.navigationController.navigationBar setTintColor:COLOR_WHITE];
    } else {
        
        NSLog(@"navigationBar not hidden");
    }
    // Do any additional setup after loading the view.
}

-(void)setUpInitials {
    [self.tableViewDetail registerClass:[YCDetailTableViewCell class] forCellReuseIdentifier:@"YCDetailTableViewCell"];
    [self.tableViewDetail registerNib:[UINib nibWithNibName:@"YCDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"YCDetailTableViewCell"];
    self.tableViewDetail.estimatedRowHeight = 100.0;
    self.detailInfoArray = [[NSMutableArray alloc] initWithCapacity:0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getDetailData {
    YCDetailViewController* __weak weakSelf = self;
    if (![[YCSingleton sharedInstance] isInternetConnectionAvailable]) {
        return;
    }
    [[YCSingleton sharedInstance] getDataFromChild:self.urlStringPath withObserver:FIRDataEventTypeValue completionBlock:^(NSDictionary *responseObject) {
        [weakSelf updatedDetailData:responseObject];
    } failure:^(NSError *error) {
        
    }];
}
-(void)updatedDetailData:(NSDictionary *)response {
    NSLog(@"%@",response);
    [self.detailInfoArray removeAllObjects];
    for(NSDictionary *info in [response valueForKey:@"content"] ) {
        YCDetailModel * model = [[YCDetailModel alloc] initWithDetailInfo:info];
        [self.detailInfoArray addObject:model];
    }
    [self.tableViewDetail reloadData];
}
#pragma mark tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.detailInfoArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCDetailTableViewCell * cell = (YCDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"YCDetailTableViewCell"];
    YCDetailModel * model = [_detailInfoArray objectAtIndex:indexPath.row];
    [cell loadDetailValues:model atIndex:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
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
