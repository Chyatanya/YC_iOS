//
//  YCMainDataListContentModel.h
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCVideoModel.h"

@interface YCMainDataListContentModel : NSObject
@property (nonatomic, retain) NSString* content;
@property (nonatomic, retain) NSString* heading;
@property (nonatomic, retain) NSString* sub_heading;
@property (nonatomic, retain) NSString* heading_color;
@property (nonatomic, retain) NSString* type;
@property (nonatomic, retain) NSArray* videos;
-(instancetype)initWithMainDataListContent:(NSDictionary *)mainDataContent;
-(instancetype)init;
@end
