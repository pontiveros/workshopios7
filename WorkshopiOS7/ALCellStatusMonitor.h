//
//  ALCellStatusMonitor.h
//  AssureLink
//
//  Created by Pedro Ontiveros on 6/18/14.
//  Copyright (c) 2014 Sears Holdings Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALCellStatusMonitor : UIView
{
    NSMutableDictionary *_items;
    
}

- (id)init;
- (CGFloat)cellHeight;
- (void)addItemWithIdentifier:(NSString*)identifier fullWidth:(BOOL)flag;
- (void)removeItemWithIdentifier:(NSString*)identifier;

@end
