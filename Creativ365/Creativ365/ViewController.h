//
//  ViewController.h
//  Creativ365
//
//  Created by Jessica Berglund on 8/22/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *authenticateButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)authenticateButtonTapped:(UIButton *)sender;
- (IBAction)getPostsButtonTapped:(UIButton *)sender;
- (IBAction)getPhotoTapped:(UIButton *)sender;
- (IBAction)dummyPostButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end
