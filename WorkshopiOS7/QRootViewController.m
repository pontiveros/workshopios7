//
//  QRootViewController.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/24/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QRootViewController.h"
#import "QGesturesVC.h"
#import "QMultiThreadVC.h"
#import "QWebViewVC.h"
#import "QTableVC.h"
#import "QGravityCollisionVC.h"
#import "QLocationVC.h"
#import "QCameraManagerVC.h"
#import "QMemoryManagementVC.h"
#import "QFilesAndNetworkingVC.h"
#import "QPanelViewController.h"



@interface QRootViewController ()

@end

@implementation QRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        items = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fillRootTable];
    self.title = @"Workshop 1";
    
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    // [self.navigationItem.leftBarButtonItem setTintColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [items release];
    [super dealloc];
}

- (void)fillRootTable
{
    NSMutableDictionary *fundamentals = [[[NSMutableDictionary alloc] init] autorelease];
    [fundamentals setObject:@"openCoreDataSample" forKey:@"CoreData"];
    [fundamentals setObject:@"openWebViewVC" forKey:@"WebView"];
    [fundamentals setObject:@"openTableVC" forKey:@"TableView"];
    [fundamentals setObject:@"openCamera" forKey:@"Camera"];
    [fundamentals setObject:@"openMemoryManagement" forKey:@"Memory Management"];
    [fundamentals setObject:@"openFilesAndNetworking" forKey:@"Files and Networking"];
    [fundamentals setObject:@"openWorkingViews" forKey:@"Working with views"];
    [items setObject:fundamentals forKey:@"Fundamentals"];
    
    NSMutableDictionary *advanced = [[[NSMutableDictionary alloc] init] autorelease];
    [advanced setObject:@"openGesturesVC" forKey:@"Gestures"];
    [advanced setObject:@"openLocationModule" forKey:@"Location"];
    [advanced setObject:@"openMultithreadVC" forKey:@"Multithreading"];
    [advanced setObject:@"openGravityCollisionVC" forKey:@"Gravity And Collission"];
    [advanced setObject:@"openQuartzModule" forKey:@"Quartz"];
    [items setObject:advanced forKey:@"Advanced"];
    
    /*
    NSMutableDictionary *graphics = [[[NSMutableDictionary alloc] init] autorelease];
    [graphics setObject:@"openMotionView" forKey:@"Motion"];
    [graphics setObject:@"openTransitions" forKey:@"Transitions"];
    [graphics setObject:@"openGesturesView" forKey:@"Gesture recognizer"];
    [items setObject:graphics forKey:@"Graphics"];
    */
}

#pragma mark - Modules

- (void)openGesturesVC
{
    QGesturesVC *gestVC = [[[QGesturesVC alloc] init] autorelease];
    [self.navigationController pushViewController:gestVC animated:YES];
}

- (void)openMultithreadVC
{
    QMultiThreadVC *multiThreadVC = [[[QMultiThreadVC alloc] init] autorelease];
    [self.navigationController pushViewController:multiThreadVC animated:YES];
}

- (void)openWebViewVC
{
    QWebViewVC *webViewVC = [[[QWebViewVC alloc] init] autorelease];
    [self.navigationController pushViewController:webViewVC animated:YES];
}

- (void)openLocationModule
{
    QLocationVC *locVC = [[[QLocationVC alloc] init] autorelease];
    [self.navigationController pushViewController:locVC animated:YES];
}

- (void)openGravityCollisionVC
{
    QGravityCollisionVC *gravityVC = [[[QGravityCollisionVC alloc] init] autorelease];
    [self.navigationController pushViewController:gravityVC animated:YES];
}

- (void)openTableVC
{
    QTableVC *tableView = [[[QTableVC alloc] init] autorelease];
    [self.navigationController pushViewController:tableView animated:YES];
}

- (void)openCamera
{
    QCameraManagerVC *camMgrVC = [[[QCameraManagerVC alloc] init] autorelease];
    [self.navigationController pushViewController:camMgrVC animated:YES];
}

- (void)openMemoryManagement
{
    QMemoryManagementVC *memVC = [[[QMemoryManagementVC alloc] init] autorelease];
    [self.navigationController pushViewController:memVC animated:YES];
}

- (void)openFilesAndNetworking
{
    QFilesAndNetworkingVC *fileN = [[[QFilesAndNetworkingVC alloc] init] autorelease];
    [self.navigationController pushViewController:fileN animated:YES];
}

- (void)openQuartzModule
{
    NSLog(@"Implement here Quartz® functionality.");
}

- (void)openWorkingViews
{
    QPanelViewController *panelVC = [[[QPanelViewController alloc] init] autorelease];
    [self.navigationController pushViewController:panelVC animated:YES];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        NSString         *key = [[items allKeys] objectAtIndex:indexPath.section];
        NSDictionary    *dict = [items objectForKey:key];
        NSString *strSelector = [dict objectForKey:[[dict allKeys] objectAtIndex:indexPath.row]];
        
        SEL         signatureSel = NSSelectorFromString(strSelector);
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:signatureSel]];
        
        [invocation setTarget:self];
        [invocation setSelector:signatureSel];
        [invocation invoke];
        
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        
    } @catch (NSException *err) {
        NSLog(@"An error has occurred :%@", [err description]);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:[err description] delegate:nil cancelButtonTitle:@"Accept" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[[UITableViewCell alloc] init] autorelease];
    NSString     *key  = [[items allKeys] objectAtIndex:indexPath.section];
    NSDictionary *dict = [items objectForKey:key];
    NSString    *label = [[dict allKeys] objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:label];
    return cell;
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [[items allKeys] objectAtIndex:section];
    return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray  *keys = [items allKeys];
    NSString  *key = [keys objectAtIndex:section];
    NSDictionary *dict = [items objectForKey:key];
    return [dict count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [items count];
}
@end
