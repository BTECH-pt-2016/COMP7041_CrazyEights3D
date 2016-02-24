//
//  Hand.m
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/23.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import "Hand.h"

@interface Hand()

@end

@implementation Hand

- (id)init{
    if (self = [super init]) {
        self.deck = [[Deck alloc] init];
        self.toPlay = nil;
        self.cards = [[NSMutableArray alloc]init];
    }
    return self;
}
- (id)initWithName:(Deck*)d startNum:(int)num{
    if (self = [super init]) {
        self.deck = d;
        self.toPlay = nil;
        self.cards = [[NSMutableArray alloc]init];
        [self start: num];
    }
    return self;
}

- (void)start:(int) num{
    for (int i=0; i<num; i++) {
        [self pickup];
    }
}
- (void)pickup{
    Card *temp =[self.deck drawCard];
    [self.cards addObject:temp];
}

- (Card *) getCard:(int) i{
    return [self.cards objectAtIndex:i];
}

- (int)size{
    return [self.cards count];
}

- (void)setPlay:(Card *)c{
    self.toPlay = c;
}

- (NSString *)print{
    NSMutableString *result = [[NSMutableString alloc]init];
    for (int i=0; i<[self.cards count]; i++){
        [result appendString:[[self.cards objectAtIndex: i] description]];
        [result appendString:@"\n"];
    }
    return result;
}
- (Card *)play:(Card *)topCard{
    // if card exists and has either the same suit or value but not both (exclusive or)
    if(self.toPlay!=nil && ([self.toPlay suit] == [topCard suit]
                      ^ [self.toPlay value]== [topCard value])){
        NSLog(@"Card %@ has been played on %@\n",[self.toPlay description],[topCard description]);
        // return the card to be played, remove it from the hand, make toPlay null
        NSUInteger index = [self.cards indexOfObject:self.toPlay];
        [self.cards removeObjectAtIndex:index];
        Card* temp= self.toPlay;
        self.toPlay= nil;
        return temp;
    }else{
        //return the origional card recieved and set toPlay to null
        [self pickup];
        self.toPlay=nil;
        return topCard;
    }
}
- (NSArray *)playableCards:(Card *)topCard{
    NSMutableArray * playableCards = [[NSMutableArray alloc]init];
    for (int i = 0; i < [self.cards count]; i++) {
        Card *temp = [self.cards objectAtIndex:i];
        if ([temp suit]== [topCard suit]
            || [temp value] == [topCard value]) {
            [playableCards addObject:temp];
        }
    }
    return playableCards;
}

@end