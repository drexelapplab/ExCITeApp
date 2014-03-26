//
//  DetailViewController.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/20/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id) initWithTitle:(NSString*)title andImage:(UIImage *)image andText:(NSString *)text {
    if (self = [super init]) {
        self.navigationItem.title = title;
        self.image = image;
        self.text = text;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationController.navigationBar.topItem.title = @"Back";
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:_image];
    imageView.frame = CGRectMake(15, 80, 290, 170);
    imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imageView];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(10, 255, 300, 250);
    textView.backgroundColor = [UIColor clearColor];
    textView.text = _text;
    textView.textColor = [UIColor whiteColor];
    textView.editable = NO;
    [self.view addSubview:textView];
        
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
