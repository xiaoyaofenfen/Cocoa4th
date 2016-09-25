//
//  Person.m
//  RaiseMan
//
//  Created by liangfen on 16/9/24.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize personName, expectedRaise;

- (instancetype) init {
    self = [super init];
    if(self) {
        expectedRaise = 0.05;
        personName = @"New Persion";
    }
    return self;
}

- (void) setNilValueForKey:(NSString *)key {
    if([key isEqualToString:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}

@end
