//
//  WebServiceParser.h
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HonCricScoreManager.h"


@interface HonCricJSONParser : NSObject

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation;
+ (NSString *)stringFromService:(NSData *)objectNotation;

@end
