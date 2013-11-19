//
//  CalendarScrollViewController.m
//  Creativ365
//
//  Created by Jessica Berglund on 11/16/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import "CalendarScrollViewController.h"
#import "CalendarMonthCell.h"

@interface CalendarScrollViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSInteger numItems;

@property CGFloat prevScrollOffset;
@property NSMutableArray *itemArray;

@property int currentIndex;

@end

@implementation CalendarScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.itemArray = [@[@1] mutableCopy];
    self.currentIndex = 1;
    self.numItems = 1;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
//    UINib *cellNib = [UINib nibWithNibName:@"CalendarMonthCell" bundle:nil];
//    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CELL"];
//    [self.collectionView registerClass:[CalendarMonthCell class] forCellWithReuseIdentifier:@"CELL"];

}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
//
//    // scrolling here does work
//    [self.collectionView scrollToItemAtIndexPath:indexPath
//                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
//                                        animated:NO];
//}


- (IBAction)addDataButtonTapped:(id)sender {
    NSNumber *number = [NSNumber numberWithInt:self.currentIndex++ % 6];
    
    [self.itemArray insertObject:number atIndex:0];
    
    [self.collectionView reloadData];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    
    //    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
    
    //    [self.collectionView performBatchUpdates:^{
    //        int resultsSize = [self.itemArray count]; //data is the previous array of data
    //        [self.itemArray addObjectsFromArray:newData];
    //        NSMutableArray *arrayWithIndexPaths = [NSMutableArray array];
    //        for (int i = resultsSize; i < resultsSize + newData.count; i++)
    //        {
    //            [arrayWithIndexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    //        }
    //
    //        [self.collectionView insertItemsAtIndexPaths:arrayWithIndexPaths];
    //    }
    //                                    completion:nil];
    
    
    //[self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemArray.count;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    //    self.testLabel.text = [NSString stringWithFormat:@"index: %f offset: %f", self.collectionView.contentOffset.x / pageWidth,  self.collectionView.contentOffset.x];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.prevScrollOffset = self.collectionView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat relativeOffset = (self.prevScrollOffset - self.collectionView.contentOffset.x) / self.collectionView.frame.size.width;
    self.testLabel.text = [NSString stringWithFormat:@"prev: %f relative offset: %f",  self.prevScrollOffset, relativeOffset];
}


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (CalendarMonthCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

//    CalendarMonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
//    cell.monthTitle.text = @"November";
//    [cell setUpViewWithStartDate:[NSDate date]  andEndDate:[NSDate date] ];
//    return cell;

    
    
    static NSString *cellIdentifier = @"CELL";
    
    CalendarMonthCell *cell = (CalendarMonthCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
        cell.monthTitle.text = @"November";
        [cell setUpViewWithStartDate:[NSDate date]  andEndDate:[NSDate date] ];
    return cell;
}

@end
