//
//  ZZViewController.m
//  ZZCustomAlertView
//
//  Created by zzdjk6 on 06/23/2015.
//  Copyright (c) 2014 zzdjk6. All rights reserved.
//

#import "ZZViewController.h"
#import "ZZCustomAlertView/ZZCustomAlertView.h"

@interface ZZViewController ()

@end

@implementation ZZViewController

#pragma mark - View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    // prevent auto rotate when alert view on present
    return [ZZCustomAlertView alertViewOnPresent] == nil;
}

#pragma mark - IBAction

- (IBAction)defaultAlert:(id)sender {
    ZZCustomAlertView *alert = [ZZCustomAlertView alertViewWithParentView:self.view andContentView:nil];
    [alert show];
}

- (IBAction)customAlert:(id)sender {
    UIImage *img = [UIImage imageNamed:@"Perfect Button"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [btn setImage:img forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(customButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    ZZCustomAlertView *alert = [ZZCustomAlertView alertViewWithParentView:self.view andContentView:btn];
    alert.shouldBlurBackground = YES;
    alert.allowTapBackgroundToDismiss = NO;
    alert.shadowColor = [UIColor whiteColor];
    alert.shadowAlpha = 0.1f;
    [alert show];
}

#pragma mark - Private

- (void)customButtonPressed {
    [[ZZCustomAlertView alertViewOnPresent] dismiss];
}

@end
