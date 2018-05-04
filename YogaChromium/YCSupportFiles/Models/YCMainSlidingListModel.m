//
//  YCMainSlidingListModel.m
//  YogaChromium
//
//  Created by chyatanya on 27/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainSlidingListModel.h"

@implementation YCMainSlidingListModel
-(instancetype)init{
    self.slideListArray = [NSArray new];
    return self;
}
-(instancetype)initWithSideListData:(NSArray *)slideListData{
    if ([slideListData isKindOfClass:[NSArray class]]) {
        NSMutableArray * list = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i< slideListData.count; i++) {
            if (![[slideListData objectAtIndex:i] isKindOfClass:[NSNull class]]) {
                [list addObject:[slideListData objectAtIndex:i]];
            }
        }
        self.slideListArray = [[NSArray alloc] initWithArray:list];
    }
    return self;
}
@end
