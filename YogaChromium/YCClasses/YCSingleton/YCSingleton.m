//
//  YCSingleton.m
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import "YCSingleton.h"
#import "Reachability.h"

@implementation YCSingleton
+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
-(id)init
{
    /* Write all initialzed values */
    self.fireDatabaseRef = [[FIRDatabase database] referenceWithPath:parent];
    return self;
}

-(void)getDataFromChild:(NSString *)childName withObserver:(FIRDataEventType)eventType completionBlock:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure
{
    [[self.fireDatabaseRef child:childName] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot){
        if (snapshot.hasChildren) {
            id child = snapshot.value;
            if ([[child class] isKindOfClass:[NSDictionary class]]) {
                NSDictionary *responseDict = child;
                success(responseDict);
                return;
            } else if ([snapshot.value isKindOfClass:[NSArray class]]) {
                NSDictionary * res = [NSDictionary dictionaryWithObjectsAndKeys:child,@"response" ,nil];
                success(res);
                return;
            }
            success(child);
        } else {
            NSError *error = [NSError errorWithDomain:@"some_domain"
                                               code:100
                                           userInfo:@{ NSLocalizedDescriptionKey:@"Something went wrong" }];

            failure(error);
        }
    }];
}
-(void)removeFireBaseObservers {
    [self.fireDatabaseRef removeAllObservers];
}
- (BOOL)isInternetConnectionAvailable
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus netWorkStatus = [reachability currentReachabilityStatus] ;
    if (netWorkStatus == ReachableViaWWAN || netWorkStatus == ReachableViaWiFi) {
        return YES;
    } else {
        return NO;
    }
    return NO;
}

@end
