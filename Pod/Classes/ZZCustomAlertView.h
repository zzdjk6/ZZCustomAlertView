//
//  ZZCustomAlertView.h
//  ZZCustomAlertView
//
//  Created by zzdjk6 on 15/6/19.
//  Copyright (c) 2015年 zzdjk6. All rights reserved.
//

@import UIKit;

@interface ZZCustomAlertView : UIView

/** If set to YES, the background will be blured, using iOS 8 VisualEffect, default is NO. */
@property(nonatomic, assign) BOOL shouldBlurBackground;

/** If set to YES, tap anywhere on the alert view (include background) will dismiss the alert view, default is YES. */
@property(nonatomic, assign) BOOL allowTapBackgroundToDismiss;

/** the alpha of the modal shadow, default is 0.3f. */
@property(nonatomic, assign) CGFloat shadowAlpha;

/** the color of the modal shadow, default is black. */
@property(nonatomic, strong) UIColor *shadowColor;

/** the content view of the alert view, you can put any view you write here. */
@property(nonatomic, strong) UIView *contentView;

/** the parent view of the alert view, you have to provide one. */
@property(nonatomic, strong) UIView *parentView;

/**
 *  Build a new ZZCustomAlertView with required param.
 *
 *  @param parentView  The view which will contain this alert view.
 *  @param contentView The content of the alert view, witch can be any UIView.
 *
 *  @return ZZCustomAlertView instance.
 */
+ (instancetype)alertViewWithParentView:(UIView *)parentView andContentView:(UIView *)contentView;

/**
 *  Get the alert view on present.
 *
 *  @return ZZCustomAlertView instance or nil.
 */
+ (instancetype)alertViewOnPresent;

/**
 *  Show alert view.
 */
- (void)show;

/**
 *  Dismiss alert view.
 */
- (void)dismiss;

/**
 *  Show alert view with a block which will be executed when alert view finish show animation
 *
 *  @param completion A block which will be executed when alert view finish show animation
 */
- (void)showWithCompletionBlock:(void (^)(BOOL finished))completion;

/**
 *  Dismiss alert view with a block which will be executed when alert view finish dismiss animation
 *
 *  @param completion A block which will be executed when alert view finish dismiss animation
 */
- (void)dismissWithCompletionBlock:(void (^)(BOOL finished))completion;

@end
