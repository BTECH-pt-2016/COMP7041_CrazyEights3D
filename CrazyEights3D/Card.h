//
//  Card.h
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/22.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) int suit;
@property (nonatomic) int value;
@property (nonatomic, copy) NSString *name;

- (id)init;
-(id)initWithName:(int )value_ suit:(int)suit_;
@end
