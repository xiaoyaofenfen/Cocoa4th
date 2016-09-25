//
//  Document.m
//  RaiseManNone
//
//  Created by liangfen on 16/9/25.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "Document.h"
#import "Person.h"

@interface Document ()

@property (weak) IBOutlet NSTableView *tableView;
@property (nonatomic, copy) NSMutableArray *employees;


- (IBAction)addEmployee:(id)sender;
- (IBAction)removeEmployee:(id)sender;
@end

@implementation Document

@synthesize employees, tableView;

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

- (IBAction)addEmployee:(id)sender {

    Person *p = [Person new];
    [employees addObject:p];
    [tableView reloadData];
}

- (IBAction)removeEmployee:(id)sender {

    NSInteger sel = [tableView selectedRow];
    if(sel >= 0) {
        [employees removeObjectAtIndex:sel];
        [tableView reloadData];
    }

}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    return [employees count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
    if(rowIndex < 0) {
        return nil;
    }

    Person *person = [employees objectAtIndex:rowIndex];
    if(person != NULL) {
        NSString *identifier = [aTableColumn identifier];
        return [person valueForKey:identifier];
    }

    return nil;
}

- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {

    if(rowIndex < 0) {
        return ;
    }

    Person *person = [employees objectAtIndex:rowIndex];
    if(person != NULL) {
        NSString *identifier = [aTableColumn identifier];
        [person setValue:anObject forKeyPath:identifier];
    }
    
}

- (void)tableView:(NSTableView *)aTableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors {

    NSLog(@"sortDescriptorsDidChange...");
    NSArray *newDes = [tableView sortDescriptors];
    NSLog(@"sortDescriptors: %@", newDes);
    [employees sortUsingDescriptors:newDes];
    [tableView reloadData];
}

@end
