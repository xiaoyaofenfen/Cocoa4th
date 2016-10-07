//
//  Document.h
//  RaiseMan
//
//  Created by liangfen on 16/9/24.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Person;

@interface Document : NSDocument {
}

@property (nonatomic, copy) NSMutableArray *employees;

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;

- (void)startObservingPerson: (Person *)person;
- (void)stopObservingPerson: (Person *)person;

- (void)changeKeyPath:(NSString *)keyPath ofObject:(id)obj toValue:(id)newValue;
@end

