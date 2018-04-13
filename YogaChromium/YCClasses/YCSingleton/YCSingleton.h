//
//  YCSingleton.h
//  YogaChromium
//
//  Created by chyatanya on 12/04/18.
//  Copyright © 2018 chyatanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FirebaseDatabase/FirebaseDatabase.h>

@interface YCSingleton : NSObject {
    
}
@property(nonatomic, strong)FIRDatabaseReference* fireDatabaseRef;
+ (id)sharedInstance;
-(void)getDataFromChild:(NSString *)childName withObserver:(FIRDataEventType)eventType completionBlock:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure;
-(void)removerAllObservers;
- (BOOL)isInternetConnectionAvailable;
@end
