//
//  CalendarMonthCell.h
//  Creativ365
//
//  Created by Jessica Berglund on 11/16/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MNCalendarView/MNCalendarView.h>

@interface CalendarMonthCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *monthTitle;
@property (weak, nonatomic) IBOutlet UIView *monthView;

@property (strong, nonatomic) IBOutlet CalendarMonthCell *topLevelSubview;
- (void)setUpViewWithStartDate:(NSDate *)start andEndDate:(NSDate *)end;

@end
