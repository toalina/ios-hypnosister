//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Alina To on 3/31/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // the largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        // this gets rid of the extra line, picks up pen and makes new start point
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius // note this is currentRadius!
                    startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    // configure line width to 10 points
    path.lineWidth = 8;
    
    // configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // draw the line!
    [path stroke];
    
    CGRect imageRect = CGRectMake(bounds.size.width / 4.0, bounds.size.height / 4.0, bounds.size.width / 2.0, bounds.size.height / 2.0);
    [logoImage drawInRect:imageRect];
    
}


@end
