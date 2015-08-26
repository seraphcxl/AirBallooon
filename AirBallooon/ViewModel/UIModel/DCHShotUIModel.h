//
//  DCHShotUIModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/8/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCHDribbbleShotModel;
@class DCHShotImageUIModel;
@class DCHTeamUIModel;
@class DCHUserUIModel;

@interface DCHShotUIModel : NSObject

@property (nonatomic, strong) DCHDribbbleShotModel *shotModel;
@property (nonatomic, strong) DCHShotImageUIModel *imageUIModel;
@property (nonatomic, strong) DCHUserUIModel *userUIModel;
@property (nonatomic, strong) DCHTeamUIModel *teamUIModel;

- (instancetype)initWithShotModel:(DCHDribbbleShotModel *)shotModel;

@end
