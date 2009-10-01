//
// LotteryEntry.m
//

#import "LotteryEntry.h"

@implementation LotteryEntry

// This class has designated initializer initWithEntryDate:
// So, override the superclass' designated initializer.  Ref Hillegass pg 57
- (id)init {
    
    return [self initWithEntryDate:[NSCalendarDate calendarDate]];
}

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSCalendarDate *)theDate {
    
    // call super's designated initializer
    if (![super init])
        return nil;
    
    NSAssert(theDate != nil, @"Argument must be non-nil");
    entryDate = [theDate retain];
    firstNumber = (random() % 100) + 1;
    secondNumber = (random() % 100) + 1;
    return self;
}

// accessor methods
// setter
- (void)setEntryDate:(NSCalendarDate *)date {
    
    // ref Hillegass pg 75-77
    [date retain];
    [entryDate release];
    entryDate = date;
}

// getters.  The method has the same name as the instance variable
- (NSCalendarDate *)entryDate {
    
    return entryDate;
}

- (int)firstNumber {
    
    return firstNumber; 
}

- (int)secondNumber {
    
    return secondNumber; 
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ = %d and %d", 
            // Change date format string.  Ref Hillegass pg 51, 54, 63.
            [[self entryDate] descriptionWithCalendarFormat:@"%A %d %B %Y"],
            [self firstNumber], [self secondNumber]];
}

- (void)dealloc {
    
    NSLog(@"deallocing %@", self);
    [entryDate release];
    [super dealloc];
}

@end
