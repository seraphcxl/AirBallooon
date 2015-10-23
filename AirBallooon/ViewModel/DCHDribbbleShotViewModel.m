//
//  DCHDribbbleShotViewModel.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/6/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHDribbbleShotViewModel.h"
#import "DCHDribbbleAPIHelper.h"
#import "DCHDribbbleRequest.h"
#import <DCHTourbillon.h>
#import "DCHShotUIModel.h"
#import "DCHDribbbleShotModel.h"
#import "DCHDribbbleUserModel.h"
#import "DCHDribbbleTeamModel.h"
#import "DCHUserUIModel.h"
#import "DCHShotImageUIModel.h"
#import "DCHTeamUIModel.h"
#import "DCHCommetUIModel.h"
#import "DCHDribbbleCommentModel.h"
#import "DCHDribbbleCommentListModel.h"

@interface DCHDribbbleShotViewModel ()

@property (nonatomic, strong) DCHMVVMCommand *getOneShotCmd;
@property (nonatomic, strong) DCHMVVMCommand *listCommentsForOneShotCmd;

@property (nonatomic, strong) DCHShotUIModel *shotUIModel;
@property (nonatomic, strong) NSArray *commentList;

@end

@implementation DCHDribbbleShotViewModel

- (instancetype)initWithShotModel:(DCHDribbbleShotModel *)shotModel {
    if (DCH_IsEmpty(shotModel)) {
        return nil;
    }
    self = [self init];
    if (self) {
        self.shotUIModel = [[DCHShotUIModel alloc] initWithShotModel:shotModel];
    }
    return self;
}

- (void)setupCommands {
    do {
        self.getOneShotCmd = [[DCHMVVMCommand alloc] initWithOperation:^id(NSDictionary *buildinParams, NSDictionary *inputParams, DCHMVVMCommandCompletion completion) {
            id result = nil;
            do {
                if (DCH_IsEmpty(inputParams)) {
                    break;
                }
                DCHDribbbleGetOneShotRequest *getOneShotReq = [inputParams dch_safe_objectForKey:str_DCHDribbbleGetOneShotRequest];
                if (DCH_IsEmpty(getOneShotReq)) {
                    break;
                }
                result = [[DCHDribbbleAPIHelper sharedDCHDribbbleAPIHelper] getOneShot:getOneShotReq withCompletion:^(id content, NSError *error) {
                    if (completion) {
                        completion(content, error);
                    }
                }];
            } while (NO);
            return result;
        } callback:^(DCHMVVMCommand *command, DCHMVVMCommandResult *result) {
            do {
                DCHDribbbleShotModel *shotModel = result.content;
                if (DCH_IsEmpty(shotModel)) {
                    break;
                }
                self.shotUIModel = [[DCHShotUIModel alloc] initWithShotModel:shotModel];
            } while (NO);
        } cancelation:^(id storeContent) {
            do {
                if (DCH_IsEmpty(storeContent)) {
                    break;
                }
                if ([storeContent isKindOfClass:[NSURLSessionTask class]]) {
                    NSURLSessionTask *task = (NSURLSessionTask *)storeContent;
                    [task cancel];
                }
            } while (NO);
        }];
        
        self.listCommentsForOneShotCmd = [[DCHMVVMCommand alloc] initWithOperation:^id(NSDictionary *buildinParams, NSDictionary *inputParams, DCHMVVMCommandCompletion completion) {
            id result = nil;
            do {
                if (DCH_IsEmpty(inputParams)) {
                    break;
                }
                DCHDribbbleListCommentsForOneShotRequest *listCommentsForOneShotReq = [inputParams dch_safe_objectForKey:str_DCHDribbbleListCommentsForOneShotRequest];
                if (DCH_IsEmpty(listCommentsForOneShotReq)) {
                    break;
                }
                result = [[DCHDribbbleAPIHelper sharedDCHDribbbleAPIHelper] listCommentsForOneShot:listCommentsForOneShotReq withCompletion:^(id content, NSError *error) {
                    if (completion) {
                        completion(content, error);
                    }
                }];
            } while (NO);
            return result;
        } callback:^(DCHMVVMCommand *command, DCHMVVMCommandResult *result) {
            do {
                DCHDribbbleCommentListModel *commentListModel = result.content;
                if (DCH_IsEmpty(commentListModel)) {
                    break;
                }
                NSMutableArray *tmpAry = [NSMutableArray arrayWithCapacity:commentListModel.kJSONRootArray.count];
                for (DCHDribbbleCommentModel *commentModel in commentListModel.kJSONRootArray) {
                    DCHCommetUIModel *commentUIModel = [[DCHCommetUIModel alloc] initWithCommentModel:commentModel];
                    [tmpAry dch_safe_addObject:commentUIModel];
                }
                self.commentList = tmpAry;
            } while (NO);
        } cancelation:^(id storeContent) {
            do {
                if (DCH_IsEmpty(storeContent)) {
                    break;
                }
                if ([storeContent isKindOfClass:[NSURLSessionTask class]]) {
                    NSURLSessionTask *task = (NSURLSessionTask *)storeContent;
                    [task cancel];
                }
            } while (NO);
        }];
    } while (NO);
}

@end
