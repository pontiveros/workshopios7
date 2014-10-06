//
//  QLocationVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/30/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import "QLocationVC.h"

@interface QLocationVC ()

@end

@implementation QLocationVC

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
    self.title = @"Location";
    
    // NSDictionary *dict = NSDictionaryOfVariableBindings(self.canvas, self.box1, self.box2);
    // NSArray *contraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[box1]- 21 -[box2]" options:0 metrics:nil views:dict];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.box1 setBackgroundColor:[UIColor redColor]];
    [self.box2 setBackgroundColor:[UIColor grayColor]];
}

- (IBAction)onTouchStartMonitor:(id)sender;
{
    /*
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter  = 500;
        
        [self.locationManager startUpdatingLocation];
    }
     */
}

#pragma mark - CLLocationManagerDelegate
/*
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations");
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region");
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Updating...location.");
}
*/
@end
