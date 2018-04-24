//
//  ViewController.m
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)clickToStart:(id)sender {
    [self performSegueWithIdentifier:@"Intro" sender:sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
}

@end
