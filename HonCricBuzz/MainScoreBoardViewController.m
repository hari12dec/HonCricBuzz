//
//  ViewController.m
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import "MainScoreBoardViewController.h"
#import "MainScoreTableViewCell.h"
#import "MainScoreModel.h"
#import "HonCricJSONParser.h"

#define kCellIdentifier @"HonMainCricCell"
#define kDetailScore @"DetailScore"

@interface MainScoreBoardViewController ()
{
	NSArray *currentMatchs;
	UIRefreshControl *scoreRefresh;
}
@end

@implementation MainScoreBoardViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


	scoreRefresh = [[UIRefreshControl alloc]init];
	[mainScoreCardTableView addSubview:scoreRefresh];
	[scoreRefresh addTarget:self action:@selector(refreshMainScore) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshMainScore {
	[scoreRefresh endRefreshing];
}

- (void)getMainScoreCard {

	NSURL *URL = [NSURL URLWithString:@"http://example.com"];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];

	NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request
										 completionHandler:
							   ^(NSData *data, NSURLResponse *response, NSError *error) {
								   // ...
							   }];

	[task resume];
	//	[NSURLSession sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
	//
	//		if (error) {
	//			[self.delegate fetchingGroupsFailedWithError:error];
	//		} else {
	//			[self.delegate receivedGroupsJSON:data];
	//		}
	//	}];
}

#pragma mark TableView Delegates and DataSources

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 167;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;//currentMatchs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	MainScoreTableViewCell *scoreCell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	MainScoreModel *mainScore = [currentMatchs objectAtIndex:indexPath.row];
	scoreCell.matchKind.text = [NSString stringWithFormat:@"TEST"];
	scoreCell.matchStatus.text = [NSString stringWithFormat:@"In Progress"];
	scoreCell.seriesName.text = [NSString stringWithFormat:@"Austraila tour of India 2017"];
	scoreCell.teamNames.text = [NSString stringWithFormat:@"IND vs AUS"];
	scoreCell.battingScore.text = [NSString stringWithFormat:@"IND 250/5"];
	scoreCell.bowlOver.text = [NSString stringWithFormat:@"99.9 Over"];
	return scoreCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	[self performSegueWithIdentifier:kDetailScore sender:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
