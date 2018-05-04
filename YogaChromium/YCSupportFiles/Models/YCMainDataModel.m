//
//  YCMainDataModel.m
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainDataModel.h"

@implementation YCMainDataModel
-(instancetype)init{
    self.content = @"";
    self.heading = @"";
    self.sub_heading = @"";
    self.list = [[YCMainDataListModel alloc]init];
    return self;
}
-(instancetype)initWithMainData:(NSDictionary *)mainData{
    if ([mainData isKindOfClass:[NSDictionary class]]) {
        self.content = [NSString getStringWithoutNull:[mainData valueForKey:@"content"]];
        self.heading = [NSString getStringWithoutNull:[mainData valueForKey:@"heading"]] ;
        self.sub_heading = [NSString getStringWithoutNull:[mainData valueForKey:@"sub_heading"]];
        self.list = [[YCMainDataListModel alloc] initWithMainDataList:[mainData valueForKey:@"list"]];
    }
    return self;
}
@end
