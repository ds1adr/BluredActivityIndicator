//
//  KViewController.h
//  BluredActivityIndicatorSample
//
//  Created by KiWontai on 11/22/13.
//  Copyright (c) 2013 KiWontai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView* textView;

- (IBAction)startButtonClicked:(id)sender;
- (IBAction)networkRequest:(id)sender;

@end
