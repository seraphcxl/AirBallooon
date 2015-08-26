//
//  DCHDribbbleTeamModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/4/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHOptionalJSONModel.h"

@interface DCHDribbbleTeamModel : DCHOptionalJSONModel

@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, assign) NSUInteger followers_count;
@property (nonatomic, assign) NSUInteger followings_count;
@property (nonatomic, assign) NSUInteger likes_count;
@property (nonatomic, assign) NSUInteger likes_received_count;
@property (nonatomic, assign) NSUInteger shots_count;
@property (nonatomic, strong) NSString *type;

@end
