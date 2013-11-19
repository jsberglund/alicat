//
//  CalendarScrollViewController.h
//  Creativ365
//
//  Created by Jessica Berglund on 11/16/13.
//  Copyright (c) 2013 Jessica Berglund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarScrollViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;




@end
