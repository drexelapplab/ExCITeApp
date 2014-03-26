//
//  DynamicMapView.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 12/11/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DynamicMapView.h"

@implementation DynamicMapView

- (void)setArrayOfRows:(NSArray *)arrayOfRows {
    _arrayOfRows = arrayOfRows;
    NSArray *rowOne = arrayOfRows[0];
    
    _numCols = rowOne.count;
    _numRows = arrayOfRows.count;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    for(UIView *view in self.subviews) [view removeFromSuperview];
    
    [super drawRect:rect];
    NSInteger blockWidth = self.frame.size.width / _numCols;
    NSInteger blockHeight = self.frame.size.height / _numRows;
    
    for (NSInteger i = 0; i < _numCols; i++) {
        for (NSInteger j = 0; j < _numRows; j++) {
            NSArray *row = _arrayOfRows[j];
            NSNumber *num = row[i];
            _darkGreenColor = UIColorFromRGB(0x27ae60);
            if ([num integerValue] == 1) {
                CGContextRef context = UIGraphicsGetCurrentContext();

                CGContextSetFillColorWithColor(context, _darkGreenColor.CGColor);
                CGRect blockRect = CGRectMake(i*blockWidth, j*blockHeight, blockWidth, blockHeight);
                CGContextFillRect(context, blockRect);
            }
            else if([num integerValue] == 2)
            {
                CGRect blockRect = CGRectMake(i*blockWidth, j*blockHeight, blockWidth, blockHeight);
                UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:blockRect];
                [_darkGreenColor setStroke];
                rectanglePath.lineWidth = 2.0;
                [rectanglePath stroke];
            }
        }
    }
    
    if([_delegate respondsToSelector:@selector(createButtonsInMap:)]) [_delegate createButtonsInMap:self];
}

@end
