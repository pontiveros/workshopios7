//
//  QGravityViewController.h
//  AppSevenFeatures1
//
//  Created by Pedro Ontiveros on 10/31/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QGravityCollisionVC : UIViewController<UICollisionBehaviorDelegate>

@property (nonatomic, retain)IBOutlet UIView *box1;
@property (nonatomic, retain)IBOutlet UIView *box2;
@property (nonatomic, retain)IBOutlet UIView *box3;
@property (nonatomic, retain)IBOutlet UIView *box4;
@property (nonatomic, retain)IBOutlet UILabel *label1;
@property (nonatomic, assign) UIDynamicAnimator *animator;

@end
