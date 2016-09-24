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

@property int fido;

- (IBAction)incrementFido:(id)sender;

@end

@implementation AppDelegate

@synthesize fido;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)incrementFido:(id)sender {

    self.fido++;
}
@end
