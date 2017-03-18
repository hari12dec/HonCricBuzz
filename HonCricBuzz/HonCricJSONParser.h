//
//  WebServiceParser.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HonCricScoreManager.h"

@protocol ScoreParser <NSObject>

- (void)fetchDataFromJSON:(NSData *)jsonData;

@end

@interface HonCricJSONParser : NSObject

@end
