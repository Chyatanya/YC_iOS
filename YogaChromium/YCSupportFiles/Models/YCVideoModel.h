//
//  YCVideoModel.h
//  YogaChromium
//
//  Created by chyatanya on 01/05/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCVideoModel : NSObject
@property (nonatomic, retain) NSString* thumb;
@property (nonatomic, retain) NSString* url;
-(instancetype)initWithVideoDetails:(NSDictionary *)video;
-(instancetype)init;
@end
