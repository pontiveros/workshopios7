//
//  QFilesAndNetworkVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 2/11/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QFilesAndNetworkingVC.h"

@interface QFilesAndNetworkingVC ()

@end

@implementation QFilesAndNetworkingVC

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMessage:(NSString*)message withTitle:(NSString*)title
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    
    [alert setTitle:title];
    [alert setMessage:message];
    [alert addButtonWithTitle:@"Accept"];
    [alert show];
    
    [alert release];
}

- (IBAction)onTouchWriteFile:(id)sender
{
    // Home directory
    NSString *fullPath = NSHomeDirectory();
    if (fullPath) {
        NSString *fileName = [NSString stringWithFormat:@"%@/pedro.txt", fullPath];
        NSString *message  = @"This message has been writen by Pedro Ontiveros.";
        NSError *error = nil;
        [message writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSString *textError = [NSString stringWithFormat:@"ERROR: %@", [error description]];
            [self showMessage:textError withTitle:@"ERROR"];
        } else {
            [self showMessage:@"The file has been written successfully" withTitle:@"SUCCESS"];
        }
    }
    
    // Documents directory
    NSArray   *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if (docDir) {
        NSString *fileName = [NSString stringWithFormat:@"%@/Pedro2.txt", docDir];
        NSString *message  = @"This is another Pedro Ontiveros' message.";
        [message writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"Done the second file was written.");
    }
}

- (IBAction)onTouchReadFile:(id)sender
{
    NSString *fullPath = NSHomeDirectory();
    if (fullPath) {
        NSString *fileName = [NSString stringWithFormat:@"%@/pedro.txt", fullPath];
        NSError     *error = nil;
        NSString  *content = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            NSString *stringMessage = [NSString stringWithFormat:@"ERROR: %@", [error description]];
            [self showMessage:stringMessage withTitle:@"ERROR"];
        } else {
            [self showMessage:content withTitle:fileName];
        }
    }
    
    NSArray   *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if (docDir) {
        NSString *fileName = [NSString stringWithFormat:@"%@/Pedro2.txt", docDir];
        NSError     *error = nil;
        NSString *message  = [NSString stringWithContentsOfFile:@"pedroontiveros" encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            NSString *stringMessage = [NSString stringWithFormat:@"ERROR: %@", [error description]];
            [self showMessage:stringMessage withTitle:@"ERROR"];
        } else {
            [self showMessage:message withTitle:fileName];
        }
    }
}

- (IBAction)onTouchCreateDirectory:(id)sender
{
    // One of the several way to create a directory in iOS.
    NSString    *path = NSHomeDirectory();
    NSString *dirName = [NSString stringWithFormat:@"%@/PedroDir", path];
    NSError    *error = nil;
    
    [[NSFileManager defaultManager] createDirectoryAtPath:dirName withIntermediateDirectories:NO attributes:nil error:&error];
    
    if (error) {
        NSString *stringError = [NSString stringWithFormat:@"ERROR: %@", [error description]];
        [self showMessage:stringError withTitle:@"ERROR"];
    } else {
        NSString *message = [NSString stringWithFormat:@"The new dir %@ has been created!", dirName];
        [self showMessage:message withTitle:@"Success"];
    }
}

- (IBAction)onTouchRemoveDirectory:(id)sender
{
    NSString    *path = NSHomeDirectory();
    NSString *dirName = [NSString stringWithFormat:@"%@/PedroDir", path];
    NSError    *error = nil;
    
    [[NSFileManager defaultManager] removeItemAtPath:dirName error:&error];
    if (error) {
        NSString *stringError = [NSString stringWithFormat:@"ERROR: %@", [error description]];
        [self showMessage:stringError withTitle:@"ERROR"];
    } else {
        NSString *message = [NSString stringWithFormat:@"The new dir %@ has been removed!", dirName];
        [self showMessage:message withTitle:@"Success"];
    }
}

- (IBAction)onTouchGetAppPath:(id)sender
{
    // NSFileManager *fm = [NSFileManager defaultManager];
}

- (IBAction)onTouchSavePropertyList:(id)sender
{
    
}

- (IBAction)onTouchOpenGoogle:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}
@end
