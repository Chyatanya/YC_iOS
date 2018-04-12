//
//  APIWrapper.m
//  RightLink
//
//  Created by Veeru on 29/06/15.
//  Copyright (c) 2015 Northalley. All rights reserved.
//

#import "APIWrapper.h"
#import "HFSingleton.h"
#define TimeStamp [NSString stringWithFormat:@"%lld",(long long)[[NSDate date] timeIntervalSince1970] * 1000]


//https://github.com/AFNetworking/AFNetworking/wiki/AFNetworking-3.0-Migration-Guide


static NSString* const kBaseUrlStr = Homeframe_baseURL;
static NSString* const KGoogleApiCheckin = @"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=1000&sensor=false&key=AIzaSyAB-dwfPHYylEYEUn0Bg74lB1ogi-jCKBs";
//oauth/access_token

//http://54.187.80.135:8044/User/ImageUploads

@implementation APIWrapper

+ (APIWrapper *)hFSharedHttpClient
{
    static APIWrapper *sharedPortfolioHttpClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sharedPortfolioHttpClient = [[APIWrapper alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlStr] sessionConfiguration:configuration];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
    });
    return sharedPortfolioHttpClient;
}


#pragma mark arguments...

//Login Service...

- (void)userSignUpParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    
   self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    
    [self POST:@"api/user/login" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];

    
    
}

#pragma mark oauth...

//Get acessSignedToken...

- (void)acessSignedTokenGanarateParams:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
   
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
   //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
        [self POST:@"oauth/access_token" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];

}

//Get UnsignedAccessToken...

- (void)acessUnsignedTokenGanarateParams:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
   
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];

    [self POST:@"oauth/access_token" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];

}


           ///////////////////////////////////////////////////////////////
#pragma mark Data...

//SendSms...

- (void)sendSmsParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self POST:@"api/data/sms" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
    
}

//GetCountriesList...

- (void)countriesListParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:@"api/data/countries" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

//GetStatesList...

- (void)statesListParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken searchStr:(NSString *)searchStr pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:@"api/data/states" parameters:@{@"search":searchStr,@"page":pageStr} progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
    

}

//GetCityList...

- (void)cityListParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken searchStr:(NSString *)searchStr pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    [self GET:@"api/data/cities" parameters:@{@"search":searchStr,@"page":pageStr}  progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//GetPublicProfileInfo...

- (void)getPublicProfileInfoParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken friendID:(NSString *)friendIDStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
   
    [self GET:[NSString stringWithFormat:@"api/user/%@/%@",[[HFSingleton sharedInstance]User_idStr],friendIDStr] parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}


//GetUniversitiesList...

- (void)universitiesListParams:(NSDictionary *)parameters searchStr:(NSString *)searchStr pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:@"api/data/universities" parameters:@{@"search":searchStr,@"page":pageNo} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//GetSchoolsList...

- (void)schoolsListParams:(NSDictionary *)parameters searchStr:(NSString *)searchStr pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:@"api/data/schools" parameters:@{@"search":searchStr,@"page":pageNo} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}


//GetCommunityDetailsService...

- (void)getCommunityDetailsParams:(NSDictionary *)parameters communityId:(NSString *)communityIdStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:[NSString stringWithFormat:@"api/data/community/%@", communityIdStr] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

          /////////////////////////////////////////////////////////////////

#pragma mark User...

//Verify UserName...

- (void)verifyUsernameParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self POST:@"api/user/verify_username" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
    
}

//Verify Email...

- (void)verifyEmailParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:@"api/user/verify_email" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
    
}
//Verify PhoneNumber(verify_phone)...
- (void)verifyPhoneNumberParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure {
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:@"api/user/verify_phone" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

//Signup...

- (void)signUpParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self POST:@"api/user" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
    
}


//InviteUserFriends...

- (void)inviteUserFriendsParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/user/%@/invite",[[HFSingleton sharedInstance]User_idStr]] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];

}

//ForgotPassword...

- (void)forgotPasswordParams:(NSDictionary *)parameters typeForgot:(NSString *)type accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/user/forgot/%@",type] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
}

//Forgot Username service...

- (void)forgotUsernameParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self POST:@"api/user/forgot/username" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
}

//VerifyPasswordResetlink...

- (void)verifyPasswordResetlinkParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
   // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:@"api/user/verify_password/:resetId" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
}

//ResetPassword...

- (void)resetPasswordResetlinkParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/user/%@/reset", userID] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
}

//Get MyProfile Info...

