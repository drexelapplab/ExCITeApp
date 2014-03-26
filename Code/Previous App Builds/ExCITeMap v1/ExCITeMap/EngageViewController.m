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
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
	
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
        UILabel *hueEngageLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 100, 200, 30)];
        hueEngageLabel.textColor = [UIColor whiteColor];
        hueEngageLabel.text = @"Hue Light Settings";
        [self.view addSubview:hueEngageLabel];
    
        UILabel *brightnessLabel = [[UILabel alloc] initWithFrame:CGRectMake(131, 130, 100, 100)];
        brightnessLabel.textColor = [UIColor whiteColor];
        brightnessLabel.text = @"Brightness:";
        [self.view addSubview:brightnessLabel];
    
        briSlider = [[UISlider alloc] initWithFrame:CGRectMake(131, 200, 500, 30)];
        briSlider.maximumValue = 65025;
        briSlider.minimumValue = 0;
        [self.view addSubview:briSlider];
    
        UILabel *hueLabel = [[UILabel alloc] initWithFrame:CGRectMake(131, 230, 100, 100)];
        hueLabel.textColor = [UIColor whiteColor];
        hueLabel.text = @"Hue:";
        [self.view addSubview:hueLabel];
    
        hueSlider = [[UISlider alloc] initWithFrame:CGRectMake(131, 300, 500, 30)];
        hueSlider.maximumValue = 65025;
        hueSlider.minimumValue = 0;
        [self.view addSubview:hueSlider];
    
        saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        saveBtn.frame = CGRectMake(360, 400, 50, 20);
        saveBtn.backgroundColor = [UIColor lightGrayColor];
        saveBtn.tintColor = [UIColor whiteColor];
        [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
        [saveBtn addTarget:self action:@selector(writeValues) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:saveBtn];
        
    } else {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        
        UILabel *hueEngageLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, 200, 30)];
        hueEngageLabel.textColor = [UIColor whiteColor];
        hueEngageLabel.text = @"Hue Light Settings";
        [self.view addSubview:hueEngageLabel];
        
        UILabel *brightnessLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 130, 100, 100)];
        brightnessLabel.textColor = [UIColor whiteColor];
        brightnessLabel.text = @"Brightness:";
        [self.view addSubview:brightnessLabel];
        
        briSlider = [[UISlider alloc] initWithFrame:CGRectMake(60, 200, 200, 30)];
        briSlider.maximumValue = 65025;
        briSlider.minimumValue = 0;
        [self.view addSubview:briSlider];
        
        UILabel *hueLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 230, 100, 100)];
        hueLabel.textColor = [UIColor whiteColor];
        hueLabel.text = @"Hue:";
        [self.view addSubview:hueLabel];
        
        hueSlider = [[UISlider alloc] initWithFrame:CGRectMake(60, 300, 200, 30)];
        hueSlider.maximumValue = 65025;
        hueSlider.minimumValue = 0;
        [self.view addSubview:hueSlider];
        
        saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        saveBtn.frame = CGRectMake(135, 400, 50, 20);
        saveBtn.backgroundColor = [UIColor lightGrayColor];
        saveBtn.tintColor = [UIColor whiteColor];
        [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
        [saveBtn addTarget:self action:@selector(writeValues) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:saveBtn];
    }
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