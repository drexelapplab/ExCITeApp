//
//  MapViewController.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/7/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DetailViewController.h"

@interface MapViewController : UIViewController <UIGestureRecognizerDelegate> {
    UIView *infoView;
    UILabel *locationLabel;
    
    UIButton *infoBtn;
    
    UIImage *restroomIcon;
    
    UIButton *appLabBtn;
    UIButton *conferenceBtn;
    UIButton *egsBtn;
    UIButton *huboBtn;
    UIButton *mrpBtn;
    UIButton *restroomBtn;
    UIButton *shimaBtn;
    
    UITextView *locationText;
    UIImageView *imageView;
    
    DetailViewController *detailVC;
}

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *detailTitle;

@end
