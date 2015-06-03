//
//  HomeScreenVC.m
//  TestDynamicDrawer
//
//  Created by Saugat Gautam on 6/2/15.
//  Copyright (c) 2015 Saugat Gautam. All rights reserved.
//

#import "HomeScreenVC.h"
#import "AppDelegate.h"

@interface HomeScreenVC ()

@end

@implementation HomeScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnRedScreen:(id)sender {
    [self performSegueWithIdentifier:@"HomeToRedVC" sender:sender];
}

- (IBAction)btnGreenScreen:(id)sender {
    [self performSegueWithIdentifier:@"HomeToGreenVC" sender:sender];
}
@end
