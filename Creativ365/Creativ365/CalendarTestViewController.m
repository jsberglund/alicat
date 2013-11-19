//
//  CalendarTestViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 11/12/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "CalendarTestViewController.h"

@interface CalendarTestViewController ()<MNCalendarViewDelegate>

@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) MNCalendarView *calendarView;
@property (nonatomic, strong) NSDate *currentDate;

@end

@implementation CalendarTestViewController

- (instancetype)initWithCalendar:(NSCalendar *)calendar title:(NSString *)title {
	if (self = [super init]) {
		self.calendar = calendar;
		self.title = title;
	}
	return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
		self.calendar =  [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	}
	return self;
}

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
		self.calendar =  [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		self.title = title;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
	self.view.backgroundColor = UIColor.whiteColor;
    
	self.currentDate = [NSDate date];
    
    //	self.calendarView = [[MNCalendarView alloc] initWithStartDate:self.currentDate andEndDate:self.currentDate andFrame:self.view.bounds];
    
    self.calendarView = [[MNCalendarView alloc] initWithStartDate:self.currentDate andEndDate:self.currentDate andFrame:self.view.bounds];
    
	self.calendarView.calendar = self.calendar;
	self.calendarView.selectedDate = [NSDate date];
	self.calendarView.delegate = self;
	self.calendarView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.calendarView.backgroundColor = UIColor.whiteColor;
    
	[self.view addSubview:self.calendarView];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[self.calendarView.collectionView.collectionViewLayout invalidateLayout];
	[super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[self.calendarView reloadData];
}

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

@end
