//
//  GoHomeHandler.m
//  HZSSiriIntents
//
//  Created by H&L on 2019/11/27.
//  Copyright © 2019 H&L. All rights reserved.
//

#import "GoHomeHandler.h"

@implementation GoHomeHandler

- (void)confirmGOHome:(GOHomeIntent *)intent completion:(void (^)(GOHomeIntentResponse * _Nonnull))completion {
    NSLog(@"comfirGOHome");
}

- (void)handleGOHome:(GOHomeIntent *)intent completion:(void (^)(GOHomeIntentResponse * _Nonnull))completion {
    NSLog(@"handleGOHome");
    GOHomeIntentResponse *response = [GOHomeIntentResponse successIntentResponseWithTime:intent.time location:intent.location];
    completion(response);
}

- (void)resolveLocationForGOHome:(nonnull GOHomeIntent *)intent withCompletion:(nonnull void (^)(INStringResolutionResult * _Nonnull))completion {
    NSLog(@"resolveLocationForGOHome");
}


- (void)resolveTimeForGOHome:(nonnull GOHomeIntent *)intent withCompletion:(nonnull void (^)(INStringResolutionResult * _Nonnull))completion {
    NSLog(@"resolveTimeForGOHome");
}



@end
