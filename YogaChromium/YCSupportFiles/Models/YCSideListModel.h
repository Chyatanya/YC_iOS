//
//  YCSideListModel.h
//  YogaChromium
//
//  Created by chyatanya on 24/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCSideListModel : NSObject
@property(nonatomic, strong) NSString * dataPath;
@property(nonatomic, strong) NSString * title;
-(instancetype)initWithSideListData:(NSDictionary *)introData;
-(instancetype)init;
@end
