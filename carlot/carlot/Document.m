//
//  Document.m
//  carlot
//
//  Created by liangfen on 16/10/16.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "Document.h"

@interface Document ()

@property IBOutlet NSTableView *tableView;
@property IBOutlet NSArrayController *carArrayController;

- (IBAction)createNewObject:(id)sender;

@end

@implementation Document

@synthesize tableView,carArrayController;

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
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

- (IBAction)createNewObject:(id)sender {

    id car = [carArrayController newObject];
    [carArrayController addObject:car];

    [carArrayController rearrangeObjects];
    NSArray *a = [carArrayController arrangedObjects];

    NSUInteger row = [a indexOfObject:car];
    [tableView editColumn:0 row:row withEvent:nil select:YES];
}

@end
