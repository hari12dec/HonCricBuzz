//
//  HonCricScoreManager.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainScoreModel.h"

@protocol ScoreManager <NSObject>

- (void)getLiveScore:(NSArray *)scoreModel;
- (void)getLiveeScore:(NSString *)score;
- (void)unableToFetchLiveScore;

@end

@interface HonCricScoreManager : NSObject

@property (strong, nonatomic) MainScoreModel *scoreModel;
@property (weak, nonatomic) id <ScoreManager> delegate;

- (void)callLiveCricketScore;

@end
