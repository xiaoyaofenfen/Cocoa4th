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

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;

@end

@implementation AppDelegate
{
    NSSpeechSynthesizer *speechSynth;
}

@synthesize textField, speakButton, stopButton;

-(instancetype) init
{
    self = [super init];
    if(self)
    {
        NSLog(@"init the AppDelegate");
        speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];

        [speechSynth setDelegate: self];
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
    NSLog(@"staring speaking: %@", text);
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)success
{
    NSLog(@"the state of speech synthesizer: %d", success);

    speakButton.enabled = YES;
    stopButton.enabled = NO;
}

@end
