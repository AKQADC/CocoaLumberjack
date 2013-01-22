//
//  AKLog.m
//  USPSValueChain
//
//  Created by Ethan Diamond on 1/22/13.
//  Copyright (c) 2013 AKQA. All rights reserved.
//

#import "AKLog.h"
#import "AKLogFormatter.h"

@implementation AKLog

+ (void)initializeColors
{
    //Enable Cocoa Lumberjack
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    //Set the colors on the logs
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor]  backgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f] forFlag:LOG_FLAG_NETWORK_REQUEST];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor]  backgroundColor:[UIColor colorWithRed:0.6f green:0.6f blue:0.6f alpha:1.0f] forFlag:LOG_FLAG_NETWORK_RESPONSE];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:nil                                                         forFlag:LOG_FLAG_INFO];
    [[DDTTYLogger sharedInstance] setForegroundColor:nil                  backgroundColor:[UIColor redColor]                                          forFlag:LOG_FLAG_ERROR];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blackColor] backgroundColor:[UIColor yellowColor]                                       forFlag:LOG_FLAG_WARN];
    
    //Set the formatting
    AKLogFormatter *logFormatter = [[AKLogFormatter alloc] init];
    [[DDTTYLogger sharedInstance] setLogFormatter:logFormatter];
    
    DDLogError(@"Error");
    DDLogWarn(@"Warning");
    DDLogNetworkRequest(@"Request");
    DDLogNetworkResponse(@"Response");
    DDLogInfo(@"Info");
    DDLogDebug(@"Debug");
}

@end
