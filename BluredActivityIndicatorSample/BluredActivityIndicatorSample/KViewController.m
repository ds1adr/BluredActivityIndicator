//
//  KViewController.m
//  BluredActivityIndicatorSample
//
//  Created by KiWontai on 11/22/13.
//  Copyright (c) 2013 KiWontai. All rights reserved.
//

#import "KViewController.h"
#import "KBlusredActivityIndicatorManager.h"

@interface KViewController ()

@end

@implementation KViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonClicked:(id)sender {
    [KBlusredActivityIndicatorManager sharedManager].blurRadius = 10.0f;
    [[KBlusredActivityIndicatorManager sharedManager] startActivityIndicatorWithView:self.view withTimeout:7.0];
}

- (IBAction)networkRequest:(id)sender {
    // It's just example so, doen't request via network :)
    [[KBlusredActivityIndicatorManager sharedManager] startActivityIndicatorWithView:self.textView];
    
    // For example, receive data from network during 5 second :)
    [self performSelector:@selector(finishRequest) withObject:nil afterDelay:5.0f];
}

- (void) finishRequest {
    [[KBlusredActivityIndicatorManager sharedManager] stopActivityIndicator];
}
@end
