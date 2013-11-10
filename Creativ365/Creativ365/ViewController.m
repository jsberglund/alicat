//
//  ViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "ViewController.h"
#import "AuthenticationManager.h"
#import "PostManager.h"
#import "TMAPIClient.h"
#import "CalendarViewController.h"
#import "AppDelegate.h"

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) AuthenticationManager *authManager; //delegate owns?
@property (strong, nonatomic) PostManager *postManager; //delegate owns?

@property BOOL newMedia;

@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) NSMutableArray *capturedImages;
@property (nonatomic) UIImage *selectedImage;

//@property (strong, nonatomic) UserInfo *currentUser; //needs to be in delegate?



@end

@implementation ViewController
//@synthesize currentUser;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.authManager = [[AuthenticationManager alloc] init];
    self.postManager = [[PostManager alloc] init];
    self.capturedImages = [[NSMutableArray alloc] init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //where to remove this observer?
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToCalendarController:) name:@"loginDismissed" object:nil];
    
    
    if (![self.authManager isUserLoggedIn]) {
        [self  performSegueWithIdentifier:@"LoginViewControllerSegue" sender:self];
    }
    else
    {
        [self.authManager getCurrentUserInfoWithSuccess:^(UserInfo *user) {
            self.currentUser = user;
            //perform segue to calcontroller
            [self pushToCalendarController:nil];
        } andFailure:^(NSError *error) {
            NSLog(@"================> %@", @"ERROR GETTING USER, login again");
            [self  performSegueWithIdentifier:@"LoginViewControllerSegue" sender:self];
        }];
    }
}

- (void)pushToCalendarController:(NSNotification *)notis
{
    //[self  performSegueWithIdentifier:@"CalendarControllerSegue" sender:self];
}

-(void)setCurrentUser:(UserInfo *)currentUser
{
    ((AppDelegate *)[UIApplication
                     sharedApplication].delegate).currentUser = currentUser;
}

-(UserInfo *)currentUser
{
    return ((AppDelegate *)[UIApplication
                            sharedApplication].delegate).currentUser;
}

//- (void)prepareForSegue:(UIStoryboardSegue*)segue
//{
//    if([segue.identifier isEqualToString:@"CalendarViewControllerSegue"])
//    {
//        CalendarViewController *controller = segue.destinationViewController;
//        
//        controller.currentUser = self.currentUser;
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateButtonTapped:(UIButton *)sender
{
//    [self.authManager AuthenticateUserWithCompletion:^(BOOL success){
//        NSLog(@"call back success");
//        self.statusLabel.text = @"User is authenticated!";
//        
//        [self.authManager getCurrentUserInfoWithSuccess:^(UserInfo *user) {
//            NSLog(@"Success user");
//        } andFailure:^(NSError *error) {
//             NSLog(@"fail user");
//        }];
//    }];
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

-(void)dummyPostButtonTapped:(id)sender
{
    if (self.selectedImage)
    {
        PhotoPost *post = [[PhotoPost alloc] init];
        post.title = @"Test photo post";
        
        [self.postManager submitPost:post
                           withImage:self.selectedImage
                             success:^(NSString *postID) {
            NSLog(@"complete");
        }
                             failure:^(NSError *error) {
            NSLog(@"failure");
        }];
    }
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
