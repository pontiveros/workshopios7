//
//  QPanelViewController.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 3/24/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QPanelViewController : UIViewController
{
    UIView  *_child1;
    UIView  *_child2;
    UILabel *_child1Title;
    
    BOOL _isChild1FullScreen;
    BOOL _isNormalColor;
}
@end
