//
//  CountCharactersController.m
//  CountCharacters
//
//  Created by liangfen on 16/9/18.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "CountCharactersController.h"

@implementation CountCharactersController
@synthesize textFiled, label;

-(IBAction)countCharaters:(id) sender
{
    NSString *text = [textFiled stringValue];
    NSLog(@"the text is : %@", text);

    NSInteger count = [text length];
    if(count == 0)
    {
        [label setStringValue:@"empty"];
    }
    else
    {
        [label setStringValue:[NSString stringWithFormat:@"\'%@\' has %ld characters", text, count]];
    }
}
@end
