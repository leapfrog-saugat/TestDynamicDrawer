//
//  MenuViewController.m
//  TestDynamicDrawer
//
//  Created by Saugat Gautam on 6/1/15.
//  Copyright (c) 2015 Saugat Gautam. All rights reserved.
//

#import "MenuViewController.h"
#import "MSDynamicsDrawerViewController.h"
#import "AppDelegate.h"

@interface MenuViewController ()
@property (nonatomic, strong) NSDictionary *paneViewControllerTitles;
@property (nonatomic, strong) NSDictionary *paneViewControllerIdentifiers;

@property (nonatomic, strong) NSDictionary *sectionTitles;
@property (nonatomic, strong) NSArray *tableViewSectionBreaks;

@property (nonatomic, strong) UIBarButtonItem *paneStateBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *paneRevealLeftBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *paneRevealRightBarButtonItem;


@end

@implementation MenuViewController

- (void)initialize
{
    self.paneViewControllerType = NSUIntegerMax;
    self.paneViewControllerTitles = @{
                                      @(MSPaneViewControllerTypeHome) : @"HomeScreenVC",
                                      @(MSPaneViewControllerTypeGreen) : @"GreenScreenVC",
                                      @(MSPaneViewControllerTypeRed) : @"RedScreenVC",
                                      @(MSPaneViewControllerTypeLogin) : @"LoginVC",
                                      @(MSPaneViewControllerTypeControls) : @"Controls",
                                      @(MSPaneViewControllerTypeMap) : @"Map",
                                      @(MSPaneViewControllerTypeEditableTable) : @"Editable Table",
                                      @(MSPaneViewControllerTypeLongTable) : @"Long Table",
                                      @(MSPaneViewControllerTypeMonospace) : @"Monospace Ltd."
                                      };
    
    self.paneViewControllerIdentifiers = @{
                                           @(MSPaneViewControllerTypeHome) : @"HomeScreenVC",
                                           @(MSPaneViewControllerTypeGreen) : @"GreenScreenVC",
                                           @(MSPaneViewControllerTypeRed) : @"RedScreenVC",
                                           @(MSPaneViewControllerTypeLogin) : @"LoginVC",
                                           @(MSPaneViewControllerTypeControls) : @"Controls",
                                           @(MSPaneViewControllerTypeMap) : @"Map",
                                           @(MSPaneViewControllerTypeEditableTable) : @"Editable Table",
                                           @(MSPaneViewControllerTypeLongTable) : @"Long Table",
                                           @(MSPaneViewControllerTypeMonospace) : @"Monospace"
                                           };

}

#pragma mark - NSObject

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

#pragma mark - UIViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)transitionToViewController:(MSPaneViewControllerType)paneViewControllerType {
    
    if (paneViewControllerType == self.paneViewControllerType) {
//        [self.dynamicsDrawerViewController setPaneViewController:paneViewController];
        [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateClosed animated:YES allowUserInterruption:YES completion:nil];
        return;
    }
    
    BOOL animateTransition = self.dynamicsDrawerViewController.paneViewController != nil;
    
    
    

    
    UIViewController *paneViewController = [self.storyboard instantiateViewControllerWithIdentifier:self.paneViewControllerIdentifiers[@(paneViewControllerType)]];
    
    paneViewController.navigationItem.title = self.paneViewControllerTitles[@(paneViewControllerType)];
    
    self.paneRevealLeftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Left Reveal Icon"] style:UIBarButtonItemStyleBordered target:self action:@selector(dynamicsDrawerRevealLeftBarButtonItemTapped:)];
    self.paneRevealLeftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(dynamicsDrawerRevealLeftBarButtonItemTapped:)];
    paneViewController.navigationItem.leftBarButtonItem = self.paneRevealLeftBarButtonItem;
    
    self.paneRevealRightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Right Reveal Icon"] style:UIBarButtonItemStyleBordered target:self action:@selector(dynamicsDrawerRevealRightBarButtonItemTapped:)];
    paneViewController.navigationItem.rightBarButtonItem = self.paneRevealRightBarButtonItem;

    UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
    [self.dynamicsDrawerViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
    self.paneViewControllerType = paneViewControllerType;
}

- (void)dynamicsDrawerRevealLeftBarButtonItemTapped:(id)sender
{
    [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateOpen inDirection:MSDynamicsDrawerDirectionLeft animated:YES allowUserInterruption:YES completion:nil];
}

- (void)dynamicsDrawerRevealRightBarButtonItemTapped:(id)sender
{
    [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateOpen inDirection:MSDynamicsDrawerDirectionRight animated:YES allowUserInterruption:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnGreenScreenVC:(id)sender {
    [self transitionToViewController:MSPaneViewControllerTypeGreen];
}

- (IBAction)btnRedScreenVC:(id)sender {
    [self transitionToViewController:MSPaneViewControllerTypeRed];
}
@end
