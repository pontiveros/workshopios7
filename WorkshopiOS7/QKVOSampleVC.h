//
//  QKVOSampleVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/20/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

/*********************** Classes to help **************************/
@interface BankEntity : NSObject

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) double percentaje;

- (void)updateCustomers;
- (void)updatePercentaje:(double)value;

@end

////////////////////////////////////////////////////////////////////
@interface Customer : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) double amount;


- (void)updateAccount:(NSString*)param;

@end

/******************************************************************/

@interface QKVOSampleVC : UIViewController

@property (nonatomic, assign) BankEntity *bank;
@property (nonatomic, assign) Customer   *customer;
@end
