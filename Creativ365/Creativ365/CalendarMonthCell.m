//
//  CalendarMonthCell.m
//  Creativ365
//
//  Created by Jessica Berglund on 11/16/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "CalendarMonthCell.h"

@interface CalendarMonthCell ()<MNCalendarViewDelegate>

@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) MNCalendarView *calendarView;
@property (nonatomic, strong) NSDate *currentDate;

@end

@implementation CalendarMonthCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.calendar =  [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.calendar =  [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    return self;
}


- (void)setUpViewWithStartDate:(NSDate *)start andEndDate:(NSDate *)end
{
	   
	self.backgroundColor = UIColor.whiteColor;
    
	//self.currentDate = [NSDate date];
    
    self.calendarView = [[MNCalendarView alloc] initWithStartDate:start andEndDate:end andFrame:self.monthView.bounds];
    
	self.calendarView.calendar = self.calendar;
	self.calendarView.selectedDate = [NSDate date];
	self.calendarView.delegate = self;
	//self.calendarView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.calendarView.backgroundColor = UIColor.whiteColor;
    
	[self.monthView addSubview:self.calendarView];
}



//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
//	[self.calendarView reloadData];
//}

#pragma mark - MNCalendarViewDelegate

- (void)calendarView:(MNCalendarView *)calendarView loadPhoto:(UIImageView *)imageView forDate:(NSDate *)date {
	NSDate *now = [NSDate date];
	int daysToAdd = 1;
	NSDate *newDate1 = [now dateByAddingTimeInterval:60 * 60 * 24 * daysToAdd];
    
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
	NSInteger day = [components day];
	if (day == 15) {
		imageView.image = [UIImage imageNamed:@"blue"];
	}else{
        imageView.image = nil;
    }
}

- (void)calendarView:(MNCalendarView *)calendarView didSelectDate:(NSDate *)date {
	NSLog(@"date selected: %@", date);
}

- (BOOL)calendarView:(MNCalendarView *)calendarView shouldSelectDate:(NSDate *)date {
	NSTimeInterval timeInterval = [date timeIntervalSinceDate:self.currentDate];
    
	if ([date timeIntervalSinceNow] > [self.currentDate timeIntervalSinceNow]) {
		return NO;
	}
    
	return YES;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
