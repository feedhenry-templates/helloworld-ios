//
//  HomeViewController.h
//  iOS-Template-App
//
//  Created by Michael Hearne on 25/04/2014.
//  Copyright (c) 2014 FeedHenry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FH/FH.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextView *result;

- (IBAction)cloudCall:(id)sender;

@end
