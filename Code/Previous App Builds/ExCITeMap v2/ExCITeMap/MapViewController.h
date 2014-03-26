//
//  MapViewController.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/7/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DetailViewController.h"
#import "FadeButton.h"

@interface MapViewController : UIViewController <UIGestureRecognizerDelegate> {
    FadeButton *applabBtn;
    UIImage *applabBtnImg;
    UIButton *applabBtnTouch;
    
    FadeButton *confBtn;
    UIImage *confBtnImg;
    UIButton *confBtnTouch;
    
    FadeButton *egsBtn;
    UIImage *egsBtnImg;
    UIButton *egsBtnTouch;
    
    FadeButton *huboBtn;
    UIImage *huboBtnImg;
    UIButton *huboBtnTouch;
    
    FadeButton *mrpBtn;
    UIImage *mrpBtnImg;
    UIButton *mrpBtnTouch;
    
    FadeButton *restroomsBtn;
    UIImage *restroomsBtnImg;
    UIButton *restroomsBtnTouch;
    
    FadeButton *shimaBtn;
    UIImage *shimaBtnImg;
    UIButton *shimaBtnTouch;

    UITextView *locationText;
    UIImageView *imageView;
    UIView *infoView;
    UILabel *locationLabel;
    UIButton *infoBtn;
    
    DetailViewController *detailVC;
}

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *detailTitle;

@end
