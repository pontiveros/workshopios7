//
//  QGCDThreadingVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/16/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QGCDThreadingVC.h"

static int a = 0;
@interface QGCDThreadingVC ()

@end

@implementation QGCDThreadingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"GCD Threading";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTouchStartTest1:(id)sender
{
    [self quizz1];
}

- (IBAction)onTouchStopTest1:(id)sender
{
    
}

- (void)quizz1
{
    // Typpical way to use GCD queue and multithreading without sync.
    a = 0;
    NSLog(@"Begin quizz1");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^ {
        a = 1;
        NSLog(@"%d", a);
    });
    
    dispatch_async(queue, ^ {
        a = 2;
        NSLog(@"%d", a);
    });
    
    NSLog(@"%d", a); // See how looks the console regarding to the values of a(variable) and the order.
    NSLog(@"Begin quizz1");
    
    dispatch_release(queue);
}

- (void)quizz2
{
    a = 0;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^ {
        sleep(1); // wait for a second... see what happen in the next loop.
        a = 1;
    });
    
    int i = 0;
    while (a == 0) {
        NSLog(@"Step: %d", (i++));
    }
    
    NSLog(@"%d", a);
}

@end
