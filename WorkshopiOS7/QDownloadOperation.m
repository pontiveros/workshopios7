//
//  QDownloadOperation.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/24/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QDownloadOperation.h"

@implementation QDownloadOperation

- (void)main
{
    for (int i = 0; i < 10; i++) {
        sleep(1);
        NSLog(@"QDownloadOperation run main method.");
    }
    NSLog(@"End of task.");
}
@end
