//
//  ALViewStatusMonitor.h
//  AssureLink
//
//  Created by Pedro Ontiveros on 6/17/14.
//  Copyright (c) 2014 Sears Holdings Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALViewStatusMonitor : UIView

@property (strong, nonatomic)UILabel *title;
@property (strong, nonatomic)UILabel *status;
@property (readonly)BOOL isFullWidht;

- (id)initHalfWidth;
- (id)initFullWidth;

@end
