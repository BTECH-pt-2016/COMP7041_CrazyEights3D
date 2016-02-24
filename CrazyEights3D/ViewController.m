//
//  ViewController.m
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/15.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "Deck.h"
#import "Hand.h"
#import "Player.h"

@interface ViewController ()

@end

@implementation ViewController

int startNumber=7;// the number of cards a player has for the initialization

Player *NPC;
Player *player;
NSMutableArray *playableCardsForPlayer;


Card *topCard;
Deck *deck;

Boolean inGame;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // shuffle the cards and create a deck for this game
    deck = [[Deck alloc]init];
    
    // create player instance
    Hand *h = [[Hand alloc]initWithName:deck startNum:7];
    player = [[Player alloc]initWithName:NO hand:h name:@"Player 1"];
    
    // create NPC instance for
    Hand *h2 = [[Hand alloc]initWithName:deck startNum:7];
    NPC = [[Player alloc]initWithName:YES hand:h2 name:@"NPC 1"];
    
    [self setNPCDeck];
    [self setPlayerDeck];
    
    // start game
    inGame = YES;
    topCard = [deck drawCard]; //for first run draw a new top card.
    [self setTopCard];
    
    // NPC starts first
    [self runNPC];
}
-(void)setNPCDeck{
    self.NPCTextView.text =  [NSString stringWithFormat:@"NPC deck\n\n%@",[[NPC myHand]print]];
    
}
-(void) setPlayerDeck{
    self.PlayerTextView.text =  [NSString stringWithFormat:@"Player deck\n\n%@",[[player myHand]print]];
}
-(void)setTopCard{
    self.TopCardLabel.text = [NSString stringWithFormat:@"Top Card:%@\n",topCard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPlayableCards:(NSArray *)playableCards{
    NSMutableString * result = [[NSMutableString alloc]init];
    [result appendString:@"Play card or get 1 card from deck\n\n"];
    if([playableCards count]>0){
        for(int i = 0; i< [playableCards count];i++){
            [result appendString: [NSString stringWithFormat:@"%d : play %@\n",(i+1),[[playableCards objectAtIndex:i] name]]];
        }
    }else{
        [result appendString:@"0 : get card from stack\n"];
    }
    playableCardsForPlayer = [playableCards copy];
    self.SelectionTextVeiw.text = result;
}


/**
 * play card and put the previous top card to the deck
 * @param p
 */

-(void)playCard:(Player *)p{
    Card *temp = topCard;
    topCard = [[p myHand] play:topCard];
    if(temp!=topCard){//checks if player has returned a new card
        [deck receiveCard:temp];//if player has played a card return the card underneath to the deck
    }
    [self setTopCard];
}

- (IBAction)selectCard:(id)sender {
    if(inGame){
        NSInteger input = self.SelectionTextField.text.integerValue;
        if([playableCardsForPlayer count] == 0 && input != 0){
            NSLog(@"Please enter 0 to get 1 card from the deck");
        }else if(input>[playableCardsForPlayer count]){
            NSLog(@"Please enter number from 1 to %lu",(unsigned long)[playableCardsForPlayer count]);
        }else{
            if(input>0){
                [[player myHand] setPlay:[playableCardsForPlayer objectAtIndex:(input-1)]];
            }
            [self playCard:player];
            [self setPlayerDeck];
            if([[player myHand] size] == 0){//checks if a player has no more cards and therefore has won
                self.ResultLabel.text = [NSString stringWithFormat:@"%@ WON!",player];
                self.SelectionTextVeiw.text =@"";
                inGame = NO;
            }else{
                self.ResultLabel.text = [NSString stringWithFormat:@"%@'s Turn: (%d)",NPC,[[NPC myHand] size]];
                [self runNPC];
            }
        }
        self.SelectionTextField.text = @"";
    }
}

-(void) runNPC{
    self.ResultLabel.text = [NSString stringWithFormat:@"%@'s Turn: (%d)",NPC,[[NPC myHand] size]];
    [NPC turn:topCard]; //preform the players logic which will set the card they wish to play
    [self playCard:NPC];
    [self setNPCDeck];
    if ([[NPC myHand]size]== 0){ //checks if a player has no more cards and therefore has won
        self.ResultLabel.text = [NSString stringWithFormat:@"%@ WON!",NPC ];
        inGame=NO;
    }else{
        self.ResultLabel.text = [NSString stringWithFormat:@"%@'s Turn:(%d)",player,[[player myHand] size]];
        [self setPlayableCards: [[player myHand] playableCards:topCard]];
        [self setPlayerDeck];
    }
    
}

@end
