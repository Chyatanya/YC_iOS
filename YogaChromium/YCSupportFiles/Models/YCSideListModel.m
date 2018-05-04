//
//  YCSideListModel.m
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCSideListModel.h"

@implementation YCSideListModel
-(instancetype)init{
    self.dataPath = @"";
    self.title = @"";
    return self;
}
-(instancetype)initWithSideListData:(NSDictionary *)sideListData{
    if ([sideListData isKindOfClass:[NSDictionary class]]) {
        self.dataPath = [[NSString getStringWithoutNull:[sideListData valueForKey:@"data_path"]] stringByReplacingOccurrencesOfString:@"screens/" withString:@""];
        self.title = [NSString getStringWithoutNull:[sideListData valueForKey:@"title"]];
    }
    return self;
}
@end
