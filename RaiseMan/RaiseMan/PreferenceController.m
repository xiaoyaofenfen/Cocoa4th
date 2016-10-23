//
//  PreferenceController.m
//  RaiseMan
//
//  Created by liangfen on 16/10/23.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "PreferenceController.h"

@interface PreferenceController ()

@property IBOutlet NSColorWell *colorWell;
@property IBOutlet NSButton *checkbox;


- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;

@end

@implementation PreferenceController

@synthesize colorWell, checkbox;


- (instancetype) init {

    self = [super initWithWindowNibName:@"PreferenceController"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

    NSLog(@"Nib file is loaded");
}

- (IBAction)changeBackgroundColor:(id)sender {
    NSColor *color = [colorWell color];
    NSLog(@"Color changed %@", color);
}
- (IBAction)changeNewEmptyDoc:(id)sender {
    NSInteger state = [checkbox state];
    NSLog(@"checkbox changed %d", state);
}

@end
