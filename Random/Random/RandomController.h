//
//  RandomController.h
//  Random
//
//  Created by liangfen on 16/9/17.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomController : NSObject
{
    //IBOutlet id textField;
}

@property (atomic, assign) IBOutlet id textField;

-(IBAction)seed:(id)sender;
-(IBAction)generate:(id)sender;

//-(void) awakeFromNib;

@end
