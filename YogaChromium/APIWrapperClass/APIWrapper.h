//
//  APIWrapper.h
//  RightLink
//
//  Created by Veeru on 29/06/15.
//  Copyright (c) 2015 Northalley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface APIWrapper : AFHTTPSessionManager

+ (APIWrapper *)hFSharedHttpClient;

//Login...

- (void)userSignUpParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//CommunityMembers
- (void)hfCommunityMembersParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userID:(NSString *)userIDStr communityName:(NSString *)communityType communityID:(NSString *)communityid pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get acessSignedToken...

- (void)acessSignedTokenGanarateParams:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get acessUnsignedToken...

- (void)acessUnsignedTokenGanarateParams:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

#pragma User...

//Verify UserName...

- (void)verifyUsernameParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Verify Email...

- (void)verifyEmailParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Verify PhoneNumber...

- (void)verifyPhoneNumberParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


//Signup...

- (void)signUpParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//SendSms...

- (void)sendSmsParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetCountriesList...

- (void)countriesListParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetStatesList...

- (void)statesListParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken searchStr:(NSString *)searchStr pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetCityList...

- (void)cityListParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken searchStr:(NSString *)searchStr pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetUniversitiesList...

- (void)universitiesListParams:(NSDictionary *)parameters searchStr:(NSString *)searchStr pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetSchoolsList...

- (void)schoolsListParams:(NSDictionary *)parameters searchStr:(NSString *)searchStr pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetCommunityDetailsService...

- (void)getCommunityDetailsParams:(NSDictionary *)parameters communityId:(NSString *)communityIdStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//InviteUserFriends...

- (void)inviteUserFriendsParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//ForgotPassword...

- (void)forgotPasswordParams:(NSDictionary *)parameters typeForgot:(NSString*)type accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Forgot Username service...

- (void)forgotUsernameParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//VerifyPasswordResetlink...

- (void)verifyPasswordResetlinkParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//ResetPassword...

- (void)resetPasswordResetlinkParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get MyProfile Info...

- (void)getProfileInfoParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Update my profile service...

- (void)userEditProfile:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Delete User...

- (void)deleteUser:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


//User Logout...

- (void)userlogoutParams:(NSDictionary *)parameters userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//GetNotifications...

- (void)getNotificationsParams:(NSDictionary *)parameters pageNo:(NSString *)pageNoStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Notifications Status Update...

- (void)notificationStatusUpdateParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get Public Profile Info...

- (void)getPublicProfileInfoParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken friendID:(NSString *)friendIDStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

# pragma Media...

//Upload media item...

- (void)uploadMediaItemParams:(NSDictionary *)parameters selectImage:(NSData*)image userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


- (void)uploadMediaItemParams:(NSDictionary *)parameters selectedAudio:(NSData*)image name:(NSString *)songName userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get media item details...

- (void)getMediaItemDetailsParams:(NSDictionary *)parameters mediaItemId:(NSString *)mediaItemId accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get all user media...

- (void)getAllUserMediaParams:(NSDictionary *)parameters linkStr:(NSString *)linkStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get all user media image Sliding...

- (void)getAllUserMediaSlidingParams:(NSDictionary *)parameters linkStr:(NSString *)linkStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get community media service...

- (void)getCommunityMediaParams:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

# pragma Frames...

//Search Frame By Hash Tag
- (void)getHashTagFramesParams:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//get nearby places for checkin...

- (void)getNearbyPlaces:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//create frame...

- (void)createFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken userID:(NSString *)userid success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


//Delete Frame
- (void)deleteFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get User Frames
-(void)getUserFrames:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString *)accessToken nextLinkStr:(NSString*)linkStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//likke Frame
-(void)likeFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//unlike Frame
-(void)unlikeFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get Frame Likes
-(void)getFrameLikes:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get Frame Comments
-(void)getFrameComments:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId page:(NSString*)pageNum success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Add Comment
-(void)addComment:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get Community Frames...
- (void)getCommunityFramesParams:(NSDictionary *)parameters pageNo:(NSString *)pageNo accessToken:(NSString*)accessToken nextLink:(NSString*)NextLinkStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Report Frame
-(void)reportFrame:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get Tagged UserList
-(void)getTaggedUserList:(NSDictionary *)parameters accessToken:(NSString *)accessToken userId:(NSString*)userId frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//update Frame
- (void)updateFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//block user//
- (void)blockUser:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId friendId:(NSString*)friendId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get frame detail

-(void)getFrameDetail:(NSDictionary *)parameters accessToken:(NSString *)accessToken frameId:(NSString*)frameId  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

#pragma User Friends...

//Get Blocked Users

- (void)getBlockedUsersListParams:(NSDictionary *)parameters userId:(NSString*)userId searchText:(NSString*)searchStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//UnBlock user
- (void)unBlockUser:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString*)userId friendId:(NSString*)friendId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Follow User...

- (void)followUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Unfollow User...

- (void)unfollowUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get User Friends

- (void)getUserFriendsListParams:(NSDictionary *)parameters userId:(NSString*)userId searchText:(NSString*)searchStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Favorite User...

- (void)favoriteUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Unfavorite User...

- (void)unfavoriteUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Approve Following User...

- (void)approveFollowingUserParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken userId:(NSString *)userID followUserID:(NSString *)followUserID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//Get Current Location Address

- (void)getCurrentAddress:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;
#pragma HF Search...

//HF Search
- (void)hfSearchParams:(NSDictionary *)parameters accessToken:(NSString*)accessToken searchStr:(NSString *)searchStr urlStr:(NSString *)urlStr pageNo:(NSString *)pageStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

- (void)gettaggedFriendsListParams:(NSDictionary *)parameters userId:(NSString*)userId search:(NSString*)searchStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

- (void)uploadvideoItemParams:(NSDictionary *)parameters selectImage:(NSData*)image userId:(NSString *)userIDStr accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


- (void)ChatInboxAccessToken:(NSString*)accessToken userIDStr:(NSString *)userIDStr  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


- (void)userContactsListAccessToken:(NSString*)accessToken userIDStr:(NSString *)userIDStr searchStr:(NSString *)searchStr success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


//Send PushNotifications

- (void)sendPushNotificationMessageParameters:(NSDictionary *)messageDict toUser:(NSString*)toUSer fromUser:(NSString *)fromUser accessToken:(NSString*)accessToken success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

//NewFeedCount
- (void)NewFeedCount:(NSString*)accessToken userIDStr:(NSString *)userIDStr  success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

// Single Frame
- (void)getSingleFrame:(NSDictionary *)parameters accessToken:(NSString*)accessToken frameId:(NSString*)frameId success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

// Relations service call

-(void)getRelations:(NSDictionary *)parameters accessToken:(NSString*)accessToken currentUserID:(NSString*)currentUserID userID:(NSString*)userID success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;


@end
