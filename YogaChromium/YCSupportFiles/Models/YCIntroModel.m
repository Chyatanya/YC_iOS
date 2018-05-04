//
//  YCIntroModel.m
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCIntroModel.h"

@implementation YCIntroModel
-(instancetype)init{
    self.content = @"";
    self.data_path = @"";
    self.heading = @"";
    self.type = @"";
    self.url = @"";
    return self;
}
-(instancetype)initWithIntroData:(NSDictionary *)introData{
    if ([introData isKindOfClass:[NSDictionary class]]) {
        self.content = [NSString getStringWithoutNull:[introData valueForKey:@"content"]];
        self.data_path = [[NSString getStringWithoutNull:[introData valueForKey:@"data_path"]] stringByReplacingOccurrencesOfString:@"screens/" withString:@""];
        self.heading = [NSString getStringWithoutNull:[introData valueForKey:@"heading"]];
        self.type = [NSString getStringWithoutNull:[introData valueForKey:@"type"]];
        self.url = [NSString getStringWithoutNull:[introData valueForKey:@"url"]];
    }
    return self;
}
@end
