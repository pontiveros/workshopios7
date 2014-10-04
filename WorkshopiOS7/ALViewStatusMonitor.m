//
//  ALViewStatusMonitor.m
//  AssureLink
//
//  Created by Pedro Ontiveros on 6/17/14.
//  Copyright (c) 2014 Sears Holdings Corporation. All rights reserved.
//

#import "ALViewStatusMonitor.h"

@implementation ALViewStatusMonitor


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor darkGrayColor]];
    }
    return self;
}

- (id)initHalfWidth
{
    CGRect rect = CGRectMake(0, 0, 158, 58);
    self = [self initWithFrame:rect];
    
    if (self) {
        [self createTitle];
        [self createStatus];
        _isFullWidht = NO;
    }
    
    return self;
}

- (id)initFullWidth
{
    CGRect rect = CGRectMake(0, 0, 320, 58);
    self = [self initWithFrame:rect];
    
    if (self) {
        [self createTitle];
        [self createStatus];
        _isFullWidht = YES;
    }
    
    return self;
}

- (void)createTitle
{
    CGRect rcView = self.bounds;
    CGRect rect1  = CGRectMake(10, 5, (rcView.size.width - 10), 20);
    self.title    = [[UILabel alloc] initWithFrame:rect1];
    [self.title setTextColor:[UIColor whiteColor]];

    [self.title setFont:[UIFont boldSystemFontOfSize:17.0]];
    [self addSubview:self.title];
}

- (void)createStatus
{
    CGRect rcView = self.bounds;
    CGRect rect1  = CGRectMake(10, 30, (rcView.size.width - 10), 20);
    self.status   = [[UILabel alloc] initWithFrame:rect1];
    [self.status setTextColor:[UIColor whiteColor]];
    [self addSubview:self.status];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
