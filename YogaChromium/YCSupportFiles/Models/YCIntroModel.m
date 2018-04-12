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
    self.contentString = @"";
    self.dataPathString = @"";
    self.headingString = @"";
    self.typeString = @"";
    self.urlString = @"";
    return self;
}
-(instancetype)init:(NSDictionary *)introData{
    if ([introData isKindOfClass:[NSDictionary class]]) {
        self.contentString = [NSString getStringWithoutNull:[introData valueForKey:@"content"]];
        self.dataPathString = [NSString getStringWithoutNull:[introData valueForKey:@"data_path"]];
        self.headingString = [NSString getStringWithoutNull:[introData valueForKey:@"heading"]];
        self.typeString = [NSString getStringWithoutNull:[introData valueForKey:@"type"]];
        self.urlString = [NSString getStringWithoutNull:[introData valueForKey:@"url"]];
    }
    return self;
}
@end
