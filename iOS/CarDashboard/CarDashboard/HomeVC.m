//
//  HomeVC.m
//  CarDashboard
//
//  Created by Christoph Pageler on 19.02.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import "HomeVC.h"
#import "MapVC.h"

static int smallHomeLogoButtonEdgeLength = 400;
static int bigHomeLogoButtonEdgeLength = 558;

@interface HomeVC ()

@end

@implementation HomeVC

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.displayMode = DisplayModeNormal;
    }
    return self;
}

- (void)checkHideMenuTimer:(id)value
{
    [self showHideMenu:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.settingsButton.alpha = 0;
    
    self.menuShowMapButton.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushedHomeLogoButton:(UIButton *)sender
{
    if (self.displayMode == DisplayModeNormal) {
        [self showHideMenu:(sender.tag == 0)];
    } else
    {
        [self.activeViewController.view removeFromSuperview];
        [self.activeViewController removeFromParentViewController];
        self.activeViewController = nil;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        [self.homeLogoButton setImage:[UIImage imageNamed:@"vwLogo.png"] forState:UIControlStateNormal];
        CGRect smallRect = CGRectMake(self.view.frame.size.height / 2 - smallHomeLogoButtonEdgeLength / 2,
                                      self.view.frame.size.width / 2 - smallHomeLogoButtonEdgeLength / 2,
                                      smallHomeLogoButtonEdgeLength, smallHomeLogoButtonEdgeLength);
        self.homeLogoButton.frame = smallRect;
        
        self.settingsButton.alpha = 1;
        [self setMenuButtonsAlpha:1];
        
        [UIView commitAnimations];
        self.displayMode = DisplayModeNormal;
        
        [self startTimer];
    }
}

- (void)showHideMenu:(BOOL)show
{
    self.homeLogoButton.tag = self.homeLogoButton.tag == 1 ? 0 : 1;
    
    // on show make logo smaller and show options
    // on !show opposite
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // Animate Logo
    CGFloat edgeLength = show ? smallHomeLogoButtonEdgeLength : bigHomeLogoButtonEdgeLength;
    CGRect homeBtnFrame = CGRectMake(self.view.frame.size.height / 2 - edgeLength / 2,
                                     self.view.frame.size.width / 2 - edgeLength / 2,
                                     edgeLength, edgeLength);
    self.homeLogoButton.frame = homeBtnFrame;
    
    CGFloat edgeLengthInner = show ? 500 : 300;
    CGRect innerRect = CGRectMake(self.view.frame.size.height / 2 - edgeLengthInner / 2,
                                  self.view.frame.size.width / 2 - edgeLengthInner / 2, edgeLengthInner, edgeLengthInner);
    self.innerMenuButtonView.frame = innerRect;
    
    // Show Buttons
    self.settingsButton.alpha = show ? 1 : 0;
    //self.menuShowMapButton.alpha = show ? 1 : 0;
    [self setMenuButtonsAlpha:show ? 1 : 0];
    
    [UIView commitAnimations];
    
    if (show) {
        // Starttimer to close automaticly
        [self startTimer];
    } else {
        [self stopTimer];
    }
    
}

- (void)startTimer
{
    NSLog(@"StartTimer");
    self.hideMenuTimer = [NSTimer scheduledTimerWithTimeInterval:20
                                                          target:self
                                                        selector:@selector(checkHideMenuTimer:)
                                                        userInfo:nil
                                                         repeats:YES];
}

- (void)stopTimer
{
    NSLog(@"StopTimer");
    if (self.hideMenuTimer) {
        [self.hideMenuTimer invalidate];
        self.hideMenuTimer = nil;
    }
}

- (void)setMenuButtonsAlpha:(int)alpha
{
    for (UIButton* btn in self.menuButtons) {
        btn.alpha = alpha;
    }
}

- (IBAction)pushedSettingsButton:(UIButton *)sender {
    NSLog(@"ShowSettings");
}

- (IBAction)pushedMenuShowMapButton:(UIButton *)sender {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    MapVC* vc = [storyBoard instantiateViewControllerWithIdentifier:@"MapVC"];
    [self showViewController:vc];
}

- (void)showViewController:(UIViewController* )viewController
{
    [self prepareForViewController];
    CGFloat paddingLeft = 0;
    CGFloat paddingTop = 125;
    
    
    viewController.view.frame = CGRectMake(paddingLeft, paddingTop,
                                           self.view.bounds.size.width-paddingLeft,
                                           self.view.bounds.size.height-paddingTop);
    
    [self addChildViewController:viewController];
    self.activeViewController = viewController;
    [self.view addSubview:viewController.view];
}

- (void)prepareForViewController
{
    [self stopTimer];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    self.settingsButton.alpha = 0;
    [self setMenuButtonsAlpha:0];
    
    CGRect logoSmallRect = CGRectMake(10, 10, 100, 100);
    self.homeLogoButton.frame = logoSmallRect;
    [self.homeLogoButton setImage:[UIImage imageNamed:@"vwLogo_100x.png"] forState:UIControlStateNormal];
    
    [UIView commitAnimations];
    self.displayMode = DisplayModeSmall;
}
@end
