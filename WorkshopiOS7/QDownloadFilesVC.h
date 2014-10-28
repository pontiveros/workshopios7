//
//  QDownloadFilesVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/27/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDownloadFilesVC : UIViewController
{
    UIView *semitransparentView;
    UIActivityIndicatorView *indicator;
}

@property (nonatomic, retain) IBOutlet UITextField *urlString;

@end
