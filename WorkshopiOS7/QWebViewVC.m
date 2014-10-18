//
//  QWebViewVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/25/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QWebViewVC.h"

@interface QWebViewVC ()

@end

@implementation QWebViewVC

@synthesize webView;

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
    self.title = @"WebView";
    
    float x = [UIScreen mainScreen].bounds.size.width;
    float y = [UIScreen mainScreen].bounds.size.height;
    splashscreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
    [splashscreen setBackgroundColor:[UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:1.0]];
    [self.view addSubview:splashscreen];
    
    UIActivityIndicatorView *spinner = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
    [spinner setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [spinner setUserInteractionEnabled:NO];
    [spinner startAnimating];
    [splashscreen addSubview:spinner];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.intel.com"]]];
}

- (void)dealloc
{
    [self.webView stopLoading];
    [splashscreen release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finish load!!!");
    [UIView transitionWithView:self.view
                      duration:3.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^ {
                        [splashscreen removeFromSuperview];
                    }
                    completion:^(BOOL flag) {
                        NSLog(@"Spinner has been removed!");
                    }];
}

@end
