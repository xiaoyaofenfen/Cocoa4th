//
//  PreferenceController.h
//  RaiseMan
//
//  Created by liangfen on 16/10/23.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString *const TSTableBgColorKey;
extern NSString *const TSEmptyDocKey;

@interface PreferenceController : NSWindowController

+ (NSColor *)preferenceTableBgColor;
+ (void)setPreferenceTableBgColor:(NSColor *)color;
+ (BOOL)preferenceEmptyDoc;
+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc;

@end
