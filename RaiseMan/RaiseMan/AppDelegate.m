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

extern NSString *const TSTableBgColorKey;
extern NSString *const TSEmptyDocKey;

@implementation AppDelegate

@synthesize preferenceController;


+ (void)initialize {
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];

    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];

    [defaultValues setObject:colorAsData forKey:TSTableBgColorKey];
    [defaultValues setObject:[NSNumber numberWithBool:YES] forKey:TSEmptyDocKey];

    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];

    NSLog(@"registered defaults %@", defaultValues);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {

    return [PreferenceController preferenceEmptyDoc];
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
