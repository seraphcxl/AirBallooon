//
//  DCHDribbbleShotImagesModel.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/4/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import "DCHOptionalJSONModel.h"

@interface DCHDribbbleShotImagesModel : DCHOptionalJSONModel

@property (nonatomic, strong) NSString *hidpi;
@property (nonatomic, strong) NSString *normal;
@property (nonatomic, strong) NSString *teaser;

@end
