//
//  QRegionMonitor.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/5/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QRegionMonitor.h"

QRegionMonitor *regionMonitor;

@implementation QRegionMonitor

- (id)init
{
    if (self = [super init]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    return self;
}

+ (QRegionMonitor*)sharedInstance
{
    if (regionMonitor == nil) {
        regionMonitor = [[QRegionMonitor alloc] init];
        [regionMonitor.locationManager startUpdatingLocation];
    }
    
    return regionMonitor;
}

- (void)updateLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }
}

#pragma mark - CLLocationManagerDelegate 
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Locations: %@",locations);
    //  [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

@end
