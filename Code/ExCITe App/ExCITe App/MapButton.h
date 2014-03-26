//
//  MapButton.h
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIView.h>

#import "UIView+Glow.h"

@interface MapButton : UIButton
{
    // Used to house the views that have a border
    // for glowing and selection.
    NSMutableArray *blockViews;
    
    NSTimer *glowTimer;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong) NSArray *matrix;

@property (nonatomic) NSInteger numRows;
@property (nonatomic) NSInteger numCols;
@property (nonatomic) BOOL isGlowing;

- (void)startGlowWithDelay:(CGFloat)delay;
- (void)startGlow;
- (void)stopGlow;

@end
