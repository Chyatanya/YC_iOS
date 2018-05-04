//
//  YCMainDataContentmodel.m
//  YogaChromium
//
//  Created by chyatanya on 03/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainDataContentmodel.h"

@implementation YCMainDataContentmodel
-(instancetype)initWithMainDataContent:(NSDictionary *)mainDataContent{
    if ([mainDataContent isKindOfClass:[NSDictionary class]]) {
        NSMutableArray* responseArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSDictionary* listDict in [mainDataContent valueForKey:@"content"]) {
            YCMainDataListContentModel * obj = [[YCMainDataListContentModel alloc]initWithMainDataListContent:listDict];
            [responseArray addObject:obj];
        }
        self.content = [[NSArray alloc] initWithArray:responseArray];
    } else {
        self.content = [NSArray new];
    }
    self.background = [NSString getStringWithoutNull:[mainDataContent valueForKey:@"background"]];
    self.name = [NSString getStringWithoutNull:[mainDataContent valueForKey:@"name"]];
    return self;
}
-(instancetype)init {
    return self;
}
@end
