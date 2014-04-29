//
//  QPanelViewController.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 3/24/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QPanelViewController.h"


static CGRect  littleView;
static CGRect  bigView;
static CGPoint centerView;

@interface QPanelViewController ()

@end

@implementation QPanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isChild1FullScreen = NO;
        littleView = CGRectMake(0, 0, 150.0, 150.0);
        bigView    = [[UIScreen mainScreen] bounds];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Drawing some views on the current view of this UIViewController.
    centerView = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
    
    UIView *v2 = [[[UIView alloc] initWithFrame:CGRectMake(15, 70, 40, 70)] autorelease];
    [v2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:v2];
    
    UIView *v1 = [[[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)] autorelease];
    [v1 setBackgroundColor:[UIColor colorWithRed:23/255.0 green:24/255.0 blue:26/255.0 alpha:0.2]];
    [self.view addSubview:v1];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapChild1View:)];
    // [tapGesture setNumberOfTouchesRequired:2];
    [v1 addGestureRecognizer:tapGesture];
    
    _child1 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)] autorelease];
    [_child1 setBackgroundColor:[UIColor purpleColor]];
    [_child1 setCenter:centerView];

    _child1Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _child1Title.text = @"Valentina";
    [_child1Title setBackgroundColor:[UIColor grayColor]];
    _child1Title.textAlignment = NSTextAlignmentCenter;
    [_child1Title setCenter:CGPointMake(_child1.bounds.size.width / 2.0, _child1.bounds.size.height / 2.0)];
    [_child1 addSubview:_child1Title];
    [self.view addSubview:_child1];
    
    
    _child2 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)] autorelease];
    [_child2 setBackgroundColor:[UIColor colorWithRed:230/255.0 green:120/255.0 blue:23/255.0 alpha:1]];
    [_child2 setCenter:CGPointMake(250, 450)];
    [self.view addSubview:_child2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTapChild1View:(UITapGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"You are here ... QPanelViewControlller line 81.");
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(_child1.frame, point)) {
        _isChild1FullScreen = !_isChild1FullScreen;
    } else if (CGRectContainsPoint(_child2.frame, point)) {
        _isNormalColor = !_isNormalColor;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
#ifdef VIEW_ANIMATION_SLOWRESIZE
    if (_isChild1FullScreen) {
        [UIView animateWithDuration:.5 animations:^(void) {
            [_child1 setFrame:bigView];
            
        }];
    
    } else {
        [UIView animateWithDuration:.5 animations:^ {
            [_child1 setFrame:littleView];
            
        }];
        [_child1 setCenter:centerView];
    }
#else
    if (_isChild1FullScreen) {
        [UIView animateWithDuration:1
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^ {
                             _child1.transform = CGAffineTransformMakeScale(-1, 1);
                             [_child1 setFrame:bigView];
                             [_child1Title setCenter:CGPointMake(_child1.bounds.size.width / 2.0, _child1.bounds.size.height / 2.0)];
                         }
                         completion:^(BOOL flag) {
                             [UIView animateWithDuration:1.0
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations: ^ {
                                                  _child1Title.transform = CGAffineTransformMakeScale(-1, 1);
                                              }
                                              completion:nil];
                         }];
    } else {
        [UIView animateWithDuration:1
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^ {
                             _child1.transform = CGAffineTransformMakeScale(1, 1);
                             [_child1 setFrame:littleView];
                             [_child1Title setCenter:CGPointMake(_child1.bounds.size.width / 2.0, _child1.bounds.size.height / 2.0)];
                         }
                         completion:^(BOOL flag) {
                             [UIView animateWithDuration:1.0
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations: ^ {
                                                  _child1Title.transform = CGAffineTransformMakeScale(1, 1);
                                              }
                                              completion:nil];
                             
                         }];
        [_child1 setCenter:centerView];
    }
#endif
    
    [self animationChild2];
}

- (void)animationChild2
{
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionTransitionNone
                     animations:^(void) {
                            if (_isNormalColor) {
                                [_child2 setBackgroundColor:[UIColor blueColor]];
                            } else {
                                [_child2 setBackgroundColor:[UIColor redColor]];
                            }
                        }
                     completion:nil];
}

@end