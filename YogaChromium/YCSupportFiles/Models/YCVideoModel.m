//
//  YCVideoModel.m
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCVideoModel.h"

@implementation YCVideoModel
-(instancetype)init {
    return self;
}
-(instancetype)initWithVideoDetails:(NSDictionary *)video{
    if ([video isKindOfClass:[NSDictionary class]]) {
        self.thumb = [NSString getStringWithoutNull:[video valueForKey:@"thumb"]];
        self.url = [NSString getStringWithoutNull:[video valueForKey:@"url"]];
    }
    return self;
}
@end
