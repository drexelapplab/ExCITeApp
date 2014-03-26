//
//  DynamicMapButton.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 12/17/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DynamicMapButton.h"

@implementation DynamicMapButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        blockViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startGlowWithDelay:(CGFloat)delay
{
    _isGlowing = YES;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NSThread sleepForTimeInterval:delay];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
        
            [self startGlowingWithColor:[UIColor whiteColor] intensity:1];
            
        });
    });
}

- (void)startGlow
{
    _isGlowing = YES;
    [self startGlowing];
    
    for(UIView *view in blockViews) view.layer.borderColor = [UIColor greenColor].CGColor;
}
- (void)stopGlow
{

    _isGlowing = NO;
    [self stopGlowing];
    
    for(UIView *view in blockViews) view.layer.borderColor = [UIColor orangeColor].CGColor;
}

- (void)setMatrix:(NSArray *)matrix
{
    _matrix = matrix;
    
    NSArray *rowOne = matrix[0];
    
    _numCols = rowOne.count;
    _numRows = matrix.count;
    
    [self setNeedsDisplay];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
                UIColor *greenColor = UIColorFromRGB(0x1DDB73);
                [view.layer setBorderColor:greenColor.CGColor];
                [view.layer setBorderWidth:1];
                view.userInteractionEnabled = NO;
                [self addSubview:view];
                [blockViews addObject:view];
            }
        }
    }
}


@end
