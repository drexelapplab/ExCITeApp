//
//  LightsView.m
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/11/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import "LightsView.h"

@implementation LightsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hueLightNormal"]];
        _lightColorView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapped:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark - Layout Subviews

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    UIView *darkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 100)];
    darkView.backgroundColor = UIColorFromRGB(0xbdc3c7); // #bdc3c7 is light gray (silver if using flatuicolors.com)
    [self addSubview:darkView];
    
    [_lightColorView setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 100)];
    _lightColorView.backgroundColor = UIColorFromRGB(0xbdc3c7); // #bdc3c7 is light gray (silver if using flatuicolors.com)
    [self addSubview:_lightColorView];
    
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    [_lightImageView setFrame:frame];
    [self addSubview:_lightImageView];
}

#pragma mark - Light Tap Methods

- (void) gestureTapped:(UITapGestureRecognizer *)sender
{
    [self setIsSelected:!_isSelected];
}

- (void) setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (_isSelected)
    {
        [_lightImageView setImage:[UIImage imageNamed:@"hueLightSelected"]];
    }
    else
    {
        [_lightImageView setImage:[UIImage imageNamed:@"hueLightNormal"]];
    }
}

@end
