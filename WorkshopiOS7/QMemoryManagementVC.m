//
//  QMemoryManagementVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 2/7/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QMemoryManagementVC.h"


@interface UIViewControllerExtended : UIViewController;
- (id)init;
- (IBAction)onClose:(id)sender;
@end
@implementation UIViewControllerExtended
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"View Controller Extended";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btnClose = [[UIButton alloc] initWithFrame:CGRectMake(20, 70, 200, 50)];
    [btnClose setBackgroundColor:[UIColor blueColor]];
    [btnClose setTitle:@"CLOSE" forState:UIControlStateNormal];
    [btnClose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];
}

- (IBAction)onClose:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end

@implementation QEntity

- (id)init
{
    self = [super init];
    if (self) {
        right = nil;
    }
    return self;
}

- (void)dealloc
{
    [self.fullname release];
    [self.city release];
    [self.left release];
    [super dealloc];
}

- (void)printValues
{
    if (self.left)
        [self.left printValues];
    
    NSLog(@"-------------------------------");
    NSLog(@"Code: %d", self.code);
    NSLog(@"Fullname: %@", self.fullname);
    NSLog(@"City: %@", self.city);
    NSLog(@"-------------------------------");
    
    if (right)
        [right printValues];
}

- (id)copyWithZone:(NSZone *)zone
{
    // Both case works!
    // QEntity *entity = [[[self class] alloc] init];
    QEntity *entity = [[self class] allocWithZone:zone];
    entity.code     = self.code;
    entity.fullname = self.fullname;
    entity.city     = self.city;
    return entity;
}

@end

@interface QMemoryManagementVC ()

@end

@implementation QMemoryManagementVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Memory Management";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [_objectA release];
    [_objectB release];
    [_objectC release];
}

- (IBAction)onTouchStart:(id)sender
{
    _objectA = (QEntity*)[self level1];
    [_objectA printValues];
}

- (IBAction)onTouchCheck:(id)sender
{
    @try {
        [_objectA printValues];

        if (_objectA) {
            NSLog(@"Everything is Ok.");
            [_objectA release];
        } else {
            NSLog(@"ERROR: something is wrong.");
        }
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR: %@", [exception description]);
    }
}

- (NSObject*)level1
{
    QEntity *e1 = [[QEntity alloc] init];
    e1.code     = 1;
    e1.fullname = @"Pedro Ontiveros";
    
    [self level2:e1];
    NSLog(@"End of process!");
    return e1;
}

- (void)level2:(NSObject*)param
{
    QEntity *entity = (QEntity*)param;
    [entity printValues];
}

- (QEntity*)createObjectA
{
    QEntity *obj = [[[QEntity alloc] init] autorelease];
    obj.code     = 1000;
    obj.fullname = @"John Lennon";
    obj.city     = @"London";
    
    _objectC = [obj copy];
    
    QEntity *child1 = [[[QEntity alloc] init] autorelease];
    child1.fullname = @"Imagine";
    child1.code     = 1;
    child1.city     = @"Liverpool";
    obj.left        = child1;
    
    NSLog(@"obj retainCount: %d", [obj retainCount]);
    NSLog(@"obj.left retainCount: %d", [obj.left retainCount]);
    NSLog(@"\n");
    return obj;
}

- (IBAction)onTouchTest3:(id)sender
{
    @autoreleasepool {
        _objectA = [[self createObjectA] retain];
        _objectB = [_objectA retain];
    }
    
    NSLog(@"_objectA retainCount: %d", [_objectA retainCount]);
    NSLog(@"_objectB retainCount: %d", [_objectB retainCount]);
    NSLog(@"_objectC retainCount: %d", [_objectC retainCount]);
    
    _objectC.city = @"New York";
    [_objectC printValues];
    
    [_objectA printValues];
    [_objectB printValues];
    
    _objectB.city = @"Chicago, Illinois";
    
    [_objectA printValues];
    [_objectB printValues];
    
    [_objectA release];
    [_objectB printValues]; // Alert !!!!!
    [_objectB release];
}

- (IBAction)onTouchTest4:(id)sender
{
    NSLog(@"_objectC retainCount: %d", [_objectC retainCount]);
    [_objectC printValues];
    [_objectC release];
}

- (IBAction)onTouchTest5:(id)sender
{
    QEntity *ptr1 = [[QEntity alloc] init];
    ptr1.fullname = @"George Harrison";
    ptr1.code     = 101;
    
    _objectD          = [[QEntity alloc] init];
    _objectD.code     = 1111;
    _objectD.fullname = @"Pedro Ontiveros";
    _objectD.city     = @"Buenos Aires";
    NSLog(@"_objectD retainCount: %d", [_objectD retainCount]);
    [_objectD printValues];
}

- (IBAction)onTouchTest6:(id)sender
{
    if (_objectD) {
        NSLog(@"_objectD retainCount: %d", [_objectD retainCount]);
        [_objectD printValues];
    }
}


- (IBAction)onTouchTest7:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.intel.com"]];
    
    /*
    UIViewControllerExtended *contr = [[UIViewControllerExtended alloc] init];
    [contr.view setBackgroundColor:[UIColor redColor]];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:contr];
    [self presentViewController:navController animated:YES completion:nil];
    */
    /*
    NSString *homeDir = NSHomeDirectory();
    
    if (homeDir) {
        NSString *fileName = [NSString stringWithFormat:@"%@/pedro.txt", homeDir];
        NSString *content  = @"This message has been written by Pedro Ontiveros.";
        [content writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        NSLog(@"Done");
    }
    */
}

@end
