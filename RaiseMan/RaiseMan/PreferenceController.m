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


NSString *const TSTableBgColorKey = @"TSTSTableBgColor";
NSString *const TSEmptyDocKey = @"TSEmptyDoc";

@implementation PreferenceController

@synthesize colorWell, checkbox;

+ (NSColor *)preferenceTableBgColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [defaults objectForKey:TSTableBgColorKey];
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}

+ (void)setPreferenceTableBgColor:(NSColor *)color {
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorAsData forKey:TSTableBgColorKey];
}

+ (BOOL)preferenceEmptyDoc {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:TSEmptyDocKey];
}

+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc {
    [[NSUserDefaults standardUserDefaults] setBool:emptyDoc forKey:TSEmptyDocKey];
}

- (instancetype) init {

    self = [super initWithWindowNibName:@"PreferenceController"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

    NSLog(@"Nib file is loaded");

    [colorWell setColor:[PreferenceController preferenceTableBgColor]];
    [checkbox setState:[PreferenceController preferenceEmptyDoc]];
}



- (IBAction)changeBackgroundColor:(id)sender {
    NSColor *color = [colorWell color];
    NSLog(@"Color changed %@", color);
    [PreferenceController setPreferenceTableBgColor:color];
}
- (IBAction)changeNewEmptyDoc:(id)sender {
    NSInteger state = [checkbox state];
    NSLog(@"checkbox changed %d", state);
    [PreferenceController setPreferenceEmptyDoc:state];
}

@end
