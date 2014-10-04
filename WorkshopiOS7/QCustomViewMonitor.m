//
//  QCustomViewMonitor.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 6/18/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QCustomViewMonitor.h"

@implementation QCustomViewMonitor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    CGRect rect = CGRectMake(0, 0, 158, 58);
    self = [self initWithFrame:rect];
    
    if (self) {
        CGRect rect1 = CGRectMake(10, 5, 140, 20);
        self.title = [[UILabel alloc] initWithFrame:rect1];
        rect1.origin.y = 35;
        self.status = [[UILabel alloc] initWithFrame:rect1];
        [self setBackgroundColor:[UIColor darkGrayColor]];
        
        [self.title setFont:[UIFont systemFontOfSize:17.0]];
        [self.title setTextColor:[UIColor whiteColor]];
        [self addSubview:self.title];
        
        [self.status setFont:[UIFont systemFontOfSize:12.0]];
        [self.status setTextColor:[UIColor yellowColor]];
        [self addSubview:self.status];
    }
    
    return self;
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
