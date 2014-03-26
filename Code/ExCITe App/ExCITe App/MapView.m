//
//  MapView.m
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (void)setArrayOfRows:(NSArray *)arrayOfRows
{
    // Calculate the number of rows and columns with which to initialize the map.
    _arrayOfRows = arrayOfRows;
    NSArray *rowOne = arrayOfRows[0];
    
    _numCols = rowOne.count;
    _numRows = arrayOfRows.count;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Remove all subviews.
    for(UIView *view in self.subviews) [view removeFromSuperview];
    
    // Calculate block width and height for dynamic map generation.
    NSInteger blockWidth = self.frame.size.width / _numCols;
    NSInteger blockHeight = self.frame.size.height / _numRows;
    
    // Draw nothing, filled, or outlined rectangles based on the matrix of 0s, 1s, and 2s in mapDataLandscape.json.
    for (NSInteger i = 0; i < _numCols; i++) {
        for (NSInteger j = 0; j < _numRows; j++) {
            NSArray *row = _arrayOfRows[j];
            NSNumber *num = row[i];
            UIColor *concreteColor = UIColorFromRGB(0x95a5a6); // #95a5a6 is gray (concrete if using flatuicolors.com)
            if ([num integerValue] == 1) {
                CGContextRef context = UIGraphicsGetCurrentContext();
                
                CGContextSetFillColorWithColor(context, concreteColor.CGColor);
                CGRect blockRect = CGRectMake(i*blockWidth, j*blockHeight, blockWidth, blockHeight);
                CGContextFillRect(context, blockRect);
            }
            else if([num integerValue] == 2)
            {
                CGRect blockRect = CGRectMake(i*blockWidth, j*blockHeight, blockWidth, blockHeight);
                UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:blockRect];
                [concreteColor setStroke];
                rectanglePath.lineWidth = 2.0;
                [rectanglePath stroke];
            }
        }
    }
    
    if([_delegate respondsToSelector:@selector(createButtonsInMap:)]) [_delegate createButtonsInMap:self];
}

@end
