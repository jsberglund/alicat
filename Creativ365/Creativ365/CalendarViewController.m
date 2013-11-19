//
//  CalendarViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 11/8/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "CalendarViewController.h"
#import "PostManager.h"
#import "AppDelegate.h"
#import "CalendarPostCell.h"
#import <MBProgressHUD.h>

@interface CalendarViewController ()
@property(nonatomic, weak) IBOutlet UICollectionView *calendarCollectionView;

@property (strong, nonatomic) NSArray *currentMonthPosts;
@property (strong, nonatomic) NSString *currentMonthLabel;
@property (strong, nonatomic) NSMutableDictionary *PostsByMonthDict;

@property (strong, nonatomic) PostManager *postManager;
@property (strong, nonatomic) UserInfo *currentUser;

@end

@implementation CalendarViewController
- (IBAction)calendarTestTapped:(id)sender {
    [self  performSegueWithIdentifier:@"CalendarTestSegue" sender:self];
}

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
    self.currentUser = ((AppDelegate *)[UIApplication
                                        sharedApplication].delegate).currentUser;
    
    self.postManager = [[PostManager alloc] initWithHostname:self.currentUser.primaryBlog.hostname];
	// load the current month's data (then previous?)
    [self.postManager getPostsByMonth:@"August" andYear:@"2013" success:^(NSArray *posts) {
        NSLog(@"================> %@", @"SUCCESS getting posts");
        self.currentMonthPosts = posts;
        [self.calendarCollectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"================> %@", @"FAILURE getting posts");
        self.currentMonthPosts = @[];
    }];
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed
        //now log out (clear tokens) DOF: Messy, clean up
        [((AppDelegate *)[UIApplication
                         sharedApplication].delegate).authManager logOutUser];
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {

    return [self.currentMonthPosts count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarPostCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CalPostCell" forIndexPath:indexPath];
    
    cell.dateLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    PhotoPost *post = self.currentMonthPosts[indexPath.row];
    
    cell.photoURL = post.thumbnailUrl;
    //setupCell
    //[cell addSubview:testLabel];
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize retval = CGSizeMake(44, 44);
    return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

@end
