//
//  QKVOSampleVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/20/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//  Here we have example how to use KVO and NSNotificationCenter

#import "QKVOSampleVC.h"


#define UPDATE_VIEW         @"UpdateView"

/*********************** Classes to help **************************/

@implementation BankEntity

- (id)init
{
    if (self = [super init]) {
        self.percentage = 0.0;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
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
    // [[NSNotificationCenter defaultCenter] postNotificationName:UPDATE_VIEW object:nil userInfo:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqual:@"percentage"]) {
        NSNumber *number = (NSNumber*)[change objectForKey:@"new"];
        NSString *value  = [number stringValue];
        
        if (value && value.length > 0) {
            dispatch_async(dispatch_get_main_queue(), ^() {
                [[NSNotificationCenter defaultCenter] postNotificationName:UPDATE_VIEW
                                                                    object:self
                                                                  userInfo:[NSDictionary dictionaryWithObjectsAndKeys:value, @"value", nil]];
            });
            
        }
        NSLog(@"Percentaje has been changed.");
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
    self.title = @"KVO Example";
    
    self.bank     = [[BankEntity alloc] init];
    self.customer = [[Customer alloc] init];
    
    // Adding a Customer instance as observer of BankEntity's property.
    [self.bank addObserver:self.customer forKeyPath:@"percentage" options:NSKeyValueObservingOptionNew context:nil];

    [[NSNotificationCenter defaultCenter] addObserverForName:UPDATE_VIEW object:nil queue:nil usingBlock:^(NSNotification *notification) {
        NSLog(@"Notification has been received: %@.", [notification description]);
        if (notification) {
            NSString *value = [notification.userInfo objectForKey:@"value"];
            [self updatePercentage:value];
        }
    }];
}

- (void)dealloc
{
    [self.bank removeObserver:self.customer forKeyPath:@"percentage"];
    [self.customer release];
    [self.bank release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self.bank removeObserver:self.customer forKeyPath:@"percetnage"];
    [self.bank release];
    [self.customer release];
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
    @try {
        self.bank.percentage = [self.input.text floatValue];
    } @catch (NSException *error) {
        NSLog(@"ERROR: %@", [error description]);
        self.bank.percentage = -.1;
    }
}


- (void)updatePercentage:(NSString*)value
{
    self.percentage.text = value;
    [self.percentage setNeedsDisplay];
}

@end
