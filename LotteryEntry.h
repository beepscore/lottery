//
//  LotteryEntry.h
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject {
    // instance variables 
    
    // Use NSCalendar instead of deprecated NSCalendarDate.
    NSDate *entryDate;
    NSUInteger firstNumber;
    NSUInteger secondNumber;
}

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSDate *)theDate;

// better not to declare so readers see only designated initializer?
// init doesn't accept a date argument. Defaults to current date and time.
//- (id)init;

// accessor methods
// setter
- (void)setEntryDate:(NSDate *)aDate;

// getters
- (NSDate *)entryDate;
- (NSUInteger)firstNumber;
- (NSUInteger)secondNumber;

@end
