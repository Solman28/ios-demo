//
//  CustomToolBarTextPerfil.m
//  MiFarma-Fasa
//
//  Created by Mi Manzana on 1/9/14.
//  Copyright (c) 2014 Janaq. All rights reserved.
//

#import "CustomToolBarTextPerfil.h"

@implementation CustomToolBarTextPerfil

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 247.0/255.0f, 247.0/255.0f, 247.0/255.0f, 1);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    CGContextSetLineWidth(context, 1);
    
    CGContextSetRGBStrokeColor(context, 200/255.0f, 200/255.0f, 200/255.0f, 1.0f);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, rect.size.width, 0);
    
    CGContextStrokePath(context);
    CGContextRestoreGState(context);

}


@end
