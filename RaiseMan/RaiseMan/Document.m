//
//  Document.m
//  RaiseMan
//
//  Created by liangfen on 16/9/24.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "Document.h"
#import "Person.h"

static void *DocumentKVOContext;

@interface Document ()

@end

@implementation Document

@synthesize employees, tableView, employeeController;


- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        employees = [NSMutableArray new];
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index {
    NSLog(@"adding %@ to %@", p, employees);

    // push into undo stack
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] removeObjectFromEmployeesAtIndex:index];
    if(! [undo isUndoing]) {
        [undo setActionName:@"Add Person"];
    }

    // add into list
    [self startObservingPerson:p];
    [employees insertObject:p atIndex:index];
}
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index {
    Person *p = [employees objectAtIndex:index];

    NSLog(@"removing %@ from %@", p, employees);

    // undo
    NSUndoManager *undo = [self undoManager];
    [[undo prepareWithInvocationTarget:self] insertObject:p inEmployeesAtIndex:index];
    if(![undo isUndoing]) {
        [undo setActionName:@"Remove Person"];
    }

    // remove
    [self stopObservingPerson:p];
    [employees removeObjectAtIndex:index];
}

- (void)startObservingPerson: (Person *)person {
    [person addObserver:self forKeyPath:@"personName" options:NSKeyValueObservingOptionOld context:DocumentKVOContext];
    [person addObserver:self forKeyPath:@"expectedRaise" options:NSKeyValueObservingOptionOld context:DocumentKVOContext];
    
}
- (void)stopObservingPerson: (Person *)person {
    [person removeObserver:self forKeyPath:@"personName" context:DocumentKVOContext];
    [person removeObserver:self forKeyPath:@"expectedRaise" context:DocumentKVOContext];
}

- (void)changeKeyPath:(NSString *)keyPath ofObject:(id)obj toValue:(id)newValue {
    [obj setValue:newValue forKeyPath:keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if(context != DocumentKVOContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }

    // add undo action
    NSUndoManager *undo = [self undoManager];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    if(oldValue == [NSNull null]) {
        oldValue = nil;
    }

    [[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath ofObject:object toValue:oldValue];
    [undo setActionName:@"Edit"];
}

- (IBAction)createEmployee:(id)sender {

    NSWindow *w = [tableView window];

    BOOL editingEnable = [w makeFirstResponder:w];
    if(!editingEnable) {
        NSLog(@"Unable to end editing");
        return;
    }


    NSUndoManager *undo = [self undoManager];

    // close all current editing action
    if([undo groupingLevel] > 0) {
        [undo endUndoGrouping];
        [undo beginUndoGrouping];
    }

    Person *p = [employeeController newObject];
    [employeeController addObject:p];

    [employeeController rearrangeObjects];
    NSArray *a = [employeeController arrangedObjects];

    NSUInteger *row = [a indexOfObjectIdenticalTo:p];

    NSLog(@"staring edit of %@ in row %lu", p, row);

    [tableView editColumn:0 row:row withEvent:nil select:YES];
}

@end
