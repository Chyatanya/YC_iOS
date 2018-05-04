//
//  YCMainDataListModel.m
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainDataListModel.h"

@implementation YCMainDataListModel
-(instancetype)init {
    return self;
}
-(instancetype)initWithMainDataList:(NSArray *)mainDataList {
    if ([mainDataList isKindOfClass:[NSArray class]]) {
        NSMutableArray* responseArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary* listDict in mainDataList) {
            YCMainDataContentmodel * obj = [[YCMainDataContentmodel alloc]initWithMainDataContent:listDict];
            [responseArray addObject:obj];
        }
        self.content = [[NSArray alloc] initWithArray:responseArray];
    } else {
        self.content = [NSArray new];
    }
    return self;
}
@end
