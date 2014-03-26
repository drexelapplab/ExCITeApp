//
//  DynamicMapView.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 12/11/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DynamicMapView;

@protocol DynamicMapViewDelegate <NSObject>

- (void)createButtonsInMap:(DynamicMapView *)dynamicMapView;

@end

@interface DynamicMapView : UIView

@property (strong, nonatomic) NSArray *arrayOfRows;
@property (strong, nonatomic) NSArray *buttonsArray;
@property (nonatomic) NSInteger numRows;
@property (nonatomic) NSInteger numCols;
@property (strong, nonatomic) UIColor *darkGreenColor;
@property (nonatomic, weak) id<DynamicMapViewDelegate> delegate;

@end
