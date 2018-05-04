//
//  YCMainDataModel.h
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCMainDataListModel.h"

@interface YCMainDataModel : NSObject
@property (nonatomic, retain) NSString* content;
@property (nonatomic, retain) NSString* heading;
@property (nonatomic, retain) NSString* sub_heading;
@property (nonatomic, retain) YCMainDataListModel* list;
-(instancetype)initWithMainData:(NSDictionary* )mainData;
-(instancetype)init;
@end
