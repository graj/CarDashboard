//
//  InnerMenuButtonView.m
//  CarDashboard
//
//  Created by Christoph Pageler on 20.02.13.
//  Copyright (c) 2013 Christoph Pageler. All rights reserved.
//

#import "InnerMenuButtonView.h"

@implementation InnerMenuButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    
    self.buttons = [[NSMutableArray alloc] init];
    [self.buttons addObject:@"Button 1"];
    [self.buttons addObject:@"Button 2"];
    [self.buttons addObject:@"Button 3"];
    [self.buttons addObject:@"Button 4"];
    [self.buttons addObject:@"Button 5"];
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"Count: %d", self.buttons.count);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    
    float onePice = 360/self.buttons.count;
    float startDeg = 0;
    float endDeg = onePice;
    
    startDeg -= endDeg*2;
    endDeg -= endDeg*2;
    
    CGFloat x = self.frame.size.width / 2;
    CGFloat y = self.frame.size.width / 2;
    CGFloat r = 150;
    
    for (NSString* btn in self.buttons) {
        startDeg += onePice;
        endDeg += onePice;
        
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [color setFill];
        
        NSLog(@"StartDeg: %f", (startDeg)*M_PI/180);
        NSLog(@"EndDeg: %f", (endDeg)*M_PI/180);
        CGContextMoveToPoint(context, x, y);
        CGContextAddArc(context, x, y, r, (startDeg)*M_PI/180, (endDeg)*M_PI/180, NO);
        CGContextClosePath(context);
        CGContextFillPath(context);
    }
    
    
    
}

@end
