//
//  IndividualScoreBoardViewController.m
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import "IndividualScoreBoardViewController.h"
#import "IndividualScoreTableViewCell.h"

#define kCurrentIndividual @"CurrentIndividual"

@interface IndividualScoreBoardViewController ()

@end

@implementation IndividualScoreBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.IndividualScoreBoardTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;//currentMatchs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	IndividualScoreTableViewCell *individualScore = [tableView dequeueReusableCellWithIdentifier:kCurrentIndividual];
//	individualScore.matchKind.text = [NSString stringWithFormat:@"TEST"];
//	individualScore.matchStatus.text = [NSString stringWithFormat:@"In Progress"];
//	individualScore.seriesName.text = [NSString stringWithFormat:@"Austraila tour of India 2017"];
//	individualScore.teamNames.text = [NSString stringWithFormat:@"IND vs AUS"];
//	individualScore.battingScore.text = [NSString stringWithFormat:@"IND 250/5"];
//	individualScore.bowlOver.text = [NSString stringWithFormat:@"99.9 Over"];
	return individualScore;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
