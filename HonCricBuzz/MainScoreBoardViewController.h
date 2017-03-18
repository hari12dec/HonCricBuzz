//
//  ViewController.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScoreBoardViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{

	__weak IBOutlet UITableView *mainScoreCardTableView;
}

@end

