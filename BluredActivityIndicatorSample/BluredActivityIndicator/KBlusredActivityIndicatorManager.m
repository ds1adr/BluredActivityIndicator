//
//  KBlusredActivityIndicatorManager.m
//  BluredActivityIndicatorSample
//
//  Created by KiWontai on 11/22/13.
//  Copyright (c) 2013 KiWontai. All rights reserved.
//

#import "KBlusredActivityIndicatorManager.h"

@implementation KBlusredActivityIndicatorManager

+ (KBlusredActivityIndicatorManager*) sharedManager {
    static KBlusredActivityIndicatorManager* sharedAgent = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedAgent = [[KBlusredActivityIndicatorManager alloc] init];
    });
    
    return sharedAgent;
}

- (id)init {
    self = [super init];
    if (self) {
        self.blurRadius = 10.0f;
    }
    
    return self;
}

- (void) startActivityIndicatorWithView:(UIView*)targetView {
    if (self.iView == nil) {
        self.iView = [[UIView alloc] initWithFrame:targetView.bounds];
    }
    
    [targetView addSubview:self.iView];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.iView.bounds];
    [self.iView addSubview:imageView];
    imageView.image = [self makeBlurImageWithImage:[self getImageFromView:targetView]];
    
    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    [self.iView addSubview:activityIndicator];
    activityIndicator.center = self.iView.center;
    
    [activityIndicator startAnimating];
}

- (void) startActivityIndicatorWithView:(UIView *)targetView withTimeout:(NSTimeInterval)timeout {
    [self startActivityIndicatorWithView:targetView];
    
    [self performSelector:@selector(stopActivityIndicatorByTimeout) withObject:nil afterDelay:timeout];
}

- (void) stopActivityIndicatorByTimeout {
    if (self.iView) {
        [self.iView removeFromSuperview];
        self.iView = nil;
    }
}

- (void) stopActivityIndicator {
    if (self.iView) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopActivityIndicatorByTimeout) object:nil];
        [self.iView removeFromSuperview];
        self.iView = nil;
    }

}

- (UIImage*) getImageFromView:(UIView*)targetView {
    UIGraphicsBeginImageContextWithOptions(targetView.bounds.size, targetView.opaque, 0.0);
    [targetView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage*) makeBlurImageWithImage:(UIImage*)image {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage* inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter* filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:self.blurRadius] forKey:@"inputRadius"];
    
    CGImageRef outputImage = [context createCGImage:[filter valueForKey:kCIOutputImageKey] fromRect:[inputImage extent]];
    
    return [UIImage imageWithCGImage:outputImage];
}
@end
