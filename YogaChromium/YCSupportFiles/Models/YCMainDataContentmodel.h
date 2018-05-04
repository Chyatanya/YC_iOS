//
//  YCMainDataContentmodel.h
//  YogaChromium
//
//  Created by chyatanya on 03/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCMainDataListContentModel.h"

@interface YCMainDataContentmodel : NSObject
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* background;
@property (nonatomic, retain) NSArray* content;
-(instancetype)initWithMainDataContent:(NSDictionary *)mainDataContent;
-(instancetype)init;
@end
