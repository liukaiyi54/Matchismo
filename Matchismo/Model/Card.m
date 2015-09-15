//
//  Card.m
//  Matchismo
//
//  Created by Michael on 9/14/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSInteger)match:(NSArray *)otherCards {
    NSInteger score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
