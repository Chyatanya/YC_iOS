//
//  YCIntroModel.h
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCIntroModel : NSObject{
    
}
@property(nonatomic, strong) NSString * content;
@property(nonatomic, strong) NSString * data_path;
@property(nonatomic, strong) NSString * heading;
@property(nonatomic, strong) NSString * type;
@property(nonatomic, strong) NSString * url;
-(instancetype)initWithIntroData:(NSDictionary *)introData;
-(instancetype)init;
@end
