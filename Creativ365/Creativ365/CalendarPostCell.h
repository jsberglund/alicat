//
//  CalendarPostCell.h
//  Creativ365
//
//  Created by Jessica Berglund on 11/9/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPostCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (copy, nonatomic) NSURL *photoURL;

@end
