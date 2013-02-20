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
}

- (void)drawRect:(CGRect)rect
{
    
    NSLog(@"DrawRect");
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    
    CGContextMoveToPoint(context, 0,0); //start at this point
    
    //CGContextAddLineToPoint(context, 20, 20); //draw to this point
    CGContextFillRect(context, self.bounds);
    
    // and now draw the Path!
    CGContextStrokePath(context);
}

@end
