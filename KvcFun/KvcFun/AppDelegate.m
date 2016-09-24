//
//  AppDelegate.m
//  KvcFun
//
//  Created by liangfen on 16/9/24.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSliderCell *slider;
@property (weak) IBOutlet NSTextField *label;

@property int fido;

- (IBAction)incrementFido:(id)sender;

@end

@implementation AppDelegate

@synthesize fido, label, slider;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)incrementFido:(id)sender {

    self.fido++;
}

- (void) awakeFromNib {

    // binding
    [slider bind:@"value" toObject:self withKeyPath:@"fido" options:nil];

    [label bind:@"value" toObject:self withKeyPath:@"fido" options:nil];
}

@end
