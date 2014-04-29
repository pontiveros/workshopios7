//
//  QCameraManagerVC.m
//  WorkshopiOS7
//
//  Created by Pedro Ontiveros on 2/2/14.
//  Copyright (c) 2014 Pedro Ontiveros. All rights reserved.
//

#import "QCameraManagerVC.h"

@interface QCameraManagerVC ()

@end

@implementation QCameraManagerVC

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
    self.title = @"Camera Manager";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchPicture:(id)sender
{
    // CGAffineTransformMake(1, 0, 0, -1, 0, 290.0);
    UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
#if TARGET_IPHONE_SIMULATOR
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraViewTransform = CGAffineTransformMake(-1, 0, 0, -1, 0, 0);
#endif
    picker.allowsEditing = YES;
    picker.delegate      = self;
    [self presentViewController:picker animated:YES completion:nil];
    //[self.navigationController pushViewController:picker animated:YES];
}

- (IBAction)onTouchRecordVideo:(id)sender
{
#if !TARGET_IPHONE_SIMULATOR
    UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
    picker.sourceType    = UIImagePickerControllerCameraCaptureModeVideo;
    picker.allowsEditing = YES;
    picker.delegate      = self;
    [self presentViewController:picker animated:YES completion:nil];
#endif
}

- (IBAction)onTouchRetake:(id)sender
{
    
}

- (IBAction)onTouchSave:(id)sender
{
    UIImage *img = imageView.image;
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    
    [alert setTitle:@"IMAGE"];
    
    if (error) {
        [alert setMessage:[NSString stringWithFormat:@"There is an error trying to save image: %@", [error description]]];
    } else {
        [alert setMessage:@"The image was saved successfully."];
    }
    
    [alert addButtonWithTitle:@"Accept"];
    [alert show];
    [alert release];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    if (info) {
        UIImage *img = info[UIImagePickerControllerEditedImage];
        [imageView setImage:img];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"Picker were cancelled.");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UINavigationControllerDelegate

@end
