//
//  QLocationVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/30/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QLocationVC.h"

@interface QLocationVC ()

@end

@implementation QLocationVC

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
    self.title = @"Location";
    
    // NSDictionary *dict = NSDictionaryOfVariableBindings(self.canvas, self.box1, self.box2);
    // NSArray *contraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[box1]- 21 -[box2]" options:0 metrics:nil views:dict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.box1 setBackgroundColor:[UIColor redColor]];
    [self.box2 setBackgroundColor:[UIColor grayColor]];
}

- (IBAction)onTouchTapMe:(id)sender
{
    exit(0);
}

@end
