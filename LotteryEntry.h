//
//  LotteryEntry.h
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject {
    // instance variables    
    NSDate *entryDate;
    int firstNumber;
    int secondNumber;
}
// This declaration in header is optional because
// we are overriding the parent class methods
// - (NSString *)description;

// better not to show this so readers see only designated initializer?
//- (id)init;

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
