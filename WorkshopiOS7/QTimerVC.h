//
//  QTimerVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/16/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTimerVC : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *counterDisplay;
@property (nonatomic, retain) IBOutlet NSTimer *timer;

@end
