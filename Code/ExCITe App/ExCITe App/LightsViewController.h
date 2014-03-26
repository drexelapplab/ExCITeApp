//
//  LightsViewController.h
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DPHue.h"
#import "DPHueLight.h"
#import "ios-color-wheel.h"
#import "LightsView.h"

@interface LightsViewController : UIViewController <ISColorWheelDelegate>
{
    UILabel *colorPickerLabel;
    UIView *colorPickerContent;
    NSArray *lightViews;
    UISlider *briSlider;
}

@property (strong, nonatomic) ISColorWheel *colorWheel;
@property (strong, nonatomic) DPHue *hue;

@end