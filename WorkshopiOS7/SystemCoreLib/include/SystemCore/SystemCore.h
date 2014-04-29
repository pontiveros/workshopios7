//
//  SystemCore.h
//  SystemCore
//
//  Created by Pedro Ontiveros on 4/6/14.
//  Copyright (c) 2014 qbxsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemCore : NSObject

- (BOOL)isSystemCoreEnable;
- (NSString*)replaceString:(NSString*)source with:(NSString*)replace;

@end
