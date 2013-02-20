//
//  RoundOuterButton.m
//  CarDashboard
//
//  Created by Christoph Pageler on 20.02.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import "RoundOuterButton.h"

@implementation RoundOuterButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"TouchesBegan");
}

@end
