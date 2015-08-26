//
//  DCHDribbbleCommentListModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/12/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHOptionalJSONModel.h"
#import "DCHDribbbleCommentModel.h"
#import "DCHJSONResponseSerializer.h"

@protocol DCHDribbbleCommentListModel <NSObject> @end

@interface DCHDribbbleCommentListModel : DCHOptionalJSONModel

@property (strong, nonatomic) NSArray<DCHDribbbleCommentModel>* kJSONRootArray;

@end
