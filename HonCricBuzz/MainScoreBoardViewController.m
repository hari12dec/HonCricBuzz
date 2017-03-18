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
#import "HonCricScoreManager.h"

#define kCellIdentifier @"HonMainCricCell"
#define kDetailScore @"DetailScore"

@interface MainScoreBoardViewController () <ScoreManager>
{
	NSArray *currentMatchs;
	NSString *currentScore;
	HonCricScoreManager *cricManager;

	UIRefreshControl *scoreRefresh;
}
@end

@implementation MainScoreBoardViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	currentScore = @"--";

	cricManager = [[HonCricScoreManager alloc]init];
	cricManager.delegate = self;
	[cricManager callLiveCricketScore];

	scoreRefresh = [[UIRefreshControl alloc]init];
	[mainScoreCardTableView addSubview:scoreRefresh];
	[scoreRefresh addTarget:self action:@selector(refreshMainScore) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshMainScore {
	[cricManager callLiveCricketScore];
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
	//MainScoreModel *scoreModel = [currentMatchs objectAtIndex:indexPath.row];

	scoreCell.matchKind.text = [NSString stringWithFormat:@"TEST"];
	scoreCell.matchStatus.text = [NSString stringWithFormat:@"In Progress"];
	scoreCell.seriesName.text = [NSString stringWithFormat:@"Austraila tour of India 2017"];
	scoreCell.teamNames.text = [NSString stringWithFormat:@"IND vs AUS"];
	scoreCell.battingScore.text = [NSString stringWithFormat:@"IND %@/0", currentScore];
	scoreCell.bowlOver.text = [NSString stringWithFormat:@"32.5 Over"];

	scoreCell.selectionStyle = UITableViewCellSelectionStyleNone;
	return scoreCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	[self performSegueWithIdentifier:kDetailScore sender:nil];
}

#pragma mark - LiveScore Delegate

- (void)getLiveScore:(NSArray *)scoreModel {
//	if (scoreRefresh.isRefreshing) {
		[scoreRefresh endRefreshing];
//	}
	currentMatchs = scoreModel;
	[mainScoreCardTableView reloadData];
}

- (void)getLiveeScore:(NSString *)score {
	score = [score stringByReplacingOccurrencesOfString:@"\"" withString:@""];
	currentScore = score;
	[mainScoreCardTableView reloadData];
}

- (void)unableToFetchLiveScore {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Unable to fetch live score! /n Please try after some time" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){
		// Ok action example
	}];
	[alert addAction:cancelAction];
	[self presentViewController:alert animated:YES completion:^{

	}];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
