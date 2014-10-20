//
//  QGCDThreadingVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/16/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QGCDThreadingVC.h"

#define MAX_LOOP 120.0

// Variables
static int a = 0;
static int counter = 0 ;


@interface QGCDThreadingVC ()

@end

@implementation QGCDThreadingVC

@synthesize timeLapse;
@synthesize progressView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"GCD Threading";
    [self.progressView setProgress:0.0];
}

- (void)didReceiveMemoryWarning
{
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
    [self.progressView setProgress:0];
    
    float max_loop = [self.timeLapse.text floatValue];

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(queue, ^() {
        for (counter = 0; counter < max_loop; counter++) {
            sleep(1);
            dispatch_async(dispatch_get_main_queue(), ^() {
                // Always update UI in main thread.
                [self.progressView setProgress:(counter / max_loop)];
                [self.progressView setNeedsDisplay];
                NSLog(@"step: %d", counter);
            });
        }
        NSLog(@"End of task: Test1.");
    });
    // Analize: what happen if I go to previous view and back to here.
}

- (IBAction)onTouchRunQuiz:(id)sender
{
    [self quizMethod1];
    // [self quizMethod2];
}

static double results[10];

- (IBAction)onTouchMultipleCalls:(id)sender
{
    int size  = 10;
    
    dispatch_apply(size, dispatch_get_global_queue(0, 0), ^(size_t i) {
        results[i] = [self calculeA:rand() * 109.2 plusB:rand() * 1.2];
        // NSLog(@"Cal index: %d : result : %f", (int)i, results[i]);
    });
    
    double average = 0.0;
    for (int i = 0; i < size; i++) {
        average += results[i];
    }
    
    average = average / size;
    
    UIAlertController *alert = [[UIAlertController alloc] init];
    alert.title = @"Result";
    alert.message = [NSString stringWithFormat:@"Average: %f", average];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Accept"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction *action){
                                                NSLog(@"Alert has been closed.");
                                            }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)quizMethod1
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
    NSLog(@"End quizz1");
    
    dispatch_release(queue);
}

- (void)quizMethod2
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

- (double)calculeA:(double)a plusB:(double)b
{
    return a + b;
}

@end
