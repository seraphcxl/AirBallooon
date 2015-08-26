//
//  DCHCommetUIModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/12/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCHDribbbleCommentModel;
@class DCHUserUIModel;

@interface DCHCommetUIModel : NSObject

@property (nonatomic, strong) DCHDribbbleCommentModel *commentModel;
@property (nonatomic, strong) DCHUserUIModel *userUIModel;

- (instancetype)initWithCommentModel:(DCHDribbbleCommentModel *)commentModel;

@end
