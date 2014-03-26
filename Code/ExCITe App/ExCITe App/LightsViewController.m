//
//  LightsViewController.m
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import "LightsViewController.h"

@interface LightsViewController ()

@end

@implementation LightsViewController

- (id)init
{
    if (self = [super init])
    {
        self.title = @"Lights";
        self.tabBarItem.image = [UIImage imageNamed:@"lightsIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UITabBar appearance] setTintColor:UIColorFromRGB(0xfdfdfd)]; // #fdfdfd is off-white
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorFromRGB(0xfdfdfd); // #fdfdfd is off-white
    
    // Set up light control area.
    colorPickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, 1024, 44)];
    colorPickerLabel.backgroundColor = UIColorFromRGB(0x3498db); // #3498db is blue (peter river if using flatuicolors.com)
    NSString *colorPickerText = @"Light Controls";
    colorPickerLabel.text = [NSString stringWithFormat:@"   %@", colorPickerText];
    colorPickerLabel.textColor = UIColorFromRGB(0xfdfdfd); // #fdfdfd is off-white
    colorPickerLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    [self.view addSubview:colorPickerLabel];
    
    colorPickerContent = [[UIView alloc] initWithFrame:CGRectMake(0, 444, 1024, 204)];
    colorPickerContent.backgroundColor = UIColorFromRGB(0x2980b9); // #2980b9 is dark blue (belize hole if using flatuicolors.com)
    [self.view addSubview:colorPickerContent];
    
    // Add hue light graphics.
    LightsView *hueLightOne = [[LightsView alloc] initWithFrame:CGRectMake(25, 50, 168, 298)];
    [self.view addSubview:hueLightOne];
    
    LightsView *hueLightTwo = [[LightsView alloc] initWithFrame:CGRectMake(225, 50, 168, 298)];
    [self.view addSubview:hueLightTwo];
    
    LightsView *hueLightThree = [[LightsView alloc] initWithFrame:CGRectMake(425, 50, 168, 298)];
    [self.view addSubview:hueLightThree];
    
    LightsView *hueLightFour = [[LightsView alloc] initWithFrame:CGRectMake(625, 50, 168, 298)];
    [self.view addSubview:hueLightFour];
    
    LightsView *hueLightFive = [[LightsView alloc] initWithFrame:CGRectMake(825, 50, 168, 298)];
    [self.view addSubview:hueLightFive];
    
    lightViews = @[hueLightOne, hueLightTwo, hueLightThree, hueLightFour, hueLightFive];
    
    // Add brightness slider to view.
    UIImageView *brightnessIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brightnessIcon"]];
    brightnessIcon.frame = CGRectMake(40, 532, 25, 25);
    [self.view addSubview:brightnessIcon];
    
    briSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 530, 290, 30)];
    briSlider.maximumValue = 255;
    briSlider.minimumValue = 0;
    [briSlider setMinimumTrackTintColor:UIColorFromRGB(0x3498db)]; // #3498db is blue (peter river if using flatuicolors.com)
    briSlider.value = 255;
    [briSlider addTarget:self action:@selector(brightnessUpdated:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:briSlider];
    
    // Add color wheel to view.
    _colorWheel = [[ISColorWheel alloc] init];
    [_colorWheel setTranslatesAutoresizingMaskIntoConstraints:NO];
    _colorWheel.delegate = self;
    [colorPickerContent addSubview:_colorWheel];
    
    // Set up layout constraints so that the color wheel is always centered within its view.
    {
        NSLayoutConstraint *constraint;
        
        constraint = [NSLayoutConstraint constraintWithItem:_colorWheel
                                                  attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:_colorWheel.superview
                                                  attribute:NSLayoutAttributeCenterX
                                                 multiplier:1 constant:0];
        [_colorWheel.superview addConstraint:constraint];
        
        constraint = [NSLayoutConstraint constraintWithItem:_colorWheel
                                                  attribute:NSLayoutAttributeCenterY
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:_colorWheel.superview
                                                  attribute:NSLayoutAttributeCenterY
                                                 multiplier:1 constant:0];
        [_colorWheel.superview addConstraint:constraint];
        
        constraint = [NSLayoutConstraint constraintWithItem:_colorWheel
                                                  attribute:NSLayoutAttributeWidth
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:nil
                                                  attribute:NSLayoutAttributeWidth
                                                 multiplier:1 constant:180];
        [_colorWheel.superview addConstraint:constraint];
        
        constraint = [NSLayoutConstraint constraintWithItem:_colorWheel
                                                  attribute:NSLayoutAttributeHeight
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:_colorWheel
                                                  attribute:NSLayoutAttributeWidth
                                                 multiplier:1 constant:0];
        [_colorWheel.superview addConstraint:constraint];
    }
    
    // Create a button that selects all lights.
    UIButton *selectAllButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [selectAllButton setTitle:@"Select All" forState:UIControlStateNormal];
    [selectAllButton setTitleColor:UIColorFromRGB(0xfdfdfd) forState:UIControlStateNormal]; // #fdfdfd is off-white
    selectAllButton.frame = CGRectMake(750, 20, 100, 100);
    [selectAllButton addTarget:self action:@selector(selectAllLights) forControlEvents:UIControlEventTouchUpInside];
    [colorPickerContent addSubview:selectAllButton];
    
    // Create a button that deselects all lights.
    UIButton *selectNoneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [selectNoneButton setTitle:@"Select None" forState:UIControlStateNormal];
    [selectNoneButton setTitleColor:UIColorFromRGB(0xfdfdfd) forState:UIControlStateNormal]; // #fdfdfd is off-white
    selectNoneButton.frame = CGRectMake(750, 80, 100, 100);
    [selectNoneButton addTarget:self action:@selector(deselectAllLights) forControlEvents:UIControlEventTouchUpInside];
    [colorPickerContent addSubview:selectNoneButton];
}

#pragma mark - Selection Methods

- (void)selectAllLights
{
    for(LightsView *lv in lightViews)
    {
        lv.isSelected = YES;
    }
}

- (void)deselectAllLights
{
    for(LightsView *lv in lightViews)
    {
        lv.isSelected = NO;
    }
}

#pragma mark - Light Update Methods

- (void) brightnessUpdated:(UISlider *)sender
{
    for(NSInteger i = 0; i < lightViews.count; i++)
    {
        LightsView *lv = lightViews[i];
        lv.lightColorView.alpha = sender.value / sender.maximumValue;
    }
}

- (void) colorWheelDidChangeColor:(UIColor *)color
{
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    NSInteger scaledHue = hue * 65535;
    NSInteger scaledSat = saturation * 255;
    
    [_hue readWithCompletion:^(DPHue *hue, NSError *err){
        
        if(_hue.lights.count == lightViews.count)
        {
            for(NSInteger i = 0; i < lightViews.count; i++)
            {
                LightsView *lv = lightViews[i];
                DPHueLight *light = _hue.lights[i];
                if(lv.isSelected)
                {
                    [UIView animateWithDuration:0.4 animations:^{
                        lv.lightColorView.backgroundColor = color;
                    }];
                    
                    light.brightness = @((int)briSlider.value);
                    light.hue = @(scaledHue);
                    light.saturation = @(scaledSat);
                    [light write];
                }
            }
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _hue = [[DPHue alloc] initWithHueHost:@"144.118.172.100" username:@"newdeveloper"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end

