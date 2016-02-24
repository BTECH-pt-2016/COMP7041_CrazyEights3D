//
//  Card.m
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/22.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import "Card.h"

@interface Card()

+ (NSArray *)suits;
+ (NSArray *)ranks;

@end

@implementation Card

- (id)init{
    if (self = [super init]) {
        self.value = 13;
        self.suit = 3;
        self.name = [NSString stringWithFormat:@"%@ of %@",[[Card ranks] objectAtIndex:13], [[Card suits] objectAtIndex:3]];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.name];
}

-(id)initWithName:(int )value_ suit:(int)suit_
{
    self = [super init];
    if (self) {
        self.value = value_;
        self.suit = suit_;
        self.name = [NSString stringWithFormat:@"%@ of %@",[[Card ranks] objectAtIndex:value_], [[Card suits] objectAtIndex:suit_]];
    }
    return self;
}


+ (NSArray *)suits
{
    static NSArray *_suits;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _suits = @[@"Harts",
                    @"Spades",
                    @"Diamonds",
                    @"Clubs"];
    });
    return _suits;
}

+ (NSArray *)ranks
{
    static NSArray *_ranks;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _ranks = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"Jo"];
    });
    return _ranks;
}

@end