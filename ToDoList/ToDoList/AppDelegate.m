//
//  AppDelegate.m
//  ToDoList
//
//  Created by liangfen on 16/9/22.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton *addButton;
@property (weak) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

- (IBAction)addItemIntoTable:(id)sender;

@end

@implementation AppDelegate

@synthesize window, textField, addButton, tableView;
@synthesize dataSource;


- (instancetype) init{
    self = [super init];
    if(self)
    {
        self.dataSource = [NSMutableArray new];

        tableView.dataSource = self;
    }

    return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView{
    return [dataSource count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex{
    NSString *text = [dataSource objectAtIndex:rowIndex];
    return text;
}

- (IBAction)addItemIntoTable:(id)sender {
    NSString *text = [textField stringValue];
    if(text != NULL && [text length] > 0)
    {
        [dataSource addObject:text];

        [tableView reloadData];
    }
}

@end
