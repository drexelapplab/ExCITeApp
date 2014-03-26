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
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIImageView *map = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"padMap"]];
        [self.view addSubview:map];
        
        infoView = [[UIView alloc] initWithFrame:CGRectMake(400, 200, 335, 500)];
        infoView.backgroundColor = [UIColor whiteColor];
        infoView.alpha = 0;
        [self.view addSubview:infoView];
        
        imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(420, 220, 295, 170);
        imageView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:imageView];
        
        locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(420, 365, 300, 150)];
        locationLabel.font = [UIFont fontWithName:@"Helvetica" size:30];
        locationLabel.numberOfLines = 0;
        locationLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:locationLabel];
        
        locationText = [[UITextView alloc] init];
        locationText.frame = CGRectMake(415, 480, 295, 250);
        locationText.backgroundColor = [UIColor clearColor];
        locationText.textColor = [UIColor whiteColor];
        locationText.editable = NO;
        [self.view addSubview:locationText];
        
        appLabBtn = [[UIButton alloc] initWithFrame:CGRectMake(240, 613, 88, 88)];
        [appLabBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *appLabIcon = [UIImage imageNamed:@"padAppLabBtn"];
        [appLabBtn setImage:appLabIcon forState:UIControlStateNormal];
        UIImage *appLabIconPressed = [UIImage imageNamed:@"padAppLabBtnPressed"];
        [appLabBtn setImage:appLabIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:appLabBtn];
        
        conferenceBtn = [[UIButton alloc] initWithFrame:CGRectMake(242, 226, 88, 88)];
        [conferenceBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *conferenceIcon = [UIImage imageNamed:@"padConferenceBtn"];
        [conferenceBtn setImage:conferenceIcon forState:UIControlStateNormal];
        UIImage *conferenceIconPressed = [UIImage imageNamed:@"padConferenceBtnPressed"];
        [conferenceBtn setImage:conferenceIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:conferenceBtn];
        
        egsBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 96, 88, 88)];
        [egsBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *egsIcon = [UIImage imageNamed:@"padEgsBtn"];
        [egsBtn setImage:egsIcon forState:UIControlStateNormal];
        UIImage *egsIconPressed = [UIImage imageNamed:@"padEgsBtnPressed"];
        [egsBtn setImage:egsIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:egsBtn];
        
        huboBtn = [[UIButton alloc] initWithFrame:CGRectMake(128, 655, 88, 88)];
        [huboBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *huboIcon = [UIImage imageNamed:@"padHuboBtn"];
        [huboBtn setImage:huboIcon forState:UIControlStateNormal];
        UIImage *huboIconPressed = [UIImage imageNamed:@"padHuboBtnPressed"];
        [huboBtn setImage:huboIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:huboBtn];
        
        mrpBtn = [[UIButton alloc] initWithFrame:CGRectMake(198, 850, 88, 88)];
        [mrpBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchDown];
        UIImage *mrpIcon = [UIImage imageNamed:@"padMrpBtn"];
        [mrpBtn setImage:mrpIcon forState:UIControlStateNormal];
        UIImage *mrpIconPressed = [UIImage imageNamed:@"padMrpBtnPressed"];
        [mrpBtn setImage:mrpIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:mrpBtn];
        
        shimaBtn = [[UIButton alloc] initWithFrame:CGRectMake(54, 456, 88, 88)];
        [shimaBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *shimaIcon = [UIImage imageNamed:@"padShimaBtn"];
        [shimaBtn setImage:shimaIcon forState:UIControlStateNormal];
        UIImage *shimaIconPressed = [UIImage imageNamed:@"padShimaBtnPressed"];
        [shimaBtn setImage:shimaIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:shimaBtn];
        
        restroomBtn = [[UIButton alloc] initWithFrame:CGRectMake(26, 704, 88, 88)];
        [restroomBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        restroomIcon = [UIImage imageNamed:@"padRestroomBtn"];
        [restroomBtn setImage:restroomIcon forState:UIControlStateNormal];
        UIImage *restroomIconPressed = [UIImage imageNamed:@"padRestroomBtnPressed"];
        [restroomBtn setImage:restroomIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:restroomBtn];
        
    } else {
        UIImageView *map = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phoneMap"]];
        [self.view addSubview:map];
        
        infoView = [[UIView alloc] initWithFrame:CGRectMake(150, 245, 160, 40)];
        infoView.backgroundColor = [UIColor whiteColor];
        infoView.alpha = 0;
        [self.view addSubview:infoView];
        
        locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 190, 130, 150)];
        locationLabel.numberOfLines = 0;
        locationLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:locationLabel];
        
        infoBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
        infoBtn.frame = CGRectMake(270, 240, 50, 50);
        infoBtn.tintColor = [UIColor whiteColor];
        infoBtn.alpha = 0;
        [self.view addSubview:infoBtn];
        [infoBtn addTarget:self action:@selector(infoBtnPress) forControlEvents:UIControlEventTouchUpInside];
        
        appLabBtn = [[UIButton alloc] initWithFrame:CGRectMake(131, 345, 44, 44)];
        [appLabBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *appLabIcon = [UIImage imageNamed:@"phoneAppLabBtn"];
        [appLabBtn setImage:appLabIcon forState:UIControlStateNormal];
        UIImage *appLabIconPressed = [UIImage imageNamed:@"phoneAppLabBtnPressed"];
        [appLabBtn setImage:appLabIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:appLabBtn];
        
        conferenceBtn = [[UIButton alloc] initWithFrame:CGRectMake(131, 144, 44, 44)];
        [conferenceBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *conferenceIcon = [UIImage imageNamed:@"phoneConferenceBtn"];
        [conferenceBtn setImage:conferenceIcon forState:UIControlStateNormal];
        UIImage *conferenceIconPressed = [UIImage imageNamed:@"phoneConferenceBtnPressed"];
        [conferenceBtn setImage:conferenceIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:conferenceBtn];
        
        egsBtn = [[UIButton alloc] initWithFrame:CGRectMake(146, 76, 44, 44)];
        [egsBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *egsIcon = [UIImage imageNamed:@"phoneEgsBtn"];
        [egsBtn setImage:egsIcon forState:UIControlStateNormal];
        UIImage *egsIconPressed = [UIImage imageNamed:@"phoneEgsBtnPressed"];
        [egsBtn setImage:egsIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:egsBtn];
        
        huboBtn = [[UIButton alloc] initWithFrame:CGRectMake(73, 365, 44, 44)];
        [huboBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *huboIcon = [UIImage imageNamed:@"phoneHuboBtn"];
        [huboBtn setImage:huboIcon forState:UIControlStateNormal];
        UIImage *huboIconPressed = [UIImage imageNamed:@"phoneHuboBtnPressed"];
        [huboBtn setImage:huboIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:huboBtn];
        
        mrpBtn = [[UIButton alloc] initWithFrame:CGRectMake(108, 465, 44, 44)];
        [mrpBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchDown];
        UIImage *mrpIcon = [UIImage imageNamed:@"phoneMrpBtn"];
        [mrpBtn setImage:mrpIcon forState:UIControlStateNormal];
        UIImage *mrpIconPressed = [UIImage imageNamed:@"phoneMrpBtnPressed"];
        [mrpBtn setImage:mrpIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:mrpBtn];
        
        shimaBtn = [[UIButton alloc] initWithFrame:CGRectMake(33, 263, 44, 44)];
        [shimaBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        UIImage *shimaIcon = [UIImage imageNamed:@"phoneShimaBtn"];
        [shimaBtn setImage:shimaIcon forState:UIControlStateNormal];
        UIImage *shimaIconPressed = [UIImage imageNamed:@"phoneShimaBtnPressed"];
        [shimaBtn setImage:shimaIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:shimaBtn];
        
        restroomBtn = [[UIButton alloc] initWithFrame:CGRectMake(19, 391, 44, 44)];
        [restroomBtn addTarget:self action:@selector(mapBtnPress) forControlEvents:UIControlEventTouchUpInside];
        restroomIcon = [UIImage imageNamed:@"phoneRestroomBtn"];
        [restroomBtn setImage:restroomIcon forState:UIControlStateNormal];
        UIImage *restroomIconPressed = [UIImage imageNamed:@"phoneRestroomBtnPressed"];
        [restroomBtn setImage:restroomIconPressed forState:UIControlStateHighlighted];
        [self.view addSubview:restroomBtn];
    }
}

#pragma mark - Button Events

- (void) mapBtnPress {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        infoView.alpha = 0.2;
        
        if (appLabBtn.isHighlighted) {
            locationLabel.text = @"APP Lab";
            _image = [UIImage imageNamed:@"phoneAppLabBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (conferenceBtn.isHighlighted) {
            locationLabel.text = @"Conference Room";
            _image = [UIImage imageNamed:@"phoneConferenceBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (egsBtn.isHighlighted) {
            locationLabel.text = @"Entrepreneurial Game Studio";
            _image = [UIImage imageNamed:@"phoneEgsBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (huboBtn.isHighlighted ) {
            locationLabel.text = @"Hubo";
            _image = [UIImage imageNamed:@"phoneHuboBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (mrpBtn.isHighlighted) {
            locationLabel.text= @"Magnetic Resonator Piano";
            _image = [UIImage imageNamed:@"mrpImage"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (restroomBtn.isHighlighted ) {
            locationLabel.text = @"Restrooms";
            _image = [UIImage imageNamed:@"phoneRestroomBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (shimaBtn.isHighlighted) {
            locationLabel.text = @"Shima Seiki Haute Tech Lab";
            _image = [UIImage imageNamed:@"shimaImage"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        }
        locationText.text = _text;
        imageView.image = _image;
        imageView.backgroundColor = [UIColor orangeColor];
    } else {
        infoBtn.alpha = 1;
        infoView.alpha = 0.2;
        if (appLabBtn.isHighlighted) {
            locationLabel.text = @"APP Lab";
            _detailTitle = @"APP Lab";
            _image = [UIImage imageNamed:@"phoneAppLabBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (conferenceBtn.isHighlighted) {
            locationLabel.text = @"Conference Room";
            _detailTitle = @"Conference Room";
            _image = [UIImage imageNamed:@"phoneConferenceBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (egsBtn.isHighlighted) {
            locationLabel.text = @"Entrepreneurial Game Studio";
            _detailTitle = @"EGS";
            _image = [UIImage imageNamed:@"phoneEgsBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (huboBtn.isHighlighted ) {
            locationLabel.text = @"Hubo";
            _detailTitle = @"Hubo";
            _image = [UIImage imageNamed:@"phoneHuboBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (mrpBtn.isHighlighted) {
            locationLabel.text= @"Magnetic Resonator Piano";
            _detailTitle = @"MRP";
            _image = [UIImage imageNamed:@"mrpImage"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (restroomBtn.isHighlighted ) {
            locationLabel.text = @"Restrooms";
            _detailTitle = @"Restrooms";
            _image = [UIImage imageNamed:@"phoneRestroomBtn"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        } else if (shimaBtn.isHighlighted) {
            locationLabel.text = @"Shima Seiki Haute Tech Lab";
            _detailTitle = @"Shima Lab";
            _image = [UIImage imageNamed:@"shimaImage"];
            _text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        }
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
