//
//  QMultiThreadVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/25/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QMultiThreadVC : UIViewController
{
    int   ticks;
    float completed;
}

@property(nonatomic, retain)NSTimer *localTimer;
@property(nonatomic, retain)IBOutlet UILabel *counter;
@property(nonatomic, retain)IBOutlet UIProgressView *progress;

- (IBAction)onTapNewThread1:(id)sender;
- (IBAction)onTapStartTimer:(id)sender;
- (IBAction)onTapStopTimer:(id)sender;

@end
