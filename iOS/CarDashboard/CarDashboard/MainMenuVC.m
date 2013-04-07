//
//  MainMenuVC.m
//  CarDashboard
//
//  Created by Christoph Pageler on 05.04.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import "MainMenuVC.h"

@interface MainMenuVC ()
{
    CGRect _originalLogoRect;
}
@end

@implementation MainMenuVC

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // VW Logo
    _originalLogoRect = self.logoButton.frame;
    
    // Tap Rect
	self.singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:self.singleTapGestureRecognizer];
    
    // Clock
    self.clockTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(updateClock)
                                                     userInfo:nil
                                                      repeats:YES];
    [self.clockTimer fire];
}

- (void)updateClock
{
    NSLog(@"UpdateClock");
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    self.clockLabel.text = [dateFormatter stringFromDate:[NSDate date]];
}

- (void)handleGesture:(UIGestureRecognizer* )gestureRecognizer
{
    CGPoint loc = [gestureRecognizer locationInView:self.view];
	
    if (self.tileController && self.tileController.isVisible == YES) {
        // Only dismiss if the tap wasn't inside the tile menu itself.
        if (!CGRectContainsPoint(self.tileController.view.frame, loc)) {
            [self.tileController dismissMenu];
            [self restoreLogo];
        }
    }
}

#pragma mark -
#pragma mark TileMenu



- (NSString *)descriptionForTile:(NSInteger)tileNumber
                          inMenu:(MGTileMenuController *)tileMenu
{
    NSArray* titles = @[@"Title 1", @"Title 2", @"Title 3"];
    return titles[tileNumber];
}

- (UIImage *)imageForTile:(NSInteger)tileNumber
                   inMenu:(MGTileMenuController *)tileMenu
{
    NSArray* imageNames = @[@"speech.png", @"Text.png", @"twitter.png"];
    UIImage* img = [UIImage imageNamed:imageNames[tileNumber]];
    return img;
}

- (UIImage *)backgroundImageForTile:(NSInteger)tileNumber
                             inMenu:(MGTileMenuController *)tileMenu
{
    if (tileNumber < 0) tileNumber = 0;
    NSArray* imageNames = @[@"green_gradient.png", @"grey_gradient.png", @"yellow_gradient.png"];
    UIImage* img = [UIImage imageNamed:imageNames[tileNumber]];
    return img;
}

- (NSString *)labelForTile:(NSInteger)tileNumber
                    inMenu:(MGTileMenuController *)tileMenu
{
    NSArray* labels = @[@"Title 1", @"Title 2", @"Title 3"];
    return labels[tileNumber];
}
- (NSInteger)numberOfTilesInMenu:(MGTileMenuController *)tileMenu
{
    return 3;
}

- (void)tileMenu:(MGTileMenuController *)tileMenu
 didActivateTile:(NSInteger)tileNumber
{
    //NSLog(@"Activate: %@, %@", tileMenu, [self labelForTile:tileNumber inMenu:tileMenu]);
    [tileMenu dismissMenu];
    [self restoreLogo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect )reduceRect:(CGRect )rect centeredBy:(CGFloat )pixels
{
    CGRect reducedRect = CGRectMake(rect.origin.x + pixels / 2,
                                    rect.origin.y + pixels / 2,
                                    rect.size.width - pixels,
                                    rect.size.height - pixels);
    return reducedRect;
}

- (void)makeLogoLittleSmaller
{
    CGFloat reducePixelsPerAxis = 50;
    CGRect reducedRect = [self reduceRect:_originalLogoRect
                               centeredBy:reducePixelsPerAxis];
    
    [self animateView:self.logoButton
           toViewSize:reducedRect];
}
- (void)restoreLogo
{
    [self animateView:self.logoButton
           toViewSize:_originalLogoRect];
}
- (void)makeLogoSmall
{
    CGFloat reducePicelsPerAxis = 400;
    CGRect reducedRect = [self reduceRect:_originalLogoRect
                               centeredBy:reducePicelsPerAxis];
    
    [self animateView:self.logoButton
           toViewSize:reducedRect];
}

-(void)animateView:(UIView* )view toViewSize:(CGRect )rect
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         view.frame = rect;
                     }];
}

- (IBAction)logoTouchDown:(RoundButton *)sender {
    [self makeLogoLittleSmaller];
}

- (IBAction)logoTouchUpOutside:(RoundButton *)sender {
    [self restoreLogo];
}

- (IBAction)logoTap:(RoundButton *)sender {
    CGPoint loc = sender.center;
    [self makeLogoSmall];
    if (!self.tileController || self.tileController.isVisible == NO) {
        if (!self.tileController) {
            // Create a tileController.
            self.tileController = [[MGTileMenuController alloc] initWithDelegate:self];
            self.tileController.dismissAfterTileActivated = NO; // to make it easier to play with in the demo app.
        }
        // Display the TileMenu.
        [self.tileController displayMenuCenteredOnPoint:loc inView:self.view];
    }

}
@end
