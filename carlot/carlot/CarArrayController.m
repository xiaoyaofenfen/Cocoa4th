//
//  CarArrayController.m
//  carlot
//
//  Created by liangfen on 16/10/23.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "CarArrayController.h"

@implementation CarArrayController

- (id) newObject {

    id newObj = [super newObject];

    NSDate *now = [NSDate date];
    [newObj setValue:now forKey:@"datePurchased"];
    return newObj;
}

@end
