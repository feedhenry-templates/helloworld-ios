//
//  HomeViewController.h
//  iOS-Template-App
//
//  Created by Michael Hearne on 25/04/2014.
//  Copyright (c) 2014 FeedHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FH/FH.h>
#import <FH/FHResponse.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *result;

- (IBAction)cloudCall:(id)sender;

@end
