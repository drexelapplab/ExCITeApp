//
//  MapViewController.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/7/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id) init
{
    if (self = [super init])
    {
        self.title = @"Explore";
        self.tabBarItem.image = [UIImage imageNamed:@"mapIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

    UIImageView *map = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapImg"]];
    [self.view addSubview:map];
    
    applabBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    applabBtnImg = [UIImage imageNamed:@"applabBtn"];
    applabBtn.frame = CGRectMake(310, 760, 86, 99);
    [applabBtn setImage:applabBtnImg forState:UIControlStateNormal];
    [applabBtn startFade];
    [self.view addSubview:applabBtn];
    
    applabBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    applabBtnTouch.frame = CGRectMake(310, 760, 86, 99);
    applabBtnTouch.backgroundColor = [UIColor clearColor];
    [applabBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:applabBtnTouch];
    
    confBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    confBtnImg = [UIImage imageNamed:@"confBtn"];
    confBtn.frame = CGRectMake(147, 229, 49, 124);
    [confBtn setImage:confBtnImg forState:UIControlStateNormal];
    [confBtn addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [confBtn startFade];
    [self.view addSubview:confBtn];
    
    confBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confBtnTouch.frame = CGRectMake(147, 229, 49, 124);
    confBtnTouch.backgroundColor = [UIColor clearColor];
    [confBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confBtnTouch];
    
    egsBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    egsBtnImg = [UIImage imageNamed:@"egsBtn"];
    egsBtn.frame = CGRectMake(199, 84, 49, 96);
    [egsBtn setImage:egsBtnImg forState:UIControlStateNormal];
    [egsBtn addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [egsBtn startFade];
    [self.view addSubview:egsBtn];
    
    egsBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    egsBtnTouch.frame = CGRectMake(199, 84, 49, 96);
    egsBtnTouch.backgroundColor = [UIColor clearColor];
    [egsBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:egsBtnTouch];
    
    huboBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    huboBtnImg = [UIImage imageNamed:@"huboBtn"];
    huboBtn.frame = CGRectMake(139, 625, 51, 68);
    [huboBtn setImage:huboBtnImg forState:UIControlStateNormal];
    [huboBtn addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [huboBtn startFade];
    [self.view addSubview:huboBtn];
    
    huboBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    huboBtnTouch.frame = CGRectMake(139, 625, 51, 68);
    huboBtnTouch.backgroundColor = [UIColor clearColor];
    [huboBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:huboBtnTouch];
    
    mrpBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    mrpBtnImg = [UIImage imageNamed:@"mrpBtn"];
    mrpBtn.frame = CGRectMake(358, 884, 86, 37);
    [mrpBtn setImage:mrpBtnImg forState:UIControlStateNormal];
    [mrpBtn addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [mrpBtn startFade];
    [self.view addSubview:mrpBtn];
    
    mrpBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mrpBtnTouch.frame = CGRectMake(358, 884, 86, 37);
    mrpBtnTouch.backgroundColor = [UIColor clearColor];
    [mrpBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mrpBtnTouch];
    
    restroomsBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    restroomsBtnImg = [UIImage imageNamed:@"restroomsBtn"];
    restroomsBtn.frame = CGRectMake(210, 760, 49, 62);
    [restroomsBtn setImage:restroomsBtnImg forState:UIControlStateNormal];
    [restroomsBtn addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [restroomsBtn startFade];
    [self.view addSubview:restroomsBtn];
    
    restroomsBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    restroomsBtnTouch.frame = CGRectMake(210, 760, 49, 62);
    restroomsBtnTouch.backgroundColor = [UIColor clearColor];
    [restroomsBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restroomsBtnTouch];
    
    shimaBtn = [FadeButton buttonWithType:UIButtonTypeCustom];
    shimaBtnImg = [UIImage imageNamed:@"shimaBtn"];
    shimaBtn.frame = CGRectMake(103, 390, 45, 136);
    [shimaBtn setImage:shimaBtnImg forState:UIControlStateNormal];
    [shimaBtn addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [shimaBtn startFade];
    [self.view addSubview:shimaBtn];
    
    shimaBtnTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shimaBtnTouch.frame = CGRectMake(103, 390, 45, 136);
    shimaBtnTouch.backgroundColor = [UIColor clearColor];
    [shimaBtnTouch addTarget:self action:@selector(pathBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shimaBtnTouch];
    
    infoView = [[UIView alloc] initWithFrame:CGRectMake(360, 445, 320, 50)];
    infoView.backgroundColor = [UIColor whiteColor];
    infoView.alpha = 0;
    [self.view addSubview:infoView];
    
    locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(370, 320, 300, 300)];
    locationLabel.numberOfLines = 0;
    locationLabel.textColor = [UIColor whiteColor];
    locationLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    [self.view addSubview:locationLabel];
    
    infoBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    infoBtn.frame = CGRectMake(630, 445, 50, 50);
    infoBtn.tintColor = [UIColor whiteColor];
    infoBtn.alpha = 0;
    [self.view addSubview:infoBtn];
    [infoBtn addTarget:self action:@selector(infoBtnPress) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button Methods

- (void) pathBtnPress {
    infoBtn.alpha = 1;
    infoView.alpha = 0.125;
    if (applabBtnTouch.isHighlighted) {
        locationLabel.text = @"APP Lab";
        _detailTitle = @"APP Lab";
        _image = [UIImage imageNamed:@"shimaImg"];
        _text = @"In collaboration with the Pennoni Honors College, with founding support from Bentley Systems, the ExCITe Center welcomes the APP Lab. Open to all students across the university the APP Lab will serve as a resource for those interested in mobile app development, whether novice or advanced. The APP Lab will also sponsor periodic apps-related public events, University panels and demonstrations, student research and development projects throughout the year.\n\nThe APP Lab’s mission is to provide a resource for all Drexel students to become more competitive in the workplace by gaining exposure to the power of apps as well as experience in the various aspects of the process of defining, designing and testing apps in a cross-disciplinary and innovative learning environment.";
    } else if (confBtnTouch.isHighlighted) {
        locationLabel.text = @"Conference Room";
        _detailTitle = @"Conference Room";
        _image = [UIImage imageNamed:@"shimaImg"];
        _text = @"The conference room is a space for innovative collaboration.";
        infoBtn.alpha = 0;
    } else if (egsBtnTouch.isHighlighted) {
        locationLabel.text = @"Entrepreneurial Game Studio";
        _detailTitle = @"Entrepreneurial Game Studio";
        _image = [UIImage imageNamed:@"shimaImg"];
        _text = @"Entrepreneurial Game Studio (EGS) is a creative and experimental game development studio and publisher focused on developing the next generation of leaders in the mobile game industry. It provides a safe and encouraging environment for students to become entrepreneurs, by assisting them in developing and commercializing their games. Its measure of success is a student or students leaving EGS to start their own game company in Philadelphia. EGS's mission is to become a factory for mobile game startups and entrepreneurs and turn Philadelphia into a vibrant and leading hub for mobile game development in the world.";
    } else if (huboBtnTouch.isHighlighted ) {
        locationLabel.text = @"Humanoids";
        _detailTitle = @"Humanoids";
        _image = [UIImage imageNamed:@"huboImg"];
        _text = @"Drexel is the lead institution on the Hubo Project, which aims to create a standard humanoid platform in the United States. The central goal is to develop and disseminate a standard humanoid research platform: Hubo. The Hubo series of robots is developed by the Korean Advanced Institute for Science and Technology (KAIST). Its capabilities include smooth, human-like motions and force, torque, and inertial sensors for interacting with its environment.\n\nOur lab is focused on using Hubo for musical interaction, with the goal of enabling Hubo to participate in live mixed human/robot musical ensembles as a performer and a dancer.";
    } else if (mrpBtnTouch.isHighlighted) {
        locationLabel.text= @"Magnetic Resonator Piano";
        _detailTitle = @"Magnetic Resonator Piano";
        _image = [UIImage imageNamed:@"mrpImg"];
        _text = @"The magnetic resonator piano (MRP) is a hybrid acoustic-electronic instrument augmenting the grand piano. By using electromagnets to induce the strings to vibration, the MRP allows the performer to continuously shape the sound of every note. It preserves all the sounds and techniques of the acoustic piano, while expanding its vocabulary to include: indefinite sustain; crescendos (including crescendos from silence); harmonics on each string (8 to 16 harmonics are usable on the lower strings); new timbres which can be shaped in real time; and subtle pitch bends.\n\nThough some electronic keyboards allow the performer to shape a note after it has been sounded, few if any match the richness and expressivity of the acoustic piano. No concert pianist would choose even the most sophisticated digital piano over a moderate-quality acoustic grand. The MRP combines the rich sound of the acoustic piano with the flexibility of digital synthesis by augmenting, rather than replacing, an acoustic instrument.";
    } else if (restroomsBtnTouch.isHighlighted ) {
        locationLabel.text = @"Restrooms";
        infoBtn.alpha = 0;
    } else if (shimaBtnTouch.isHighlighted) {
        locationLabel.text = @"Shima Seiki Haute Tech Lab";
        _detailTitle = @"Shima Seiki Haute Tech Lab";
        _image = [UIImage imageNamed:@"shimaImg"];
        _text = @"The Shima Seiki Haute Technology Laboratory is a multidisciplinary research initiative established by Genevieve Dion and professors from Drexel's College of Engineering, The iSchool at Drexel, College of Medicine, College Nursing and Health Professions and The School of Biomedical Engineering, Science, and Health Systems.\n\nThe establishment of the Shima Seiki Haute Technology Laboratory represents a growing partnership between Drexel University and Shima Seiki, the world leader in 3-D computerized knitting systems. Shima Seiki has donated 16 SDS-ONE APEX3 workstations, three state-of-the-art knitting machines and R&D support. The total aggregate value of this donation exceeds $1 million. The workstations accurately simulate fabric construction and provide researchers and designers the opportunity to create and simulate garment prototypes, import CAD specifications of their final products, and produce made-to-measure or mass-produced pieces on Shima Seiki knitting machines.";
    }
}

- (void) infoBtnPress {
    detailVC = [[DetailViewController alloc] initWithTitle:_detailTitle andImage:_image andText:_text];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Memory

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
