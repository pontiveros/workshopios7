//
//  QNSOperationVCViewController.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/18/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QNSOperationVC.h"
#import "QDownloadOperation.h"


@interface QNSOperationVC ()

@end

@implementation QNSOperationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"NSOperation Sample";
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

- (IBAction)onTouchDownloadOperation:(id)sender
{
    BOOL sync = YES;
    if (sync) {
        QDownloadOperation *operation = [[QDownloadOperation alloc] init];
        [operation start];
        [operation release];
    } else {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:[[QDownloadOperation alloc] init]];
        [queue release];
    }
}


- (IBAction)onTouchStartThread1:(id)sender
{
    // The simple way to create a thread and leave alone, without sync.
    // This will create as many threads as the user touch on the button.
    [NSThread detachNewThreadSelector:@selector(workerThread1) toTarget:self withObject:nil];
}

- (void)workerThread1
{
    for (int i = 0; i < 10; i++) {
        NSLog(@"workerThread1 ... is working - step %d. - Thread: %@.\n", (i + 1), [NSThread currentThread]);
        sleep(1);
    }
}
@end
