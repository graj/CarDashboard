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

/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"TouchesBegan");
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    // check that the point is at least inside the normal rect
    if(![super pointInside:point withEvent:event]) return NO;
    
    // we'll assume a square view with an exact circle inside, so
    // the radius of the circle is just half the width
    CGFloat radius = self.bounds.size.width*0.5f;
    
    // the point (radius, radius) is also the centre of the view, so...
    CGFloat squareOfDistanceFromCentre =
    (radius - point.x)*(radius - point.x) +
    (radius - point.y)*(radius - point.y);
    
    // if the point is too far away, return NO
    if(squareOfDistanceFromCentre > radius*radius) return NO;
    
    // otherwise we've exhausted possible reasons for answering NO
    return YES;
}

@end
