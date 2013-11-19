//
//  CalendarTestViewController.h
//  Creativ365
//
//  Created by Jessica Berglund on 11/12/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MNCalendarView/MNCalendarView.h>

@interface CalendarTestViewController : UIViewController

- (instancetype)initWithCalendar:(NSCalendar *)calendar title:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title;
@end
