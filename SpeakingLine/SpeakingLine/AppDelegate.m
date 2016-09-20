//
//  AppDelegate.m
//  SpeakingLine
//
//  Created by liangfen on 16/9/18.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSButton *speakButton;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSTableView *tableView;

@property (nonatomic, strong) NSArray *voices;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;

- (void)tableViewSelectionDidChange:(NSNotification *) notification;
- (void)awakeFromNib;

@end

@implementation AppDelegate
{
    NSSpeechSynthesizer *speechSynth;
}

@synthesize textField, speakButton, stopButton, voices, tableView;

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        NSLog(@"init the AppDelegate");
        speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];

        [speechSynth setDelegate: self];

        voices = [NSSpeechSynthesizer availableVoices];

        
    }

    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping speaking");
    [speechSynth stopSpeaking];
}

- (IBAction)sayIt:(id)sender {
    NSString *text = [self.textField stringValue];
    if([text length] == 0)
    {
        NSLog(@"the text is empty!");
        return ;
    }

    [speechSynth startSpeakingString:text];
    speakButton.enabled = NO;
    stopButton.enabled = YES;
    tableView.enabled = NO;
    NSLog(@"staring speaking: %@", text);
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)success
{
    NSLog(@"the state of speech synthesizer: %d", success);

    speakButton.enabled = YES;
    stopButton.enabled = NO;
    tableView.enabled = YES;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [voices count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    NSString *voice = [voices objectAtIndex:rowIndex];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:voice];

    return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *) notification
{
    NSInteger row = [tableView selectedRow];
    if(row < 0)
    {
        return ;
    }

    NSString *selectedVoice = [voices objectAtIndex:row];
    [speechSynth setVoice:selectedVoice];
    NSLog(@"new voice selected: %@", selectedVoice);
}

- (void)awakeFromNib
{
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSInteger defaultRow = [voices indexOfObject:defaultVoice];
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:defaultRow];
    [tableView selectRowIndexes:index byExtendingSelection:NO];
    [tableView scrollRowToVisible:defaultRow];
}
@end
