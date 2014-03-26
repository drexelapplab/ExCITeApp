//
//  MapViewController.h
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import <UIKit/UIView.h>

#import "MapView.h"
#import "MapButton.h"

@interface MapViewController : UIViewController <UIGestureRecognizerDelegate, MapViewDelegate>
{
    UIView *locationLabelView;
    UILabel *locationLabel;
    UIView *locationView;
    UITextView *locationInfo;
    
    MapView *mapView;
}

@end
