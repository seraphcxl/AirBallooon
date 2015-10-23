//
//  DCHDribbbleShotListViewModel.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/6/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHDribbbleShotListViewModel.h"
#import "DCHDribbbleAPIHelper.h"
#import "DCHDribbbleRequest.h"
#import <DCHTourbillon.h>
#import "DCHDribbbleShotListModel.h"
#import "DCHDribbbleShotModel.h"
#import "DCHDribbbleTeamModel.h"
#import "DCHDribbbleUserModel.h"
#import "DCHShotUIModel.h"
#import "DCHTeamUIModel.h"
#import "DCHUserUIModel.h"
#import "DCHShotImageUIModel.h"

@interface DCHDribbbleShotListViewModel ()

@property (nonatomic, strong) DCHMVVMCommand *listShotsCmd;

@property (nonatomic, strong) NSArray *shotList;

@end

@implementation DCHDribbbleShotListViewModel

- (void)setupCommands {
    do {
        self.listShotsCmd = [[DCHMVVMCommand alloc] initWithOperation:^id(NSDictionary *buildinParams, NSDictionary *inputParams, DCHMVVMCommandCompletion completion) {
            id result = nil;
            do {
                if (DCH_IsEmpty(inputParams)) {
                    break;
                }
                DCHDribbbleListShotsRequest *listShotsReq = [inputParams dch_safe_objectForKey:str_DCHDribbbleListShotsRequest];
                if (DCH_IsEmpty(listShotsReq)) {
                    break;
                }
                result = [[DCHDribbbleAPIHelper sharedDCHDribbbleAPIHelper] listShots:listShotsReq withCompletion:^(id content, NSError *error) {
                    if (completion) {
                        completion(content, error);
                    }
                }];
            } while (NO);
            return result;
        } callback:^(DCHMVVMCommand *command, DCHMVVMCommandResult *result) {
            do {
                DCHDribbbleShotListModel *listModel = result.content;
                if (DCH_IsEmpty(listModel)) {
                    break;
                }
                NSMutableArray *tmpAry = [NSMutableArray arrayWithCapacity:listModel.kJSONRootArray.count];
                for (DCHDribbbleShotModel *shotModel in listModel.kJSONRootArray) {
                    DCHShotUIModel *shotUIModel = [[DCHShotUIModel alloc] initWithShotModel:shotModel];
                    [tmpAry dch_safe_addObject:shotUIModel];
                }
                self.shotList = tmpAry;
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
