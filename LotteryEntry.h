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
    
    NSDate *entryDate;
    int firstNumber;
    int secondNumber;
}
// Theses declaration in header are optional because
// we are overriding the declaration in parent class NSObject
// - (NSString *)description;

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSDate *)theDate;

// accessor methods
// setter
- (void)setEntryDate:(NSDate *)date;

// getters
- (NSDate *)entryDate;
- (int)firstNumber;
- (int)secondNumber;

@end
