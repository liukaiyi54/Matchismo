//
//  Deck.m
//  Matchismo
//
//  Created by Michael on 9/15/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (nonatomic, strong)NSMutableArray *cards;

@end

@implementation Deck

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard {
    Card *randomCard;
    
    if (self.cards.count) {
        NSUInteger index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

@end
