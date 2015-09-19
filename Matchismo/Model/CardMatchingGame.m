//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Michael on 9/19/15.
//  Copyright © 2015 Michael. All rights reserved.
//

#import "CardMatchingGame.h"

static const NSInteger MISMATCH_PENALTY = 2;
static const NSInteger MATCH_BONUS = 4;
static const NSInteger COST_TO_CHOOSE = 1;

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (NSInteger i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against other chosen cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    NSInteger matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;  // if mismatch, unchoose the card
                    }
                    break; //can only choose 2 cards
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}












@end
