//
//  MainMenuVC.h
//  CarDashboard
//
//  Created by Christoph Pageler on 05.04.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGTileMenuController.h"
#import "RoundButton.h"

@interface MainMenuVC : UIViewController<MGTileMenuDelegate>

@property (nonatomic, strong) UITapGestureRecognizer* singleTapGestureRecognizer;

@property (nonatomic, strong) NSTimer* clockTimer;

// VW Logo
@property (strong, nonatomic) IBOutlet RoundButton *logoButton;
- (IBAction)logoTouchDown:(RoundButton *)sender;
- (IBAction)logoTouchUpOutside:(RoundButton *)sender;
- (IBAction)logoTap:(RoundButton *)sender;

// Clock
@property (strong, nonatomic) IBOutlet UILabel *clockLabel;

@property (nonatomic, strong) MGTileMenuController* tileController;

@end
