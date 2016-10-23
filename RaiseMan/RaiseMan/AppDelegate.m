//
//  AppDelegate.m
//  RaiseMan
//
//  Created by liangfen on 16/9/24.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "AppDelegate.h"
#import "PreferenceController.h"

@interface AppDelegate ()

@property PreferenceController *preferenceController;

- (IBAction)showPreferencePanel:(id)sender;
- (IBAction)showAboutPanel:(id)sender;

@end

@implementation AppDelegate

@synthesize preferenceController;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showPreferencePanel:(id)sender {
    if(!preferenceController) {
        preferenceController = [PreferenceController new];
    }

    NSLog(@"showing %@", preferenceController);

    [preferenceController showWindow:self];
}

- (IBAction)showAboutPanel:(id)sender {
    BOOL sucessful = [NSBundle loadNibNamed:@"AboutWindow" owner:self];
}

@end
