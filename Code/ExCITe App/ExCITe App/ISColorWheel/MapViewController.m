//
//  MapViewController.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/7/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "MapViewController.h"

// Set the information that will display when map is initialized.
static NSString * const InitialDescription = @"Drexel's Expressive and Creative Interaction Technologies (ExCITe) Center is a University-wide strategic initiative bringing together faculty, students, and entrepreneurs from engineering, fashion design, digital media, performing arts, computer and information science, product design, and many other fields to pursue highly multi-disciplinary collaborative projects.\n\nThe research and education activities of the ExCITe Center emphasize the arts-integrated approach of STEAM* [vs. traditional STEM]. Additionally, ExCITe serves to connect knowledge and resources across Philadelphia through civic, arts and culture, and industry partnerships with other institutions and organizations in the region.\n\nThe ExCITe Center is a street-level, highly visible space at the corner of Market and 34th Streets in University City. The location includes unique facilities, including the Shima Seiki Haute Technology Lab, but much of the 10,000 square-foot space is dedicated to project collaboration, presentation, and co-working.\n\n* STEAM: Science, Technology, Engineering, Arts & Design, and Mathematics";
static NSString * const InitialLabel = @"Welcome to the ExCITe Center";

@interface MapViewController ()

@end

@implementation MapViewController

- (id) init
{
    if (self = [super init])
    {
        // Set nav bar title.
        self.title = @"Map";
        
        // Set tab bar icon.
        self.tabBarItem.image = [UIImage imageNamed:@"mapIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Apply styling to the nav bar.
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // Fetch and parse local JSON file.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"mapData" ofType:@"json"];
    NSError *error = nil;
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:0 error:&error];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:JSONData
                                                         options:0
                                                           error:&error];
    NSArray *mapArray = dict[@"map"];
    
    // Initialize the map view.
    mapView = [[MapView alloc] initWithFrame:CGRectMake(-5, 10, 1060, 648)];
    mapView.backgroundColor = UIColorFromRGB(0xfdfdfd); // #fdfdfd is off-white
    mapView.delegate = self;
    [mapView setArrayOfRows:mapArray];
    [self.view addSubview:mapView];
    
    // Create an array of buttons from the previously created dictionary.
    NSArray *buttons = dict[@"buttons"];
    mapView.buttonsArray = buttons;
    
    // Create label view.
    locationLabelView = [[UIView alloc] initWithFrame:CGRectMake(265, 310, 730, 44)];
    locationLabelView.backgroundColor = UIColorFromRGB(0x3498db); // #3498db is blue (peter river if using flatuicolors.com)
    locationLabelView.alpha = 0;
    [self.view addSubview:locationLabelView];
    
    // Create label.
    locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 310, 730, 44)];
    locationLabel.textColor = UIColorFromRGB(0xfdfdfd); // #fdfdfd is off-white
    locationLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    [self.view addSubview:locationLabel];
    
    // Create location view.
    locationView = [[UIView alloc] initWithFrame:CGRectMake(265, 354, 730, 255)];
    locationView.backgroundColor = UIColorFromRGB(0x2980b9); // #2980b9 is dark blue (belize hole if using flatuicolors.com)
    locationView.alpha = 0;
    [self.view addSubview:locationView];
    
    // Create location textView.
    locationInfo = [[UITextView alloc] initWithFrame:CGRectMake(273, 354, 710, 246)];
    locationInfo.backgroundColor = [UIColor clearColor];
    locationInfo.textColor = UIColorFromRGB(0xfdfdfd); // #fdfdfd is off-white
    locationInfo.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    [self.view addSubview:locationInfo];
    locationInfo.editable = NO;
    
    // Animate views in.
    [UIView animateWithDuration:0.4 animations:^{
        locationLabelView.alpha = 1;
        locationView.alpha = 1;
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Update mapView.
    [mapView setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Set the 'Welcome' button to pressed upon map initialization.
    for(MapButton *button in mapView.subviews)
    {
        if([button isKindOfClass:[MapButton class]])
        {
            if([button.title isEqualToString:@"Welcome to the ExCITe Center"])
            {
                
                [button sendActionsForControlEvents:UIControlEventTouchUpInside];
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    
                    [NSThread sleepForTimeInterval:.25];
                    
                    dispatch_async(dispatch_get_main_queue(), ^(void) {
                        [button stopGlowing];
                    });
                });
            }
        }
    }
}

#pragma mark - Button Methods

- (void)createButtonsInMap:(MapView *)dynamicMapView
{
    // Calculate block width and height for dynamic map generation.
    NSInteger blockWidth = dynamicMapView.frame.size.width / dynamicMapView.numCols;
    NSInteger blockHeight = dynamicMapView.frame.size.height / dynamicMapView.numRows;
    
    // Initialize the glow delay with 0.
    CGFloat delay = 0;
    
    // Create a button for each button object listed in mapDataLandscape.json.
    for(NSDictionary *button in mapView.buttonsArray)
    {
        MapButton *newButton = [MapButton buttonWithType:UIButtonTypeCustom];
        newButton.title = button[@"title"];
        newButton.description = button[@"description"];
        newButton.matrix = button[@"matrix"]; // Has custom setter
        newButton.frame = CGRectMake(blockWidth * [button[@"x"] integerValue], blockHeight * [button[@"y"] integerValue], blockWidth * newButton.numCols, blockHeight * newButton.numRows);
        [newButton addTarget:self action:@selector(mapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [dynamicMapView addSubview:newButton];
        // Increment delay so that buttons glow at different times.
        delay += 0.25;
        [newButton startGlowWithDelay:delay];
    }
}

- (void)mapButtonPressed:(MapButton *)sender
{
    // Stop the glowing on the pressed button.
    [sender stopGlow];
    
    // Ensure that all buttons (except for the one currently pressed) are glowing.
    for(MapButton *button in mapView.subviews)
    {
        if([button isMemberOfClass:[MapButton class]] && ![sender isEqual:button] && !button.isGlowing)
        {
            [button startGlow];
        }
    }
    
    // Animate information change depending on which button was pressed.
    if([sender isMemberOfClass:[MapButton class]])
    {
        if([sender.title isEqualToString:@"Welcome to the ExCITe Center"] && ![locationLabel.text isEqualToString:[NSString stringWithFormat:@"   %@", sender.title]])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Magnetic Resonator Piano"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Restrooms"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Humanoid Robotics"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"APP Lab"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Shima Seiki Haute Technology Laboratory"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Conference Room"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Meeting Area"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
        else if([sender.title isEqualToString:@"Entrepreneurial Game Studio"])
        {
            [UIView animateWithDuration:0.4 animations:^{
                locationLabel.alpha = 0;
                locationInfo.alpha = 0;
            } completion:^(BOOL finished) {
                locationLabel.text = [NSString stringWithFormat:@"   %@", sender.title];
                locationInfo.text = sender.description;
                [UIView animateWithDuration:0.4 animations:^{
                    locationLabel.alpha = 1;
                    locationInfo.alpha = 1;
                }];
            }];
        }
    }
}

@end