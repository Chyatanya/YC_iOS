//
//  YCDetailModel.h
//  YogaChromium
//
//  Created by chyatanya on 02/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCDetailModel : NSObject
@property (nonatomic, retain) NSString* content;
@property (nonatomic, retain) NSString* heading;
@property (nonatomic, retain) NSString* heading_color;
@property (nonatomic, retain) NSString* type;
-(instancetype)initWithDetailInfo:(NSDictionary *)info;
-(instancetype)init;
@end
