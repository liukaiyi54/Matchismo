//
//  Card.h
//  Matchismo
//
//  Created by Michael on 9/14/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter=isMatched) BOOL matched;
@property (nonatomic, getter=isChosen) BOOL chosen;

- (NSInteger) match:(NSArray *)otherCards;

@end
