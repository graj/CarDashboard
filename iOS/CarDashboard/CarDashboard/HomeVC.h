//
//  HomeVC.h
//  CarDashboard
//
//  Created by Christoph Pageler on 19.02.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *homeLogoButton;
- (IBAction)pushedHomeLogoButton:(UIButton *)sender;

@end
