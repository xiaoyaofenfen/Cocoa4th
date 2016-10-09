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

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        expectedRaise = [decoder decodeDoubleForKey:@"expectedRaise"];
        personName = [decoder decodeObjectForKey:@"personName"];
    }

    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeDouble:expectedRaise forKey:@"expectedRaise"];
    [encoder encodeObject:personName forKey:@"personName"];
}

- (void) setNilValueForKey:(NSString *)key {
    if([key isEqualToString:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    } else {
        [super setNilValueForKey:key];
    }
}

@end
