//
//  DCHShotUIModel.m
//  FireBalllooon
//
//  Created by Derek Chen on 8/8/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHShotUIModel.h"
#import "DCHShotImageUIModel.h"
#import "DCHTeamUIModel.h"
#import "DCHUserUIModel.h"
#import "DCHDribbbleShotModel.h"
#import "DCHDribbbleShotImagesModel.h"
#import "DCHDribbbleTeamModel.h"
#import "DCHDribbbleUserModel.h"
#import <Tourbillon/DCHTourbillon.h>

@implementation DCHShotUIModel

- (instancetype)initWithShotModel:(DCHDribbbleShotModel *)shotModel {
    if (DCH_IsEmpty(shotModel)) {
        return nil;
    }
    self = [self init];
    if (self) {
        self.shotModel = shotModel;
        self.imageUIModel = [[DCHShotImageUIModel alloc] init];
        self.imageUIModel.uuid = shotModel.id;
        
        self.userUIModel = [[DCHUserUIModel alloc] init];
        self.userUIModel.userModel = shotModel.user;
        self.userUIModel.uuid = shotModel.user.id;
        
        self.teamUIModel = [[DCHTeamUIModel alloc] init];
        self.teamUIModel.teamModel = shotModel.team;
        self.teamUIModel.uuid = shotModel.team.id;
    }
    return self;
}

@end
