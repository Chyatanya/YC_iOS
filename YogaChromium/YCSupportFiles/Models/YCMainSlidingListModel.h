//
//  YCMainSlidingListModel.h
//  YogaChromium
//
//  Created by chyatanya on 27/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCMainSlidingListModel : NSObject
@property (nonatomic, retain) NSArray * slideListArray;
-(instancetype)initWithSideListData:(NSArray *)slideListData;
-(instancetype)init;
@end
