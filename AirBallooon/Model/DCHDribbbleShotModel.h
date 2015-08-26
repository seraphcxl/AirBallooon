//
//  DCHDribbbleShotModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/4/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHOptionalJSONModel.h"

@class DCHDribbbleShotImagesModel;
@class DCHDribbbleUserModel;
@class DCHDribbbleTeamModel;

@protocol DCHDribbbleShotModel <NSObject> @end

@interface DCHDribbbleShotModel : DCHOptionalJSONModel

@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, strong) DCHDribbbleShotImagesModel *images;
@property (nonatomic, assign) NSUInteger views_count;
@property (nonatomic, assign) NSUInteger likes_count;
@property (nonatomic, assign) NSUInteger comments_count;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, strong) DCHDribbbleUserModel *user;
@property (nonatomic, strong) DCHDribbbleTeamModel *team;

@end
