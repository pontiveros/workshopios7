//
//  QWebViewVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/25/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWebViewVC : UIViewController<UIWebViewDelegate>
{
    UIView *splashscreen;
}

@property (nonatomic, retain)IBOutlet UIWebView *webView;

@end
