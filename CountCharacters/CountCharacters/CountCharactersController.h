//
//  CountCharactersController.h
//  CountCharacters
//
//  Created by liangfen on 16/9/18.
//  Copyright © 2016年 Imagination Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountCharactersController : NSObject
@property (nonatomic, assign) IBOutlet id textFiled, label;

-(IBAction)countCharaters:(id) sender;

@end
