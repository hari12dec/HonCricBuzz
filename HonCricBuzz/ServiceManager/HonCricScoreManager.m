//
//  HonCricScoreManager.m
//  HonCricBuzz
//
//  Created by administrator on 18/03/17.
//  Copyright © 2017 honeywell. All rights reserved.
//

#import "HonCricScoreManager.h"
#import "HonCricJSONParser.h"

@implementation HonCricScoreManager

- (void)callLiveCricketScore {

	NSURL *URL = [NSURL URLWithString:@"https://hwhackathon170317.azurewebsites.net/cricscore/runs"];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];

	NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request
											completionHandler:
								  ^(NSData *data, NSURLResponse *response, NSError *error) {
									  if (error == nil && data != nil) {
										 NSString *score = [HonCricJSONParser stringFromService:data];
										 [self.delegate getLiveeScore:score];
									  } else {
										  [self.delegate unableToFetchLiveScore];
									  }
								  }];

	[task resume];
}

@end
