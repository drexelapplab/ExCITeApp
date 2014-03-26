//
//  AboutViewController.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/18/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AboutViewController : UIViewController

@property (strong, nonatomic) NSURL *movieURL;
@property (strong, nonatomic) MPMoviePlayerController *movieController;

@end
