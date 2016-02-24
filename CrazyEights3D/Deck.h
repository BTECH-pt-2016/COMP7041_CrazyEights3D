//
//  Deck.h
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/23.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic, retain) NSMutableArray *cards;

- (id)init;
- (void)shuffle;
- (NSString *)print;
- (Card *)drawCard;
- (void)receiveCard:(Card *)c;

@end
