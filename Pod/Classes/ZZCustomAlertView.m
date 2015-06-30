//
//  ZZCustomAlertView.m
//  ZZCustomAlertView
//
//  Created by zzdjk6 on 15/6/19.
//  Copyright (c) 2015年 zzdjk6. All rights reserved.
//

#import "ZZCustomAlertView.h"

static const CGFloat kFadeOutDuration = 0.5f;
static const CGFloat kFadeInDuration = 0.2f;

static ZZCustomAlertView *_alertViewOnPresent;

@interface ZZCustomAlertView()

@end

@implementation ZZCustomAlertView

#pragma mark - public

+ (instancetype)alertViewWithParentView:(UIView *)parentView andContentView:(UIView *)contentView {
    ZZCustomAlertView *alertView = [[ZZCustomAlertView alloc] init];

    alertView.contentView = contentView;
    alertView.parentView = parentView;

    alertView.shouldBlurBackground = NO;
    alertView.allowTapBackgroundToDismiss = YES;
    alertView.shadowColor = [UIColor blackColor];
    alertView.shadowAlpha = 0.3f;

    return alertView;
}

+ (instancetype)alertViewOnPresent {
    return _alertViewOnPresent;
}

- (void)show {
    [self showWithCompletionBlock:nil];
}

- (void)dismiss {
    [self dismissWithCompletionBlock:nil];
}

- (void)showWithCompletionBlock:(void (^)(BOOL finished))completion {
    if (_alertViewOnPresent != nil) {
        NSLog(@"Only 1 alert view can be showed on the same time. Hide the showing alert view first.");
        return;
    }
    
    if (self.parentView == nil){
        NSLog(@"You need assign parentView to alert view first.");
        return;
    }
    
    if (self.contentView == nil){
        self.contentView = [self generateDefaultContentView];
    }
    
    // clear subviews
    for(UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    //get window size and position
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    self.frame = windowRect;
    
    UIView *rootView = [[UIView alloc] initWithFrame:windowRect];
    rootView.alpha = 0.0f;
    [self addSubview:rootView];
    
    if (self.shouldBlurBackground) {
        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        visualEffectView.frame = windowRect;
        [rootView addSubview:visualEffectView];
    }
    
    //create shadow view by adding a black background with custom opacity
    UIView *shadowView = [[UIView alloc] initWithFrame:windowRect];
    shadowView.backgroundColor = self.shadowColor;
    shadowView.alpha = self.shadowAlpha;
    [rootView addSubview:shadowView];
    
    //create the main alert view centered
    //with custom width and height
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    UIView *contentContainerView = [[UIView alloc] initWithFrame:CGRectMake(
                                                                            windowRect.size.width/2 - width/2,
                                                                            windowRect.size.height/2 - height/2,
                                                                            width,
                                                                            height)];
    [contentContainerView addSubview:self.contentView];
    
    [rootView addSubview:contentContainerView];
    
    if (self.allowTapBackgroundToDismiss) {
        //tap the alert view to hide and remove it from the superview
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAlertByTap:)];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        [rootView addGestureRecognizer:tapGesture];
    }
    
    [self.parentView addSubview:self];
    [self fadeInView:rootView completion:completion];
    _alertViewOnPresent = self;
}

- (void)dismissWithCompletionBlock:(void (^)(BOOL finished))completion {
    if (_alertViewOnPresent != self) {
        NSLog(@"This alert view is not on present.");
        return;
    }
    
    //fade out and then remove from superview
    [self fadeOutView:self
           completion:^(BOOL finished) {
               [self removeFromSuperview];
               _alertViewOnPresent = nil;
               
               if (completion) {
                   completion(finished);
               }
           }];
}

#pragma mark - private

- (UIView *)generateDefaultContentView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6f];
    contentView.layer.cornerRadius = 10;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"Alert!";
    label.font = [UIFont fontWithName:@"Verdana" size:24];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:label];
    
    label.frame = contentView.frame;
    
    return contentView;
}


- (void)dismissAlertByTap:(UITapGestureRecognizer *)sender {
    [self dismiss];
}

- (void)fadeInView:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:kFadeInDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [view setAlpha:1.0];
                     }
                     completion:completion];
}

- (void)fadeOutView:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:kFadeOutDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [view setAlpha:0.0];
                     }
                     completion:completion];
}

@end
