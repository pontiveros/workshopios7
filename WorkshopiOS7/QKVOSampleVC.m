//
//  QKVOSampleVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/20/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QKVOSampleVC.h"


#define UPDATE_PERCENTAJE @"UpdatePercentaje"

/*********************** Classes to help **************************/

@implementation BankEntity

- (id)init
{
    if (self = [super init]) {
        self.items      = [[NSMutableArray alloc] init];
        self.percentaje = 0.0;
    }
    return self;
}


- (void)dealloc
{
    [self.items release];
    [super dealloc];
}

- (void)updateCustomers
{
    for (Customer *item in self.items) {
        [item updateAccount:@""];
    }
}

- (void)updatePercentaje:(double)value
{
    
}

@end

////////////////////////////////////////////////////////////////////
@implementation Customer

- (id)init
{
    if (self = [super init]) {
        self.name   = @"";
        self.amount = 0.0;
    }
    
    return self;
}

- (void)updateAccount:(NSString*)param
{
    NSLog(@"Customer was recently update");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqual:@""]) {
        NSLog(@"");
    }
}
@end
/******************************************************************/

@interface QKVOSampleVC ()

@end

@implementation QKVOSampleVC

@synthesize bank;
@synthesize customer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.bank     = [[BankEntity alloc] init];
    self.customer = [[Customer alloc] init];
    
    // Adding a customer instance as observer...
    [self.bank addObserver:self.customer forKeyPath:UPDATE_PERCENTAJE options:NSKeyValueObservingOptionNew context:nil];

}

- (void)dealloc
{
    [self.customer release];
    [self.bank release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTouchApply:(id)sender
{
    
}

@end
