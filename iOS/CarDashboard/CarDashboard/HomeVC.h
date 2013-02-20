//
//  HomeVC.h
//  CarDashboard
//
//  Created by Christoph Pageler on 19.02.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InnerMenuButtonView.h"

enum DisplayMode {
    DisplayModeNormal,
    DisplayModeSmall
    };

@interface HomeVC : UIViewController

@property enum DisplayMode displayMode;
@property (strong, nonatomic) NSTimer* hideMenuTimer;
@property (weak, nonatomic) UIViewController* activeViewController;


@property (strong, nonatomic) IBOutlet InnerMenuButtonView *innerMenuButtonView;
@property (strong, nonatomic) IBOutlet UIButton *homeLogoButton;
- (IBAction)pushedHomeLogoButton:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
- (IBAction)pushedSettingsButton:(UIButton *)sender;

// Menu buttons

// collection
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *menuButtons;


@property (strong, nonatomic) IBOutlet UIButton *menuShowMapButton;
- (IBAction)pushedMenuShowMapButton:(UIButton *)sender;

@end
