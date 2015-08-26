//
//  DCHDribbbleAPIHelper.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/3/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHDribbbleAPIHelper.h"
#import "DCHDribbbleShotListModel.h"
#import "DCHDribbbleCommentListModel.h"
#import "DCHDribbbleUserModel.h"
#import "DCHJSONResponseSerializer.h"
#import "DCHDribbbleError.h"

static NSString * const key_DCHDribbbleAPIHelper_DribbbleAuthURLString = @"https://dribbble.com/oauth/";
static NSString * const key_DCHDribbbleAPIHelper_DribbbleAPIBaseURLString = @"https://api.dribbble.com/v1/";
static NSString * const key_DCHDribbbleAPIHelper_DribbbleAuthorizationToken = @"32dd4a30472b6f4b9f7e53520319262c36dcce8e2e3b0ae73315755e0b4dac1d";

@interface DCHDribbbleAPIHelper ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionMgr;

@end

@implementation DCHDribbbleAPIHelper

DCH_DEFINE_SINGLETON_FOR_CLASS(DCHDribbbleAPIHelper)

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sessionMgr = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:key_DCHDribbbleAPIHelper_DribbbleAPIBaseURLString]];
        [self.sessionMgr.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", key_DCHDribbbleAPIHelper_DribbbleAuthorizationToken] forHTTPHeaderField:@"Authorization"];
        self.sessionMgr.responseSerializer = [DCHJSONResponseSerializer serializer];
    }
    return self;
}

- (NSURLSessionDataTask *)listShots:(DCHDribbbleListShotsRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion {
    NSURLSessionDataTask *result = nil;
    do {
        if (DCH_IsEmpty(req)) {
            break;
        }
        result = [self.sessionMgr GET:[req endpoint] parameters:[req parameters] success:^(NSURLSessionDataTask *task, id responseObject) {
            do {
                if (completion) {
                    if (!DCH_IsEmpty(responseObject) && [responseObject isKindOfClass:[NSDictionary class]]) {
                        DCHDribbbleShotListModel *listModel = [[DCHDribbbleShotListModel alloc] initWithDictionary:responseObject error:nil];
                        completion(listModel, nil);
                    } else {
                        completion(nil, [NSError errorWithDomain:str_DCHDribbbleErrorDomain code:DCHDribbbleErrorCode_responseObjectError userInfo:nil]);
                    }
                }
            } while (NO);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            do {
                if (completion) {
                    completion(nil, error);
                }
            } while (NO);
        }];
    } while (NO);
    return result;
}

- (NSURLSessionDataTask *)getOneShot:(DCHDribbbleGetOneShotRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion {
    NSURLSessionDataTask *result = nil;
    do {
        if (DCH_IsEmpty(req)) {
            break;
        }
        result = [self.sessionMgr GET:[req endpoint] parameters:[req parameters] success:^(NSURLSessionDataTask *task, id responseObject) {
            do {
                if (completion) {
                    if (!DCH_IsEmpty(responseObject) && [responseObject isKindOfClass:[NSDictionary class]]) {
                        DCHDribbbleShotModel *shotModel = [[DCHDribbbleShotModel alloc] initWithDictionary:responseObject error:nil];
                        completion(shotModel, nil);
                    } else {
                        completion(nil, [NSError errorWithDomain:str_DCHDribbbleErrorDomain code:DCHDribbbleErrorCode_responseObjectError userInfo:nil]);
                    }
                }
            } while (NO);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            do {
                if (completion) {
                    completion(nil, error);
                }
            } while (NO);
        }];
    } while (NO);
    return result;
}

- (NSURLSessionDataTask *)listCommentsForOneShot:(DCHDribbbleListCommentsForOneShotRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion {
    NSURLSessionDataTask *result = nil;
    do {
        if (DCH_IsEmpty(req)) {
            break;
        }
        result = [self.sessionMgr GET:[req endpoint] parameters:[req parameters] success:^(NSURLSessionDataTask *task, id responseObject) {
            do {
                if (completion) {
                    if (!DCH_IsEmpty(responseObject) && [responseObject isKindOfClass:[NSDictionary class]]) {
                        DCHDribbbleCommentListModel *commentListModel = [[DCHDribbbleCommentListModel alloc] initWithDictionary:responseObject error:nil];
                        completion(commentListModel, nil);
                    } else {
                        completion(nil, [NSError errorWithDomain:str_DCHDribbbleErrorDomain code:DCHDribbbleErrorCode_responseObjectError userInfo:nil]);
                    }
                }
            } while (NO);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            do {
                if (completion) {
                    completion(nil, error);
                }
            } while (NO);
        }];
    } while (NO);
    return result;
}

- (NSURLSessionDataTask *)queryOneUser:(DCHDribbbleQueryOneUserRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion {
    NSURLSessionDataTask *result = nil;
    do {
        if (DCH_IsEmpty(req)) {
            break;
        }
        result = [self.sessionMgr GET:[req endpoint] parameters:[req parameters] success:^(NSURLSessionDataTask *task, id responseObject) {
            do {
                if (completion) {
                    if (!DCH_IsEmpty(responseObject) && [responseObject isKindOfClass:[NSDictionary class]]) {
                        DCHDribbbleUserModel *userModel = [[DCHDribbbleUserModel alloc] initWithDictionary:responseObject error:nil];
                        completion(userModel, nil);
                    } else {
                        completion(nil, [NSError errorWithDomain:str_DCHDribbbleErrorDomain code:DCHDribbbleErrorCode_responseObjectError userInfo:nil]);
                    }
                }
            } while (NO);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            do {
                if (completion) {
                    completion(nil, error);
                }
            } while (NO);
        }];
    } while (NO);
    return result;
}

- (NSURLSessionDataTask *)listUserShots:(DCHDribbbleListUserShotsRequest *)req withCompletion:(DCHDribbbleAPICompletion)completion {
    NSURLSessionDataTask *result = nil;
    do {
        if (DCH_IsEmpty(req)) {
            break;
        }
        result = [self.sessionMgr GET:[req endpoint] parameters:[req parameters] success:^(NSURLSessionDataTask *task, id responseObject) {
            do {
                if (completion) {
                    if (!DCH_IsEmpty(responseObject) && [responseObject isKindOfClass:[NSDictionary class]]) {
                        DCHDribbbleShotListModel *listModel = [[DCHDribbbleShotListModel alloc] initWithDictionary:responseObject error:nil];
                        completion(listModel, nil);
                    } else {
                        completion(nil, [NSError errorWithDomain:str_DCHDribbbleErrorDomain code:DCHDribbbleErrorCode_responseObjectError userInfo:nil]);
                    }
                }
            } while (NO);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            do {
                if (completion) {
                    completion(nil, error);
                }
            } while (NO);
        }];
    } while (NO);
    return result;
}

@end
