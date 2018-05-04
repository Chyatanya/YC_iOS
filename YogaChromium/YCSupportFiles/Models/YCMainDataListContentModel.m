//
//  YCMainDataListContentModel.m
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCMainDataListContentModel.h"

@implementation YCMainDataListContentModel
-(instancetype)init {
    return self;
}
-(instancetype)initWithMainDataListContent:(NSDictionary *)mainDataContent{
    if ([mainDataContent isKindOfClass:[NSDictionary class]]) {
        self.content = [NSString getStringWithoutNull:[mainDataContent valueForKey:@"content"]];
        self.heading = [NSString getStringWithoutNull:[mainDataContent valueForKey:@"heading"]];
        self.heading_color = [NSString getStringWithoutNull:[mainDataContent valueForKey:@"heading_color"]];
        self.type = [NSString getStringWithoutNull:[mainDataContent valueForKey:@"type"]];
        if (![[mainDataContent valueForKey:@"videos"] isEqual:NULL]) {
            NSMutableArray * videoArray = [[NSMutableArray alloc] initWithCapacity:0];
            for (NSDictionary* videoDict in [mainDataContent valueForKey:@"videos"]) {
                YCVideoModel * videoObj = [[YCVideoModel alloc] initWithVideoDetails:videoDict];
                [videoArray addObject:videoObj];
            }
            self.videos = [[NSArray alloc] initWithArray:videoArray];
        } else {
            self.videos = [NSArray new];
        }
    }
    return self;
}
@end
