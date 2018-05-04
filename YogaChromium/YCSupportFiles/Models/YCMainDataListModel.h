//
//  YCMainDataListModel.h
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCMainDataContentmodel.h"
@interface YCMainDataListModel : NSObject
@property (nonatomic, retain) NSArray* content;
-(instancetype)initWithMainDataList:(NSArray *)mainDataList;
-(instancetype)init;
@end
