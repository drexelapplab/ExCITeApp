//
//  MapButton.m
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import "MapButton.h"

@implementation MapButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        blockViews = [[NSMutableArray alloc] init];
    }
    return self;
}
    
#pragma mark - Map Matrix Creation Methods
    
- (void)setMatrix:(NSArray *)matrix
{
    _matrix = matrix;
    
    NSArray *rowOne = matrix[0];
    
    _numCols = rowOne.count;
    _numRows = matrix.count;
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect
{
    for(UIView *view in self.subviews) [view removeFromSuperview];
    [blockViews removeAllObjects];
    [super drawRect:rect];
    
    NSInteger blockWidth = self.frame.size.width / _numCols;
    NSInteger blockHeight = self.frame.size.height / _numRows;
    
    for (NSInteger i = 0; i < _numCols; i++)
    {
        for (NSInteger j = 0; j < _numRows; j++)
        {
            NSArray *row = _matrix[j];
            NSNumber *num = row[i];
            
            if([num integerValue] == 1)
            {
                UIView *view = [[UIView alloc] init];
                [view setFrame:CGRectMake(i*blockWidth, j*blockHeight, blockWidth, blockHeight)];
                UIColor *concreteColor = UIColorFromRGB(0x95a5a6); // #95a5a6 is gray (concrete if using flatuicolors.com)
                [view.layer setBorderColor:concreteColor.CGColor];
                [view.layer setBackgroundColor:concreteColor.CGColor];
                [view.layer setBorderWidth:1];
                view.userInteractionEnabled = NO;
                [self addSubview:view];
                [blockViews addObject:view];
            }
        }
    }
}

#pragma mark - Glow Methods

- (void)startGlowWithDelay:(CGFloat)delay
{
    _isGlowing = YES;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NSThread sleepForTimeInterval:delay];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            UIColor *emeraldColor = UIColorFromRGB(0x2ecc71); // #2ecc71 is green (emerald if using flatuicolors.com)
            [self startGlowingWithColor:emeraldColor intensity:1];
            [emeraldColor setFill];
        });
    });
}

- (void)startGlow
{
    _isGlowing = YES;
    [self startGlowing];
    
    UIColor *concreteColor = UIColorFromRGB(0x95a5a6); // #95a5a6 is gray (concrete if using flatuicolors.com)
    
    for(UIView *view in blockViews) {
        view.layer.backgroundColor = concreteColor.CGColor;
        view.layer.borderColor = concreteColor.CGColor;
    }
}
    
- (void)stopGlow
{
    _isGlowing = NO;
    [self stopGlowing];
    
    UIColor *nephritisColor = UIColorFromRGB(0x27ae60); // #27ae60 is dark green (nephritis if using flatuicolors.com)
    for(UIView *view in blockViews) view.layer.borderColor = nephritisColor.CGColor;
    for(UIView *view in blockViews) view.layer.backgroundColor = nephritisColor.CGColor;
}

@end
