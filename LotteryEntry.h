//
//  LotteryEntry.h
//  lottery
//
//  Created by Steve Baker on 9/6/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject {
    // instance variables
    NSCalendarDate *entryDate;
    int firstNumber;
    int secondNumber;
}
// Theses declaration in header are optional because
// we are overriding the declaration in parent class NSObject
// - (NSString *)description;

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSCalendarDate *)theDate;

// accessor methods
// setter
- (void)setEntryDate:(NSCalendarDate *)date;

// getters
- (NSCalendarDate *)entryDate;
- (int)firstNumber;
- (int)secondNumber;

@end
