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
        //self.tabBarItem.image = [UIImage imageNamed:@""];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        
    } else {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