- (void)getProfileInfoParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:[NSString stringWithFormat:@"api/user/%@",[parameters valueForKey:@"userID"]] parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];

}

//Delete User...

- (void)deleteUser:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *userid = [NSString stringWithFormat:@"api/user/%@",userId];
    
    [self DELETE:userid parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}



//Update User Profile API...

- (void)userEditProfile:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *userid = [NSString stringWithFormat:@"api/user/%@",userId];
    
    [self PUT:userid parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

//User Logout...

- (void)userlogoutParams:(NSDictionary *)parameters userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self POST:[NSString stringWithFormat:@"api/user/%@/logout",userIDStr] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         
         failure(task, error);
     }];
}

//Get Notifications...

- (void)getNotificationsParams:(NSDictionary *)parameters pageNo:(NSString *)pageNoStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:[NSString stringWithFormat:@"api/user/%@/notification",[[HFSingleton sharedInstance] User_idStr]] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}


//Notifications Status Update...

- (void)notificationStatusUpdateParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self PUT:[NSString stringWithFormat:@"api/user/%@/notification",[[HFSingleton sharedInstance] User_idStr]] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

/////////////////////////////////////////////////////////////
# pragma Media...

//Upload media item...

- (void)uploadvideoItemParams:(NSDictionary *)parameters selectImage:(NSData*)image userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    
    [self POST:[NSString stringWithFormat:@"api/user/%@/media",userIDStr] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:image name:@"file" fileName:[parameters objectForKey:@"fileName"] mimeType:@""];
    } progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask* task, NSError* error) {
        failure(task, error);
    }];

}

- (void)uploadMediaItemParams:(NSDictionary *)parameters selectImage:(NSData*)image userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    

    [self POST:[NSString stringWithFormat:@"api/user/%@/media",userIDStr] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if ([[parameters objectForKey:@"resize"] isEqualToString:@"true"])
        {
            [formData appendPartWithFileData:image name:@"file" fileName:[NSString stringWithFormat:@"Photo_i%u.jpeg",arc4random_uniform([TimeStamp intValue])] mimeType:@"image/jpeg"];

        }else
        {
            [formData appendPartWithFileData:image name:@"file" fileName:[NSString stringWithFormat:@"audio_i%u.m4a",arc4random_uniform([TimeStamp intValue])] mimeType:@"audio/x-m4a"];

        }
     
    } progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask* task, NSError* error)
    {
        failure(task, error);
    }];
    
}

- (void)uploadMediaItemParams:(NSDictionary *)parameters selectedAudio:(NSData*)image name:(NSString *)songName userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self POST:[NSString stringWithFormat:@"api/user/%@/media",userIDStr] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
    {
        if (![[parameters objectForKey:@"resize"] isEqualToString:@"true"])
        {
            NSString * newNameString = [songName stringByReplacingOccurrencesOfString:@"\"" withString:@""];

            [formData appendPartWithFileData:image name:@"file" fileName:[NSString stringWithFormat:@"%@.m4a",newNameString] mimeType:@"audio/x-m4a"];
        }
        
    } progress:nil
    success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
    failure:^(NSURLSessionDataTask* task, NSError* error)
     {
         failure(task, error);
     }];
}



//Update User Profile API


//Get media item details...

- (void)getMediaItemDetailsParams:(NSDictionary *)parameters mediaItemId:(NSString *)mediaItemId accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:[NSString stringWithFormat:@"api/media/%@",mediaItemId] parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

//Get all user media...

- (void)getAllUserMediaParams:(NSDictionary *)parameters linkStr:(NSString *)linkStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    NSString *finalLinkStr = @"";
    if ([linkStr isEqualToString:@""]) {
        finalLinkStr =[NSString stringWithFormat:@"api/user/%@/media",parameters[@"userID"]];
    }else{
        finalLinkStr = linkStr;
    }
    [self GET:finalLinkStr parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
}

//Get all user media image sliding...

- (void)getAllUserMediaSlidingParams:(NSDictionary *)parameters linkStr:(NSString *)linkStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    NSString *finalLinkStr = @"";
    if ([linkStr isEqualToString:@""]) {
        finalLinkStr =[NSString stringWithFormat:@"api/user/%@/media/slideshow",parameters[@"userID"]];
    }else{
        finalLinkStr = linkStr;
    }
    [self GET:finalLinkStr parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];

}
//Get community media service...

- (void)getCommunityMediaParams:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *linkStr = @"";
    
    if ([pageNo isEqualToString:@""]) {
        linkStr = @"api/media";
    }
    else{
        linkStr = pageNo;
    }

    [self GET:linkStr parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
}

