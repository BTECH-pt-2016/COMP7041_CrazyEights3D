//
//  Hand.h
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/23.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface Hand : NSObject

@property (nonatomic) Deck *deck;
@property (nonatomic) Card *toPlay;
@property (nonatomic,retain) NSMutableArray *cards;

- (id)init;
- (id)initWithName:(Deck*)d startNum:(int)num;
- (void)start:(int) num;
- (void)pickup;
- (Card *) getCard:(int) i;
- (int)size;
- (void)setPlay:(Card *)c;
- (NSString *)print;
- (Card *)play:(Card *)topCard;
- (NSArray *)playableCards:(Card *)topCard;

@end