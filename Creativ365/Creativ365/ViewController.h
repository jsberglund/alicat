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

- (IBAction)authenticateButtonTapped:(UIButton *)sender;
- (IBAction)getPostsButtonTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end
