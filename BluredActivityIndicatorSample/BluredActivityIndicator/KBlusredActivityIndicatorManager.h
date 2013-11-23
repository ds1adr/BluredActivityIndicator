//
//  KBlusredActivityIndicatorManager.h
//  BluredActivityIndicatorSample
//
//  Created by KiWontai on 11/22/13.
//  Copyright (c) 2013 KiWontai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBlusredActivityIndicatorManager : NSObject

@property (strong, nonatomic) UIView* iView;
@property (nonatomic) CGFloat blurRadius;

+ (KBlusredActivityIndicatorManager*) sharedManager;

- (void) startActivityIndicatorWithView:(UIView*)targetView;
- (void) startActivityIndicatorWithView:(UIView *)targetView withTimeout:(NSTimeInterval)timeout;
- (void) stopActivityIndicatorByTimeout;
- (void) stopActivityIndicator;

- (UIImage*) getImageFromView:(UIView*)targetView;
- (UIImage*) makeBlurImageWithImage:(UIImage*)image;
@end
