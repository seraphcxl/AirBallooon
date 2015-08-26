//
//  DCHDribbbleCommentModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/12/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHOptionalJSONModel.h"

@class DCHDribbbleUserModel;

@protocol DCHDribbbleCommentModel <NSObject> @end

@interface DCHDribbbleCommentModel : DCHOptionalJSONModel

@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) NSUInteger likes_count;
@property (nonatomic, strong) NSString *likes_url;
@property (nonatomic, assign) NSString *created_at;
@property (nonatomic, strong) NSString *updated_at;
@property (nonatomic, strong) DCHDribbbleUserModel *user;


@end
