//
//  WebServiceParser.m
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import "HonCricJSONParser.h"
#import "MainScoreModel.h"

@implementation HonCricJSONParser

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation;
{
	NSError *localError = nil;
	NSArray *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];

	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MainScoreMock" ofType:@"json"];
	NSData *data = [NSData dataWithContentsOfFile:filePath];

	if (localError != nil) {
		return nil;
	}

	NSMutableArray *groups = [[NSMutableArray alloc] init];

	NSArray *results = [parsedObject valueForKey:@"results"];

	for (NSDictionary *mainDic in results) {
		MainScoreModel *mainScore = [[MainScoreModel alloc] init];

		for (NSString *key in mainDic) {
			if ([mainScore respondsToSelector:NSSelectorFromString(key)]) {
				[mainScore setValue:[mainDic valueForKey:key] forKey:key];
			}
		}

		[groups addObject:mainScore];
	}

	return groups;
}

+ (NSString *)stringFromService:(NSData *)objectNotation {
	NSString* newStr = [[NSString alloc] initWithData:objectNotation encoding:NSUTF8StringEncoding];


	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MainScoreMock" ofType:@"json"];
	NSData *data = [NSData dataWithContentsOfFile:filePath];

	NSArray *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];


	return newStr;
}


@end

