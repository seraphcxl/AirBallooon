//
//  DCHDribbbleAPIHelper.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/3/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Tourbillon/DCHTourbillon.h>
#import <AFNetworking/AFNetworking.h>
#import "DCHDribbbleRequest.h"

typedef void(^DCHDribbbleAPICompletion)(id content, NSError *error);

@interface DCHDribbbleAPIHelper : NSObject

DCH_DEFINE_SINGLETON_FOR_HEADER(DCHDribbbleAPIHelper)

@property (nonatomic, strong, readonly) AFHTTPSessionManager *sessionMgr;

- (NSURLSessionDataTask *)listShots:(DCHDribbbleListShotsRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion;
- (NSURLSessionDataTask *)getOneShot:(DCHDribbbleGetOneShotRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion;
- (NSURLSessionDataTask *)listCommentsForOneShot:(DCHDribbbleListCommentsForOneShotRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion;
- (NSURLSessionDataTask *)queryOneUser:(DCHDribbbleQueryOneUserRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion;
- (NSURLSessionDataTask *)listUserShots:(DCHDribbbleListUserShotsRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion;

@end
