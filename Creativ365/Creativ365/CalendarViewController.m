//
//  CalendarViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 11/8/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "CalendarViewController.h"
#import "PostManager.h"
#import <MBProgressHUD.h>

@interface CalendarViewController ()
@property (strong, nonatomic) NSArray *currentMonthPosts;
@property (strong, nonatomic) NSString *currentMonthLabel;
@property (strong, nonatomic) NSMutableDictionary *PostsByMonthDict;

@property (strong, nonatomic) PostManager *postManager;

@end

@implementation CalendarViewController

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
    //[self.postManager initWithHostname:];
	// load the current month's data (then previous?)
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - UICollectionView Datasource
//// 1
//- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
//
//    return [self.currentMonthPosts count];
//}
//// 2
//- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
//    return 1;
//}
//// 3
//- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PostCell " forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor blackColor];
//    //setupCell
//    return cell;
//}
//// 4
///*- (UICollectionReusableView *)collectionView:
// (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
// {
// return [[UICollectionReusableView alloc] init];
// }*/
//
//
//#pragma mark - UICollectionViewDelegate
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    // TODO: Select Item
//}
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    // TODO: Deselect item
//}
//
//#pragma mark – UICollectionViewDelegateFlowLayout
//
//// 1
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CGSize retval = CGSizeMake(44, 44);
//    return retval;
//}
//
//// 3
//- (UIEdgeInsets)collectionView:
//(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(1, 1, 1, 1);
//}
//
@end
