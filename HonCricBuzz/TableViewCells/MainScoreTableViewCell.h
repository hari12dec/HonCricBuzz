//
//  MainScoreTableViewCell.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScoreTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *matchKind;
@property (weak, nonatomic) IBOutlet UILabel *matchStatus;
@property (weak, nonatomic) IBOutlet UILabel *seriesName;
@property (weak, nonatomic) IBOutlet UILabel *teamNames;
@property (weak, nonatomic) IBOutlet UILabel *battingScore;
@property (weak, nonatomic) IBOutlet UILabel *bowlOver;

@end
