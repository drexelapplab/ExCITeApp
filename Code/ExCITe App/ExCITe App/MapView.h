//
//  MapView.h
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIView.h>

@class MapView;

@protocol MapViewDelegate <NSObject>

- (void)createButtonsInMap:(MapView *)dynamicMapView;

@end

@interface MapView : UIView

@property (strong, nonatomic) NSArray *arrayOfRows;
@property (strong, nonatomic) NSArray *buttonsArray;
@property (nonatomic) NSInteger numRows;
@property (nonatomic) NSInteger numCols;

@property (nonatomic, weak) id<MapViewDelegate> delegate;

@end
