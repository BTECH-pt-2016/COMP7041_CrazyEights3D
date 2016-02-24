//
//  Deck.m
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/23.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import "Deck.h"
#include <stdlib.h>


@interface Deck()

@end

@implementation Deck
- (id)init{
    if (self = [super init]) {
        self.cards = [[NSMutableArray alloc] init];
        int i=0;
        for (int a=0; a<13; a++) {
            for (int b=0; b<4 ; b++) {
                [self.cards addObject:[[Card alloc]initWithName:a suit:b]];
                i++;
            }
        }
        [self shuffle];
    }
    return self;
}
- (void)shuffle{
    for (int i=0; i<[self.cards count]; i++){
        //Card *temp = [self.cards objectAtIndex: i];
        int random = arc4random_uniform([self.cards count]-1);
        [self.cards exchangeObjectAtIndex:i  withObjectAtIndex:random];
        //self.cards.set(i,cards.get(random));
        //self.cards.set(random,temp);
    }
    
}
- (NSString *)print{
    NSMutableString *result = [[NSMutableString alloc]init];
    for (int i=0; i<[self.cards count]; i++){
        [result appendString:[[self.cards objectAtIndex: i] description]];
        [result appendString:@"\n"];
    }
    return result;
    
}
- (Card *)drawCard{
    if ([self.cards count]==0){
        NSLog(@"OUT OF CARDS");
        return nil;
    }else{
        Card *temp =[self.cards objectAtIndex: [self.cards count]-1];
        [self.cards removeObjectAtIndex:[self.cards count]-1];
        NSLog(@"Card %@ drawn from deck\n",temp);
        return temp;
    }
    
}
- (void)receiveCard:(Card *)c{
    NSLog(@"Card %@ replaced to deck\n",c);
    [self.cards addObject:c];
    int random = arc4random_uniform([self.cards count]-1);
    [self.cards exchangeObjectAtIndex:[self.cards count]-1  withObjectAtIndex:random];
}

@end
