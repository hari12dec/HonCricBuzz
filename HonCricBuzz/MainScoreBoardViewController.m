//
//  ViewController.m
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import "MainScoreBoardViewController.h"
#import "MainScoreTableViewCell.h"

#define kCellIdentifier @"HonMainCricCell"

@interface MainScoreBoardViewController ()
{
	
}
@end

@implementation MainScoreBoardViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark TableView Delegates and DataSources

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 167;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MainScoreTableViewCell *scoreCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	return scoreCell;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