/////////////////////////////////////////////////////////////
#pragma mark Frames...

//Search Frame By Hash Tag
- (void)getHashTagFramesParams:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *linkStr = @"";
    
    if ([pageNo isEqualToString:@""]) {
        linkStr = @"api/frame/search";
    }
    else{
        linkStr = pageNo;
    }

    
    [self GET:linkStr parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}


//create frame...

- (void)createFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken userID:(NSString *)userid success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self POST:userid parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
}

//Delete Frame

- (void)deleteFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    NSString *userid = [NSString stringWithFormat:@"api/user/%@/frame/%@",userId,frameId];
    
    [self DELETE:userid parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         failure(task, error);
     }];
    
}

//Get User Frames

-(void)getUserFrames:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString *)accessToken nextLinkStr:(NSString*)linkStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    NSDictionary *tempDict;
    if ([linkStr isEqualToString:@""])
    {
        tempDict = @{@"user_id":[[HFSingleton sharedInstance] User_idStr]};
        
        if ([parameters valueForKey:@"friend_id"])
        {
            if (![[parameters valueForKey:@"friend_id"] isEqualToString:@""])
            {
                linkStr = [NSString stringWithFormat:@"api/user/%@/frame?user_id=%@",[parameters valueForKey:@"friend_id"],[tempDict valueForKey:@"user_id"]];
            }
        }
        else
        {
            linkStr = [NSString stringWithFormat:@"api/user/%@/frame",[parameters valueForKey:@"user_id"]];
        }
    }
    else{
        tempDict=@{};
        linkStr = linkStr;
    }
    ///
    
    [self GET:linkStr parameters:tempDict progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
   
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

// Single Frame

- (void)getSingleFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    NSString *urlString = [NSString stringWithFormat:@"api/frame/%@",frameId];
    
    [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
         
     }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//update Frame

- (void)updateFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *userid = [NSString stringWithFormat:@"api/user/%@/frame/%@",userId,frameId];

    
    //NSString *userid = [NSString stringWithFormat:@"api/user/%@/frame",userId];
    
    [self PUT:userid parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         failure(task, error);
     }];
    
}
//like Frame

-(void)likeFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
   [self POST:[NSString stringWithFormat:@"api/frame/%@/like",frameId] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);

    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];

}
//unlike frame
-(void)unlikeFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
   // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self DELETE:[NSString stringWithFormat:@"api/frame/%@/like",frameId] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
         
     }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
    
}


//block user//

- (void)blockUser:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId friendId:(NSString*)friendId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *userid = [NSString stringWithFormat:@"api/user/%@/%@",friendId,userId];
   //(@"parameters %@",parameters);
    
    [self DELETE:userid parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         failure(task, error);
     }];
    
}

//UnBlock user
- (void)unBlockUser:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId friendId:(NSString*)friendId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString *userid = [NSString stringWithFormat:@"api/user/%@/%@",friendId,userId];
    
    [self PUT:userid parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         failure(task, error);
     }];

}

//Get Frame Likes
-(void)getFrameLikes:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:[NSString stringWithFormat:@"api/frame/%@/like?user_id=%@",frameId,[parameters valueForKey:@"user_id"]] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);

    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//Get Frame Comments
-(void)getFrameComments:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId page:(NSString*)pageNum success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:[NSString stringWithFormat:@"api/frame/%@/comment?&page=%@&user_id=%@",frameId,pageNum,[parameters valueForKey:@"user_id"]] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//Add Comment
-(void)addComment:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/frame/%@/comment",frameId] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//Report Frame
-(void)reportFrame:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
   // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/frame/%@/report",frameId] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
        
        } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//Get Tagged UserList
-(void)getTaggedUserList:(NSDictionary *)parameters accessToken:(NSString *)accessToken userId:(NSString*)userId frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
   // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:[NSString stringWithFormat:@"api/user/%@/frame/%@/users",userId,frameId] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//get nearby places for checkin...

- (void)getNearbyPlaces:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
   // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:[NSString stringWithFormat:KGoogleApiCheckin,[parameters valueForKey:@"dlat"],[parameters valueForKey:@"dlong"]] parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

//Get Current Location Address

- (void)getCurrentAddress:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [self GET:[parameters valueForKey:@"getAddress"] parameters:@{} progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}


//Get community frames...

