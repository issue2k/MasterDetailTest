//
//  MasterViewController.h
//  MasterDetailTest
//
//  Created by jakob on 26.05.15.
//  Copyright (c) 2015 TheMarketTrust. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

