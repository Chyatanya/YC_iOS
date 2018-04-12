//
//  NSString+YCString.h
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YCString)
-(BOOL)isYCStringEmpty;
-(NSString *)removeWhiteSpaces;
+(NSString *)getStringWithoutNull:(NSString *)valueString;
@end
