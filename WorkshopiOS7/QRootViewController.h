//
//  QRootViewController.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/24/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QRootViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableDictionary *items;
}

@end
