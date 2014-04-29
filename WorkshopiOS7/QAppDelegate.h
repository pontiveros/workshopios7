//
//  QAppDelegate.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 12/24/13.
//  Copyright (c) 2013 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
