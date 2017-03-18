//
//  IndividualScoreBoardViewController.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndividualScoreBoardViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *IndividualScoreBoardTableView;

@end
