//
//  DetailViewController.h
//  MasterDetailTest
//
//  Created by jakob on 26.05.15.
//  Copyright (c) 2015 TheMarketTrust. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