- (void)getCommunityFramesParams:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken nextLink:(NSString*)NextLinkStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    NSString *linkStr = @"";

    if ([NextLinkStr isEqualToString:@""])
    {
       linkStr = @"api/frame";
    }
    else{
        linkStr = NextLinkStr;
    }
    
    [self GET:linkStr parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//Get frame detail

-(void)getFrameDetail:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
   
    [self GET:[NSString stringWithFormat:@"api/frame/%@?user_id=%@",frameId,[parameters valueForKey:@"user_id"]] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}


#pragma mark User Friends...

//Get Blocked Users

- (void)getBlockedUsersListParams:(NSDictionary *)parameters userId:(NSString*)userId searchText:(NSString*)searchStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
  
    [self GET:[NSString stringWithFormat:@"api/user/%@/blocked",userId]  parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}
- (void)getUserFriendsListParams:(NSDictionary *)parameters userId:(NSString*)userId searchText:(NSString*)searchStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:[NSString stringWithFormat:@"api/user/%@/friends",userId]  parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}


//Get User Friends

- (void)gettaggedFriendsListParams:(NSDictionary *)parameters userId:(NSString*)userId search:(NSString*)searchStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self GET:[NSString stringWithFormat:@"api/user/%@/friends/tag",userId]  parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}

//Follow User...

- (void)followUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    NSString * postString =[NSString stringWithFormat:@"api/user/%@/follow/%@", userID,followUserID];
    [self POST:postString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
}

//Unfollow User...

- (void)unfollowUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self DELETE:[NSString stringWithFormat:@"api/user/%@/follow/%@", userID,followUserID] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
        success(responseObject);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         failure(task, error);
     }];

}


//Favorite User...

- (void)favoriteUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/user/%@/favorite/%@", userID,followUserID] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];

}

//Unfavorite User...

- (void)unfavoriteUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
   // self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self DELETE:[NSString stringWithFormat:@"api/user/%@/favorite/%@", userID,followUserID] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         failure(task, error);
     }];

}

//Approve Following User...

- (void)approveFollowingUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    //self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [self POST:[NSString stringWithFormat:@"api/user/%@/follow/%@/approve",followUserID,userID] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
}

#pragma mark HF Search...

//HF Search
- (void)hfSearchParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken searchStr:(NSString *)searchStr urlStr:(NSString *)urlStr pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self GET:[NSString stringWithFormat:@"api/search%@",urlStr] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

#pragma mark CommunityMembers

- (void)hfCommunityMembersParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userID:(NSString *)userIDStr communityName:(NSString *)communityType communityID:(NSString *)communityid pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self GET:[NSString stringWithFormat:@"api/user/%@/get_community_members?communityType=%@&communityId=%@&page=%@",userIDStr,communityType,communityid,pageStr] parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}
//PubNub Chat INBOX message

- (void)ChatInboxAccessToken:(NSString*)accessToken userIDStr:(NSString *)userIDStr  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{

    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self GET:[NSString stringWithFormat:@"api/user/%@/inbox",userIDStr] parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
}

- (void)userContactsListAccessToken:(NSString*)accessToken userIDStr:(NSString *)userIDStr searchStr:(NSString *)searchStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    
    
   //(@"userIDStr %@",userIDStr);
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    
    [self GET:[NSString stringWithFormat:@"api/user/%@/contacts",userIDStr] parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
    
    
//    [self GET:[NSString stringWithFormat:@"api/user/%@/contacts",userIDStr] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        success(responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error)
//     {
//         failure(task, error);
//     }];
    
}


//Send PushNotifications...

- (void)sendPushNotificationMessageParameters:(NSDictionary *)messageDict toUser:(NSString*)toUSer fromUser:(NSString *)fromUser accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
//    [self.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [self POST:[NSString stringWithFormat:@"api/user/%@/%@/message",toUSer,fromUser] parameters:messageDict progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
       failure:^(NSURLSessionDataTask *task, NSError *error)
     {
        //(@"error %@",[error localizedDescription]);
         
         failure(task, error);
     }];
}

//NewFeedCount
- (void)NewFeedCount:(NSString*)accessToken userIDStr:(NSString *)userIDStr  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure
{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self GET:[NSString stringWithFormat:@"api/user/%@/feeds",userIDStr] parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];

    
}

// Relation service
//Url: http://52.8.125.166/hfdevv1/public/api/user/:currentUserId/:userId/friends

-(void)getRelations:(NSDictionary *)parameters accessToken:(NSString *)accessToken currentUserID:(NSString *)currentUserID userID:(NSString *)userID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure {
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];
    [self GET:[NSString stringWithFormat:@"api/user/%@/%@/friends",currentUserID,userID]  parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(task, error);
     }];
}



@end
