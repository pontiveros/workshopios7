//
//  QMultiThreadVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/25/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QMultiThreadVC.h"



int a = 0;

@interface QMultiThreadVC ()

@end

@implementation QMultiThreadVC

@synthesize localTimer;
@synthesize counter;
@synthesize progress;

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
    self.title = @"Multithreading";
    completed  = 0.0f;
    ticks      = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMessage:(NSString*)message withTitle:(NSString*)title
{
    UIAlertView * alert = [[UIAlertView alloc] init];
    [alert setTitle:title];
    [alert setMessage:message];
    [alert addButtonWithTitle:@"Accept"];
    [alert show];
    [alert release];
}

- (IBAction)onTapNewThread1:(id)sender
{
    // How to create a NSThread detached.
    [NSThread detachNewThreadSelector:@selector(worker1:) toTarget:self withObject:@"This message came from main thread."];
}

- (void)worker1:(id)param
{
    NSString *message = (NSString*)param;
    
    typeof(self) weakSelf = self;
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"%@ tick number %d",message, (i + 1));
        completed = ((i + 1) / 10.0);
        dispatch_async(dispatch_get_main_queue(), ^() {
            [weakSelf.progress setProgress:completed];
            [weakSelf.progress setNeedsDisplay];
        });
        sleep(2);
    }
    
    [self showMessage:message withTitle:@"Thread"];
}

- (IBAction)onTask2:(id)sender
{
    [self quizz1];
    [self quizz2];
}

- (void)quizz1
{
    a = 0;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^ {
        a = 1;
    });
    
    dispatch_async(queue, ^ {
        a = 2;
    });
    
    NSLog(@"%d", a);
}

- (void)quizz2
{
    a = 0;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^ {
        a = 1;
    });
    
    while (a == 0) {
        NSLog(@"infinit loop ?");
    }
    
    NSLog(@"%d", a);
}

- (IBAction)onTapStartTimer:(id)sender
{
    // How to create a timer.
    self.localTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runLocalTimer) userInfo:nil repeats:YES];
}

- (IBAction)onTapStopTimer:(id)sender
{
    [self.localTimer invalidate];
    self.localTimer = nil;
    ticks = 0;
}

- (void)runLocalTimer
{
#ifdef DEBUG
    NSLog(@"Timer is working in background!!!");
#endif
    
    ticks++;
    NSString * updateString = [NSString stringWithFormat:@"Counter: %d ticks!", ticks];
    [self.counter setText:updateString];
}

@end
