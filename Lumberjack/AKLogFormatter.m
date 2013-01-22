//
//  AKLogFormatter.m
//  USPSValueChain
//
//  Created by Ethan Diamond on 1/22/13.
//  Copyright (c) 2013 AKQA. All rights reserved.
//

#import "AKLogFormatter.h"

@interface AKLogFormatter()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation AKLogFormatter

- (id)init
{
    if((self = [super init]))
    {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [self.dateFormatter setDateFormat:@"HH:mm:ss:SSS"];
    }
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    switch (logMessage->logFlag)
    {
        case LOG_FLAG_DEBUG:
        case LOG_FLAG_INFO:
        case LOG_FLAG_ERROR:
        case LOG_FLAG_WARN:
        {
            return [NSString stringWithFormat:@"[%@:%i] %@", logMessage.fileName, logMessage->lineNumber, logMessage->logMsg];
        }
        case LOG_FLAG_NETWORK_REQUEST:
        case LOG_FLAG_NETWORK_RESPONSE:
        {
            return [NSString stringWithFormat:@"[%@] %@", [self.dateFormatter stringFromDate:logMessage->timestamp], logMessage->logMsg];
        }
        default:
        {
            return [NSString stringWithFormat:@"%@", logMessage->logMsg];
        }
    }
}

@end
