//
//  MasterViewController2.m
//  MasterDetailTest
//
//  Created by jakob on 26.05.15.
//  Copyright (c) 2015 TheMarketTrust. All rights reserved.
//

#import "MasterViewController2.h"
#import "DetailViewController.h"

@interface MasterViewController2 ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController2

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:@"AnotherMenuEntry1" atIndex:0];
    [self.objects insertObject:@"AnotherMenuEntry2" atIndex:1];
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionBottom];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *vc = (UINavigationController *)[sb instantiateViewControllerWithIdentifier:@"DetailViewController"];
    NSDate *object = self.objects[indexPath.row];
    DetailViewController *detail = (DetailViewController *)[[vc viewControllers] lastObject];
    [detail setDetailItem:object];
    vc.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    vc.navigationItem.leftItemsSupplementBackButton = YES;
    [self showDetailViewController:vc sender:self];
}


@end
