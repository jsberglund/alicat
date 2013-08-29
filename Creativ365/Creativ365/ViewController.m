//
//  ViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "ViewController.h"
#import "AuthenticationManager.h"
#import "SecretConstants.h"
#import "PostManager.h"
#import "TMAPIClient.h"

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) AuthenticationManager *authManager;
@property (strong, nonatomic) PostManager *postManager;

@property BOOL newMedia;

@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) NSMutableArray *capturedImages;
@property (nonatomic) UIImage *selectedImage;



@end

@implementation ViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [TMAPIClient sharedInstance].OAuthConsumerKey = kTumblrConsumerKey;
    [TMAPIClient sharedInstance].OAuthConsumerSecret = kTumblrConsumerSecret;
	self.authManager = [[AuthenticationManager alloc] init];
    self.postManager = [[PostManager alloc] init];
    
    self.capturedImages = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateButtonTapped:(UIButton *)sender
{
    [self.authManager AuthenticateUserWithCompletion:^(BOOL success){
        NSLog(@"call back success");
        self.statusLabel.text = @"User is authenticated!";
    }];
}

- (IBAction)getPostsButtonTapped:(UIButton *)sender
{
    [self.postManager getPostsByMonth:@"August" andYear:@"2013"
                           success:^(NSArray *postsArray) {
        NSLog(@"complete");
    } failure:^(NSError *error) {
        NSLog(@"failure");
    }];
}

#pragma mark - Photo Picker
- (IBAction)getPhotoTapped:(id)sender
{
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}


- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
    }
    
    if (self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}


- (void)finishAndUpdate
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            self.selectedImage = [self.capturedImages objectAtIndex:0];
            [self.imageView setImage: self.selectedImage];
        }

        [self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
}

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
    [self finishAndUpdate];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
