//
//  DCHDribbbleShotCollectionViewCell.h
//  FireBalllooon
//
//  Created by Derek Chen on 8/13/15.
//  Copyright (c) 2015 CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCHShotUIModel;

@interface DCHDribbbleShotCollectionViewCell : UICollectionViewCell

- (void)updateWithUIModel:(DCHShotUIModel *)uiModel;

@end
