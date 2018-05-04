//
//  YCDetailModel.m
//  YogaChromium
//
//  Created by chyatanya on 02/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCDetailModel.h"

@implementation YCDetailModel
-(instancetype)init {
    return self;
}
-(instancetype)initWithDetailInfo:(NSDictionary *)info{
    if ([info isKindOfClass:[NSDictionary class]]) {
        self.content = [NSString getStringWithoutNull:[info valueForKey:@"content"]];
        self.heading = [NSString getStringWithoutNull:[info valueForKey:@"heading"]];        
        if ([info valueForKey:@"heading_color"]) {
           self.heading_color = [NSString getStringWithoutNull:[info valueForKey:@"heading_color"]];
            self.heading_color = [self.heading_color isEqualToString:@""] ? @"#000000" : self.heading_color;
        } else {
            self.heading_color = @"#000000";
        }
        self.type = [NSString getStringWithoutNull:[info valueForKey:@"type"]];
    }
    return self;
}
@end
