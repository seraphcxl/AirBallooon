//
//  DCHDribbbleRequest.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/3/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCHDribbbleRequest : NSObject

@property (nonatomic, strong) NSString *url;

- (NSDictionary *)parameters;
- (NSString *)endpoint;

@end

extern NSString * const str_DCHDribbbleListShotsRequest;

@interface DCHDribbbleListShotsRequest : DCHDribbbleRequest

@property (nonatomic, strong) NSString *list;
@property (nonatomic, strong) NSString *timeframe;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *sort;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger perPage;

@end

extern NSString * const str_DCHDribbbleGetOneShotRequest;

@interface DCHDribbbleGetOneShotRequest : DCHDribbbleRequest

@property (nonatomic, assign) NSInteger id;

@end

extern NSString * const str_DCHDribbbleListCommentsForOneShotRequest;

@interface DCHDribbbleListCommentsForOneShotRequest : DCHDribbbleRequest

@property (nonatomic, assign) NSUInteger shot;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger perPage;

@end

@interface DCHDribbbleQueryOneUserRequest : DCHDribbbleRequest

@property (nonatomic, assign) NSUInteger user;

@end

@interface DCHDribbbleListUserShotsRequest : DCHDribbbleRequest

@property (nonatomic, assign) NSUInteger user;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger perPage;

@end