//
//  AppDelegate.m
//  WindowResize
//
//  Created by liangfen on 16/9/21.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *txtLabel;

@end

@implementation AppDelegate

@synthesize txtLabel, window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    NSLog(@"windowWillResize...");
    if((frameSize.width / frameSize.height) != 2)
    {
        frameSize.width = 2 * frameSize.height;
    }

    return frameSize;
}

- (void)windowDidEndLiveResize:(NSNotification *)notification
{
    NSLog(@"windowDidEndLiveResize...");
    NSSize size = [[window contentView] frame].size;
    [txtLabel setStringValue: [NSString stringWithFormat:@"%d X %d", (int)size.width, (int)size.height]];
}

-(void) awakeFromNib
{
    NSSize size = [[window contentView] frame].size;
    [txtLabel setStringValue: [NSString stringWithFormat:@"%d X %d", (int)size.width, (int)size.height]];
}

@end
