//
//  AboutViewController.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/18/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id) init
{
    if (self = [super init])
    {
        self.title = @"ExCITe";
        self.tabBarItem.image = [UIImage imageNamed:@"aboutIcon"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _movieController = [[MPMoviePlayerController alloc] init];
    _movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"exciteClip" ofType:@"mp4"]];
    [_movieController setContentURL:_movieURL];
    _movieController.shouldAutoplay = NO;
    [_movieController prepareToPlay];
    [_movieController.view setFrame:CGRectMake(10, 75, 748, 421)];
    [self.view addSubview:_movieController.view];
	
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(10, 496, 750, 500);
    textView.backgroundColor = [UIColor clearColor];
    textView.text = @"Drexel's Expressive and Creative Interaction Technologies (ExCITe) Center is a University-wide strategic initiative bringing together faculty, students, and entrepreneurs from engineering, fashion design, digital media, performing arts, computer and information science, product design, and many other fields to pursue highly multi-disciplinary collaborative projects.\n\nThe research and education activities of the ExCITe Center emphasize the arts-integrated approach of STEAM* [vs. traditional STEM]. Additionally, ExCITe serves to connect knowledge and resources across Philadelphia through civic, arts and culture, and industry partnerships with other institutions and organizations in the region.\n\nThe ExCITe Center is a street-level, highly visible space at the corner of Market and 34th Streets in University City. The location includes unique facilities, including the Shima Seiki Haute Technology Lab, but much of the 10,000 square-foot space is dedicated to project collaboration, presentation, and co-working.\n\n*STEAM: Science, Technology, Engineering, Arts & Design, and Mathematics";
    textView.textColor = [UIColor whiteColor];
    [textView setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    textView.editable = NO;
    [self.view addSubview:textView];
}

@end
