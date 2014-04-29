//
//  QMemoryManagementVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 2/7/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

// Class for
@interface QEntity : NSObject <NSCopying>
{
    QEntity *right;
}

@property(nonatomic, assign)int code;
@property(nonatomic, retain)NSString *fullname;
@property(nonatomic, retain)NSString *city;
@property(nonatomic, retain)QEntity *left;

- (void)printValues;

@end


@interface QMemoryManagementVC : UIViewController
{
    QEntity *_objectA;
    QEntity *_objectB;
    QEntity *_objectC;
    QEntity *_objectD;
}

- (IBAction)onTouchStart:(id)sender;
- (IBAction)onTouchCheck:(id)sender;
- (IBAction)onTouchTest3:(id)sender;
- (IBAction)onTouchTest4:(id)sender;
- (IBAction)onTouchTest5:(id)sender;
- (IBAction)onTouchTest6:(id)sender;
- (IBAction)onTouchTest7:(id)sender;

@end
