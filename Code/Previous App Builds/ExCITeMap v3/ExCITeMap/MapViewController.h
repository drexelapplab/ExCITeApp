//
//  MapViewController.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/7/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DetailViewController.h"
#import "DynamicMapView.h"
#import "FadeButton.h"

@interface MapViewController : UIViewController <UIGestureRecognizerDelegate, DynamicMapViewDelegate> {

    UITextView *locationText;
    UIImageView *imageView;
    UIView *infoView;
    UILabel *locationLabel;
    UIButton *infoBtn;
    
    DetailViewController *detailVC;
    DynamicMapView *mapView;
}

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *detailTitle;

@end