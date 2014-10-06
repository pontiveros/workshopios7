//
//  QLocationVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/30/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLocationVC : UIViewController

@property (nonatomic, retain) IBOutlet UIView *canvas;
@property (nonatomic, retain) IBOutlet UIView *box1;
@property (nonatomic, retain) IBOutlet UIView *box2;

- (IBAction)onTouchStartMonitor:(id)sender;

@end
