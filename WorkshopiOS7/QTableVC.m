//
//  QTableVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/26/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QTableVC.h"

@interface QTableVC ()

@end

@implementation QTableVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"TableView";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
