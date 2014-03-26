//
//  DetailViewController.h
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/20/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;


- (id) initWithTitle:(NSString *)title andImage:(UIImage *)image andText:(NSString *)text;

@end
