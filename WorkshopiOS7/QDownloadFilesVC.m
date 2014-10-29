//
//  QDownloadFilesVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/27/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QDownloadFilesVC.h"


@interface QDownloadFilesVC ()

@end

@implementation QDownloadFilesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Download files";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^() {
        [self.urlString becomeFirstResponder];
    });
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

- (IBAction)onTouchDownlad:(id)sender
{
    if (self.urlString.text.length > 0) {
        QDownloadFilesVC *pSelf = self;
        [self showSpinner];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:self.urlString.text]];
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:queue
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                   dispatch_async(dispatch_get_main_queue(), ^() {
                                       [pSelf hideSpinner];
                                   });
                                   
                                   if (connectionError) {
                                       NSLog(@"ERROR: %@", [connectionError description]);
                                   } else {
                                       if (data) {
                                           @try {
                                               UIImage *image = [UIImage imageWithData:data];
                                               UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
                                               NSLog(@"Save ok!");
                                               
                                           } @catch (NSException *err) {
                                               NSLog(@"ERROR: %@", [err description]);
                                           }
                                       }
                                   }
                               }];
    } else {
        UIAlertController *alert = [[[UIAlertController alloc] init] autorelease];
        alert.title   = @"ERROR";
        alert.message = @"Please set the url";
        [alert addAction:[UIAlertAction actionWithTitle:@"Accept" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)showSpinner
{
    if (semitransparentView == nil) {
        semitransparentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [semitransparentView setBackgroundColor:[UIColor blackColor]];
        [semitransparentView setAlpha:0.2];
        [self.view addSubview:semitransparentView];
        [self.view setNeedsDisplay];
    }
    
    if (indicator == nil) {
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicator setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)];
        [indicator startAnimating];
        [semitransparentView addSubview:indicator];
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)hideSpinner
{
    if (indicator) {
        [indicator removeFromSuperview];
        [indicator release];
        indicator = nil;
    }
    
    if (semitransparentView) {
        [semitransparentView removeFromSuperview];
        [semitransparentView release];
        semitransparentView = nil;
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
