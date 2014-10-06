//
//  QGravityViewController.m
//  AppSevenFeatures1
//
//  Created by Pedro Ontiveros on 10/31/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QGravityCollisionVC.h"

@interface QGravityCollisionVC ()

@end

@implementation QGravityCollisionVC

@synthesize box1;
@synthesize box2;
@synthesize box3;
@synthesize box4;
@synthesize label1;
@synthesize animator;


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
    self.box2.tag   = 2;
    self.box3.tag   = 3;
    self.box4.tag   = 4;
    self.label1.tag = 5;
    
    self.title    = @"Gravity and collision effects";
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view]; // Create an object UIDynamicAnimator
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.box1, self.box2]];
    gravity.magnitude = 0.5;
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[ self.box2, self.box3, self.box4, self.label1]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.box2, self.box3, self.box4, self.label1]];
    itemBehavior.elasticity = 0.7;
    
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:itemBehavior];
    [self.animator addBehavior:collision];
    collision.collisionDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchMessage:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:Nil cancelButtonTitle:@"Accept" otherButtonTitles:@"Cancel", nil];
    [alert show];
    [alert release];
}

#pragma mark - UICollisionBehaviorDelegate
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    int tag = ((UIView*)item).tag;
    
    switch (tag) {
        case 2:  [(UIView*)item setBackgroundColor:[UIColor blueColor]];  break;
        case 3:  [(UIView*)item setBackgroundColor:[UIColor redColor]];   break;
        default: [(UIView*)item setBackgroundColor:[UIColor blackColor]]; break;
    }
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    [(UIView*)item setBackgroundColor:[UIColor grayColor]];
}


@end
