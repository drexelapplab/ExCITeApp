//
//  DynamicMapButton.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 12/17/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Glow.h"

@interface DynamicMapButton : UIButton
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
