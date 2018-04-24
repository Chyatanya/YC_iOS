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
-(instancetype)initWithSideListData:(NSDictionary *)introData{
    if ([introData isKindOfClass:[NSDictionary class]]) {
        self.dataPath = [[NSString getStringWithoutNull:[introData valueForKey:@"data_path"]] stringByReplacingOccurrencesOfString:@"screens/" withString:@""];
        self.title = [NSString getStringWithoutNull:[introData valueForKey:@"title"]];
    }
    return self;
}
@end
