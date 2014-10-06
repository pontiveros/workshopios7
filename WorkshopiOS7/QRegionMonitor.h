//
//  QRegionMonitor.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 10/5/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface QRegionMonitor : NSObject <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;

+ (QRegionMonitor*)sharedInstance;
- (void)updateLocation;

@end
