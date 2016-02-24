//
//  Player.h
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/23.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Hand.h"

@interface Player : NSObject

@property (nonatomic) Hand *myHand;
@property (nonatomic) Boolean AI;
@property (nonatomic, copy) NSString *name;

- (id)init;
- (id)initWithName:(Boolean)ai_ hand:(Hand *)hand_ name:(NSString *)name_;
- (void)turn:(Card *)topCard;
-(NSString *)description;

@end
