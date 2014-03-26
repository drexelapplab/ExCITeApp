//
//  EngageViewController.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/19/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DPHue.h"
#import "DPHueDiscover.h"
#import "DPHueLight.h"

@interface EngageViewController : UIViewController <DPHueDiscoverDelegate> {
    UIButton *saveBtn;
    UISlider *briSlider;
    UISlider *hueSlider;
}

@property(strong, nonatomic) DPHueDiscover *hueFinder;
@property(strong, nonatomic) DPHue *hue;

@end