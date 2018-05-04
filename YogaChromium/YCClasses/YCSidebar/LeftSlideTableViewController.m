//
//  LeftSlideTableViewController.m
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "LeftSlideTableViewController.h"
#import "YCSideListModel.h"
#import "YCSideTableHeader.h"
#import "YCDetailViewController.h"
#import "BaseViewController.h"
#import "YCMainViewController.h"

@interface LeftSlideTableViewController ()

@end

@implementation LeftSlideTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(44.0, 0.0, 44.0, 0.0);
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    arraySideList = [[NSMutableArray alloc] initWithCapacity:0];
    [self getSlideTableData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)getSlideTableData {
    LeftSlideTableViewController* __weak weakSelf = self;
    if (![[YCSingleton sharedInstance] isInternetConnectionAvailable]) {
        return;
    }
    [[YCSingleton sharedInstance] getDataFromChild:sidebar_path withObserver:FIRDataEventTypeValue completionBlock:^(NSDictionary *responseObject) {
        [weakSelf updatedTableData:responseObject];
    } failure:^(NSError *error) {
        
    }];
}
-(void)updatedTableData:(NSDictionary *)response {
    NSLog(@"%@",response);
    LeftSlideTableViewController* __weak weakSelf = self;
    for (NSDictionary * listObj in [response valueForKey:@"response"]) {
        YCSideListModel * model = [[YCSideListModel alloc] initWithSideListData:listObj];
        [arraySideList addObject:model];
    }
    [self.tableView reloadData];
//    [self.tableView performBatchUpdates:^{}
//                                       completion:^(BOOL finished) {
//
//                                       }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return arraySideList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    YCSideListModel * model = (YCSideListModel *)[arraySideList objectAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = model.title;
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.tableView dequeueReusableCellWithIdentifier:@"header"];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseViewController *baseViewController = (BaseViewController *)self.sideMenuController;
    YCSideListModel * model = (YCSideListModel *)[arraySideList objectAtIndex:indexPath.row];
    YCDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"YCDetailVC"];
    detailVC.urlStringPath = model.dataPath;
    UINavigationController *navigationController = (UINavigationController *)baseViewController.rootViewController;
    YCMainViewController * navController =(YCMainViewController *)[navigationController.childViewControllers objectAtIndex:0];
    navController.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                                         initWithTitle:model.title style:UIBarButtonItemStylePlain target:nil action:nil];

    [navigationController pushViewController:detailVC animated:YES];
    [baseViewController hideLeftViewAnimated:YES completionHandler:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
