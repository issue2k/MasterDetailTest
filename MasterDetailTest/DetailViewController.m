//
//  DetailViewController.m
//  MasterDetailTest
//
//  Created by jakob on 26.05.15.
//  Copyright (c) 2015 TheMarketTrust. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    // Check for back button (on iPhone devices)
    int n = [self.navigationController.viewControllers count] - 2;
    if (n >= 0) {
        if ([(UIViewController*)[self.navigationController.viewControllers objectAtIndex:n] navigationItem].backBarButtonItem == nil) {
            self.navigationController.topViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
