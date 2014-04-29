//
//  QCameraManagerVC.h
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 2/2/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCameraManagerVC : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView *imageView;
}

@end
