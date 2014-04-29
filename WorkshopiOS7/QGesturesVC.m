//
//  QGesturesVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/25/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QGesturesVC.h"

@interface QGesturesVC ()

@end

@implementation QGesturesVC

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
    self.title = @"Gestures";
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGestures:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGestures:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGestures:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGestures:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMessage:(NSString*)message withTitle:(NSString*)title
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:title];
    [alert setMessage:message];
    [alert addButtonWithTitle:@"Accept"];
    [alert show];
    [alert release];
}

#pragma mark - Gestures

- (void)handleSwipeGestures:(UIGestureRecognizer*)recognizer
{
    UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer*)recognizer;
    NSString *message = @"";
    
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionDown:  message = @"Swipe gesture down";  break;
        case UISwipeGestureRecognizerDirectionUp:    message = @"Swipe gesture up";    break;
        case UISwipeGestureRecognizerDirectionLeft:  message = @"Swipe gesture left";  break;
        case UISwipeGestureRecognizerDirectionRight: message = @"Swipe gesture right"; break;
    }
    
    [self showMessage:message withTitle:@"Gesture"];
}

@end
