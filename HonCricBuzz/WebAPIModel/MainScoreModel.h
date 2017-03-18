//
//  MainScoreModel.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainScoreModel : NSObject

@property (strong, nonatomic) NSString *matchKind;
@property (strong, nonatomic) NSString *matchStatus;
@property (strong, nonatomic) NSString *seriesName;
@property (strong, nonatomic) NSString *teamNames;
@property (strong, nonatomic) NSString *battingScore;
@property (strong, nonatomic) NSString *bowlOver;

@end
