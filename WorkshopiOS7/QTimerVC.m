//
//  QTimerVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/16/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QTimerVC.h"

static int counter = 0;

@interface QTimerVC ()

@end

@implementation QTimerVC


- (id)init
{
    if (self = [super init]) {
        counter = 0;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Timer";
    counter = 0;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self killTimer];
    [super viewDidDisappear:animated];
}

- (void)dealloc
{
    [self killTimer];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self killTimer];
}

- (void)killTimer
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (IBAction)onTouchStart:(id)sender
{
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimerProc) userInfo:nil repeats:YES];
    }
}

- (IBAction)onTouchStop:(id)sender
{
    [self killTimer];
}

- (void)onTimerProc
{
    counter++;
    
    if (counter > 99)
        counter = 0;
    
    [self.counterDisplay setText:[NSString stringWithFormat:@"%d", counter]];
    [self.counterDisplay setNeedsDisplay]; // Refresh in the view.
    // The code above works and the following too.

//    dispatch_async(dispatch_get_main_queue(), ^ {
//        [self.counterDisplay setText:[NSString stringWithFormat:@"%d", counter]];
//        [self.counterDisplay setNeedsDisplay]; // Refresh in the view.
//    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
