//
//  AKLog.h
//  USPSValueChain
//
//  Created by Ethan Diamond on 1/22/13.
//  Copyright (c) 2013 AKQA. All rights reserved.
//
//  AKLog is AKQA's default logger.  View the Github wiki at https://github.com/AKQADC/CocoaLumberjack/wiki for directions.


#import <Foundation/Foundation.h>

#import "DDLog.h"
#import "DDTTYLogger.h"

//Undefine the C logging
#undef DDLogCError
#undef DDLogCWarn
#undef DDLogCInfo
#undef DDLogCVerbose

//Move the FLAG_VERBOSE to be a lower priority than the network flags
#undef LOG_FLAG_VERBOSE

#define LOG_FLAG_NETWORK_REQUEST  (1 << 3)  // 0...100
#define LOG_FLAG_NETWORK_RESPONSE  (1 << 4)  // 0...1000
#define LOG_FLAG_DEBUG  (1 << 5)  // 0...100000

//Add a log level that will log everything
#define LOG_LEVEL_ALL (LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO | LOG_FLAG_NETWORK_REQUEST | LOG_FLAG_NETWORK_RESPONSE |  LOG_FLAG_DEBUG )

//Define the log macros
#define DDLogNetworkRequest(frmt, ...) LOG_OBJC_MAYBE(1, ddLogLevel, LOG_FLAG_NETWORK_REQUEST, 0, frmt, ##__VA_ARGS__)
#define DDLogNetworkResponse(frmt, ...) LOG_OBJC_MAYBE(1, ddLogLevel, LOG_FLAG_NETWORK_RESPONSE, 0, frmt, ##__VA_ARGS__)
#define DDLogDebug(frmt, ...) LOG_OBJC_MAYBE(1, ddLogLevel, LOG_FLAG_DEBUG, 0, frmt, ##__VA_ARGS__)

//Set to show all errors in debug
#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_ALL;
#else
static const int ddLogLevel = LOG_LEVEL_OFF;
#endif

@interface AKLog : NSObject

+ (void)initializeColors;
+ (void)testColors;

@end
