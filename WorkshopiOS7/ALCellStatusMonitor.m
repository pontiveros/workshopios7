//
//  ALCellStatusMonitor.m
//  AssureLink
//
//  Created by Pedro Ontiveros on 6/18/14.
//  Copyright (c) 2014 Sears Holdings Corporation. All rights reserved.
//

#import "ALCellStatusMonitor.h"
#import "ALViewStatusMonitor.h"


@implementation ALCellStatusMonitor


- (id)init
{
    self = [self initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        _items = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
}

- (CGFloat)cellHeight
{
    return self.frame.size.height + ([self rows] * 2);
}

- (int)rows
{
    int  rows = 0;
    BOOL completeRow = NO;
    
    for (ALViewStatusMonitor *item in self.subviews) {
        if (item.isFullWidht) {
            rows++;
        } else {
            if (completeRow) {
                completeRow = NO;
                
            } else {
                completeRow = YES;
                rows++;
            }
        }
    }
    return rows;
}

- (void)addItemWithIdentifier:(NSString *)identifier fullWidth:(BOOL)flag
{
    CGRect viewRect = self.frame;
    ALViewStatusMonitor *monitor = nil;
    
    int    index = 0;
    float offSet = 0.0;
    // BOOL rowComplete = NO;
    
    CGPoint location = CGPointMake(0.0, 0.0);
    
    for (ALViewStatusMonitor *item in self.subviews) {
        if (item.isFullWidht) {
            location.x = 0.0;
            location.y = location.y + 1.0;
            // rowComplete = YES;
        } else {
            if (location.x == 0.0) {
                location.x = 1.0;
            } else {
                break;
            }
        }
    }
    
    if (flag)
        location.y = location.y + 1.0;
    
    if (flag) {
        monitor = [[ALViewStatusMonitor alloc] initFullWidth];
        
    } else {
        monitor = [[ALViewStatusMonitor alloc] initHalfWidth];
    }
    
    CGRect rcItem = monitor.frame;
    
    viewRect.size.height = monitor.bounds.size.height * (index + 1);
    rcItem.origin.y = (monitor.bounds.size.height + 2) * index;
    rcItem.origin.x = offSet;
    [monitor setFrame:rcItem];
    
    [_items setObject:monitor forKey:identifier];
    [self setFrame:viewRect];
    [self addSubview:monitor];
}

- (void)removeItemWithIdentifier:(NSString *)identifier
{
    
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
