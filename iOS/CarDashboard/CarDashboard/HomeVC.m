//
//  HomeVC.m
//  CarDashboard
//
//  Created by Christoph Pageler on 19.02.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushedHomeLogoButton:(UIButton *)sender
{
    [self showHideMenu:(sender.tag == 0)];
}

- (void)showHideMenu:(BOOL)show
{
    NSLog(@"Show: %@", show ? @"true" : @"false");
    self.homeLogoButton.tag = self.homeLogoButton.tag == 1 ? 0 : 1;
    
    // on show make logo smaller and show options
    // on !show opposite
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGFloat edgeLength = show ? 400 : 558;
    CGRect homeBtnFrame = CGRectMake(self.view.frame.size.height / 2 - edgeLength / 2,
                                     self.view.frame.size.width / 2 - edgeLength / 2,
                                     edgeLength, edgeLength);
    self.homeLogoButton.frame = homeBtnFrame;
    [UIView commitAnimations];
    
}

@end
