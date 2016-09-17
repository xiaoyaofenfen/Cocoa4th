//
//  RandomController.m
//  Random
//
//  Created by liangfen on 16/9/17.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import "RandomController.h"

@implementation RandomController

@synthesize textField;

-(IBAction)seed:(id)sender
{
    int generated;
    generated = (int) (random() % 100) + 1;

    NSLog(@"generated: %d", generated);

    [textField setStringValue:[NSString stringWithFormat:@"%d", generated]];
}
-(IBAction)generate:(id)sender
{
    srand((unsigned)time(NULL));
    [textField setStringValue:@"Generate seeded"];
}

-(void) awakeFromNib
{
    NSDate *date = [NSDate date];
    [textField setObjectValue:date];

}
@end
