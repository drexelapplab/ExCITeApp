//
//  LightsView.h
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/11/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LightsView : UIView

@property (nonatomic) BOOL isSelected;
@property (nonatomic, strong) UIImageView *lightImageView;
@property (nonatomic, strong) UIView *lightColorView;

@end
