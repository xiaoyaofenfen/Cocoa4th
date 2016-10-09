//
//  Person.h
//  RaiseMan
//
//  Created by liangfen on 16/9/24.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (readwrite, copy) NSString *personName;
@property (readwrite) float expectedRaise;


@end
