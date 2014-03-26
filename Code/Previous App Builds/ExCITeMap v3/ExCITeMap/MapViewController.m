//
//  MapViewController.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/7/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "MapViewController.h"
#import "DynamicMapButton.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id) init
{
    if (self = [super init])
    {
        self.title = @"Map";
        self.tabBarItem.image = [UIImage imageNamed:@"mapIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // Fetch & parse local JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"mapDataPortrait" ofType:@"json"];
    NSError *error = nil;
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:0 error:&error];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:JSONData
                                                         options:0
                                                           error:&error];
    NSLog(@"%@", dict);
    
    NSArray *mapArray = dict[@"map"];
    
    mapView = [[DynamicMapView alloc] initWithFrame:CGRectMake(0, 0, 768, 910)];
    mapView.backgroundColor = UIColorFromRGB(0x636464);
    mapView.delegate = self;
    [mapView setArrayOfRows:mapArray];
    [self.view addSubview:mapView];
    
    NSArray *buttons = dict[@"buttons"];
    mapView.buttonsArray = buttons;
    
    infoView = [[UIView alloc] initWithFrame:CGRectMake(360, 375, 320, 50)];
    infoView.backgroundColor = [UIColor whiteColor];
    infoView.alpha = 0;
    [self.view addSubview:infoView];
    
    locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(370, 250, 300, 300)];
    locationLabel.numberOfLines = 0;
    locationLabel.textColor = [UIColor whiteColor];
    locationLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    [self.view addSubview:locationLabel];
    
    infoBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoBtn.frame = CGRectMake(630, 375, 50, 50);
    infoBtn.tintColor = [UIColor whiteColor];
    infoBtn.alpha = 0;
    [self.view addSubview:infoBtn];
    [infoBtn addTarget:self action:@selector(infoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)createButtonsInMap:(DynamicMapView *)dynamicMapView
{
    NSInteger blockWidth = dynamicMapView.frame.size.width / dynamicMapView.numCols;
    NSInteger blockHeight = dynamicMapView.frame.size.height / dynamicMapView.numRows;
    
    CGFloat delay = 0;
    
    for(NSDictionary *button in dynamicMapView.buttonsArray)
    {
        DynamicMapButton *newButton = [DynamicMapButton buttonWithType:UIButtonTypeCustom];
        newButton.title = button[@"title"];
        newButton.description = button[@"description"];
        newButton.matrix = button[@"matrix"]; // Has custom setter
        newButton.frame = CGRectMake(blockWidth * [button[@"x"] integerValue], blockHeight * [button[@"y"] integerValue], blockWidth * newButton.numCols, blockHeight * newButton.numRows);
        [newButton addTarget:self action:@selector(mapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [dynamicMapView addSubview:newButton];
        delay += .35;
        [newButton startGlowWithDelay:delay];
    }
}

#pragma mark - Button Methods

- (void)mapButtonPressed:(DynamicMapButton *)sender
{
    [sender stopGlow];
    
    for(DynamicMapButton *button in mapView.subviews)
    {
        if([button isMemberOfClass:[DynamicMapButton class]] && ![sender isEqual:button] && !button.isGlowing)
        {
            [button startGlow];
        }
    }
    
    if([sender isMemberOfClass:[DynamicMapButton class]])
    {
        if([sender.title isEqualToString:@"App Lab"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text = @"APP Lab";
            _detailTitle = @"APP Lab";
            _image = [UIImage imageNamed:@"shimaImg"];
            _text = @"In collaboration with the Pennoni Honors College, with founding support from Bentley Systems, the ExCITe Center welcomes the APP Lab. Open to all students across the university the APP Lab will serve as a resource for those interested in mobile app development, whether novice or advanced. The APP Lab will also sponsor periodic apps-related public events, University panels and demonstrations, student research and development projects throughout the year.\n\nThe APP Lab’s mission is to provide a resource for all Drexel students to become more competitive in the workplace by gaining exposure to the power of apps as well as experience in the various aspects of the process of defining, designing and testing apps in a cross-disciplinary and innovative learning environment.";

        }
        else if([sender.title isEqualToString:@"Conf"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text = @"Conference Room";
            _detailTitle = @"Conference Room";
            _image = [UIImage imageNamed:@"shimaImg"];
            _text = @"The conference room is a space for innovative collaboration.";
        }
        else if([sender.title isEqualToString:@"EGS"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text = @"Entrepreneurial Game Studio";
            _detailTitle = @"Entrepreneurial Game Studio";
            _image = [UIImage imageNamed:@"shimaImg"];
            _text = @"Entrepreneurial Game Studio (EGS) is a creative and experimental game development studio and publisher focused on developing the next generation of leaders in the mobile game industry. It provides a safe and encouraging environment for students to become entrepreneurs, by assisting them in developing and commercializing their games. Its measure of success is a student or students leaving EGS to start their own game company in Philadelphia. EGS's mission is to become a factory for mobile game startups and entrepreneurs and turn Philadelphia into a vibrant and leading hub for mobile game development in the world.";
        }
        else if([sender.title isEqualToString:@"Humanoids"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text = @"Humanoids";
            _detailTitle = @"Humanoids";
            _image = [UIImage imageNamed:@"huboImg"];
            _text = @"Drexel is the lead institution on the Hubo Project, which aims to create a standard humanoid platform in the United States. The central goal is to develop and disseminate a standard humanoid research platform: Hubo. The Hubo series of robots is developed by the Korean Advanced Institute for Science and Technology (KAIST). Its capabilities include smooth, human-like motions and force, torque, and inertial sensors for interacting with its environment.\n\nOur lab is focused on using Hubo for musical interaction, with the goal of enabling Hubo to participate in live mixed human/robot musical ensembles as a performer and a dancer.";
        }
        else if([sender.title isEqualToString:@"MRP"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text= @"Magnetic Resonator Piano";
            _detailTitle = @"Magnetic Resonator Piano";
            _image = [UIImage imageNamed:@"mrpImg"];
            _text = @"The magnetic resonator piano (MRP) is a hybrid acoustic-electronic instrument augmenting the grand piano. By using electromagnets to induce the strings to vibration, the MRP allows the performer to continuously shape the sound of every note. It preserves all the sounds and techniques of the acoustic piano, while expanding its vocabulary to include: indefinite sustain; crescendos (including crescendos from silence); harmonics on each string (8 to 16 harmonics are usable on the lower strings); new timbres which can be shaped in real time; and subtle pitch bends.\n\nThough some electronic keyboards allow the performer to shape a note after it has been sounded, few if any match the richness and expressivity of the acoustic piano. No concert pianist would choose even the most sophisticated digital piano over a moderate-quality acoustic grand. The MRP combines the rich sound of the acoustic piano with the flexibility of digital synthesis by augmenting, rather than replacing, an acoustic instrument.";
        }
        else if([sender.title isEqualToString:@"Restrooms"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text = @"Restrooms";
            infoBtn.alpha = 0;
        }
        else if([sender.title isEqualToString:@"Shima"])
        {
            infoBtn.alpha = 1;
            infoView.alpha = 0.125;
            locationLabel.text = @"Shima Seiki Haute Tech Lab";
            _detailTitle = @"Shima Seiki Haute Tech Lab";
            _image = [UIImage imageNamed:@"shimaImg"];
            _text = @"The Shima Seiki Haute Technology Laboratory is a multidisciplinary research initiative established by Genevieve Dion and professors from Drexel's College of Engineering, The iSchool at Drexel, College of Medicine, College Nursing and Health Professions and The School of Biomedical Engineering, Science, and Health Systems.\n\nThe establishment of the Shima Seiki Haute Technology Laboratory represents a growing partnership between Drexel University and Shima Seiki, the world leader in 3-D computerized knitting systems. Shima Seiki has donated 16 SDS-ONE APEX3 workstations, three state-of-the-art knitting machines and R&D support. The total aggregate value of this donation exceeds $1 million. The workstations accurately simulate fabric construction and provide researchers and designers the opportunity to create and simulate garment prototypes, import CAD specifications of their final products, and produce made-to-measure or mass-produced pieces on Shima Seiki knitting machines.";
        }
    }
}

- (void) infoButtonPressed {
    detailVC = [[DetailViewController alloc] initWithTitle:_detailTitle andImage:_image andText:_text];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
