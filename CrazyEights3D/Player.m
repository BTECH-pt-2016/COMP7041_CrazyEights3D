//
//  Player.m
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/23.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import "Player.h"

@interface Player()

@end

@implementation Player

- (id)init{
    if (self = [super init]) {
        self.myHand = [[Hand alloc] init];
        self.AI = NO;
        self.name = nil;
    }
    return self;
}

- (id)initWithName:(Boolean)ai_ hand:(Hand *)hand_ name:(NSString *)name_{
    if (self = [super init]) {
        self.myHand = hand_;
        self.AI = ai_;
        self.name = name_;
    }
    return self;
}

/**
 * this function is used just for AI, see the top card and play a card if possible
 * @param topCard
 */
- (void)turn:(Card *)topCard{
    
    NSLog(@"%@'s Turn: (%d)",self.name,[self.myHand size]);
    [self.myHand print];
    if (self.AI) {
        for (int i = 0; i < [self.myHand size]; i++) {
            Card * temp = [self.myHand getCard:i];
            if ([temp suit] == [topCard suit]
                || [temp value] == [topCard value]) {
                [self.myHand setPlay:temp];
                break;
            }
        }
    }

}

-(NSString *)description{
    return self.name;
}

@end