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
        self.listShotsCmd = [[DCHMVVMCommand alloc] initWithOperation:^(NSDictionary *buildinParams, NSArray *inputParams, DCHMVVMCommandCompletion completion) {
            do {
                if (DCH_IsEmpty(inputParams)) {
                    break;
                }
                DCHDribbbleListShotsRequest *listShotsReq = [inputParams dch_safe_objectAtIndex:0];
                if (DCH_IsEmpty(listShotsReq)) {
                    break;
                }
                [[DCHDribbbleAPIHelper sharedDCHDribbbleAPIHelper] listShots:listShotsReq withCompletion:^(id content, NSError *error) {
                    if (completion) {
                        completion(content, error);
                    }
                }];
            } while (NO);
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
        }];
    } while (NO);
}

@end
