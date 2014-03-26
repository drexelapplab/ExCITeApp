//
//  EngageViewController.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/19/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "EngageViewController.h"

@interface EngageViewController ()

@end

@implementation EngageViewController

- (id) init
{
    if (self = [super init])
    {
        self.title = @"Engage";
        self.tabBarItem.image = [UIImage imageNamed:@"engageIcon"];
        _hueFinder = [[DPHueDiscover alloc] initWithDelegate:self];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    UILabel *hueEngageLabel = [[UILabel alloc] initWithFrame:CGRectMake(124, 0, 520, 500)];
    hueEngageLabel.textColor = [UIColor whiteColor];
    hueEngageLabel.numberOfLines = 0;
    hueEngageLabel.textAlignment = NSTextAlignmentCenter;
    hueEngageLabel.text = @"The Phillips Hue lights are a wireless lighting solution, allowing users to create and control lighting environments using a tablet or smartphone. Use the sliders below to change the hue and brightness of the lights, and click 'save' to see your changes.";
    hueEngageLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    [self.view addSubview:hueEngageLabel];

    UILabel *hueLabel = [[UILabel alloc] initWithFrame:CGRectMake(131, 300, 100, 100)];
    hueLabel.textColor = [UIColor whiteColor];
    hueLabel.text = @"Hue:";
    hueLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    [self.view addSubview:hueLabel];

    hueSlider = [[UISlider alloc] initWithFrame:CGRectMake(131, 380, 500, 30)];
    hueSlider.maximumValue = 65025;
    hueSlider.minimumValue = 0;
    [self.view addSubview:hueSlider];
    
    UILabel *brightnessLabel = [[UILabel alloc] initWithFrame:CGRectMake(131, 440, 200, 100)];
    brightnessLabel.textColor = [UIColor whiteColor];
    brightnessLabel.text = @"Brightness:";
    brightnessLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    [self.view addSubview:brightnessLabel];
    
    briSlider = [[UISlider alloc] initWithFrame:CGRectMake(131, 520, 500, 30)];
    briSlider.maximumValue = 65025;
    briSlider.minimumValue = 0;
    [self.view addSubview:briSlider];

    saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveBtn.frame = CGRectMake(334, 600, 100, 40);
    saveBtn.backgroundColor = [UIColor lightGrayColor];
    saveBtn.tintColor = [UIColor whiteColor];
    [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(writeValues) forControlEvents:UIControlEventTouchUpInside];
    saveBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    [self.view addSubview:saveBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_hueFinder discoverForDuration:5 withCompletion:nil];
}

- (void) writeValues {
    [_hue readWithCompletion:^(DPHue *hue, NSError *err) {
        if(!err) {
            for(DPHueLight *light in hue.lights) {
                light.brightness = @((int)briSlider.value);
                light.hue = @((int)hueSlider.value);
                light.on = YES;
            }
            [hue writeAll];
        }
        else NSLog(@"Error: %@", err.localizedDescription);
    }];
}

- (void)foundHueAt:(NSString *)host discoveryLog:(NSString *)log
{
    NSString *username = @"newdeveloper";
    _hue = [[DPHue alloc] initWithHueHost:host username:username];
    [_hue registerUsername];
    
    NSLog(@"%@", host);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end