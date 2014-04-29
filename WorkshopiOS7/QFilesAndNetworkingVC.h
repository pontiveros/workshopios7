//
//  QFilesAndNetworkVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 2/11/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFilesAndNetworkingVC : UIViewController


- (IBAction)onTouchWriteFile:(id)sender;
- (IBAction)onTouchReadFile:(id)sender;
- (IBAction)onTouchCreateDirectory:(id)sender;
- (IBAction)onTouchRemoveDirectory:(id)sender;
- (IBAction)onTouchSavePropertyList:(id)sender;
- (IBAction)onTouchGetAppPath:(id)sender;
- (IBAction)onTouchOpenGoogle:(id)sender;

@end
