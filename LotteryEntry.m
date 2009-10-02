//
// LotteryEntry.m
//

#import "LotteryEntry.h"

@implementation LotteryEntry

// This class has designated initializer initWithEntryDate:
// So, override the superclass' designated initializer.  Ref Hillegass pg 57
- (id)init {
    
    return [self initWithEntryDate:[NSDate date]];
}

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSDate *)theDate {
    
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
- (void)setEntryDate:(NSDate *)date {
    
    // ref Hillegass pg 75-77
    [date retain];
    [entryDate release];
    entryDate = date;
}

// getters.  The method has the same name as the instance variable
- (NSDate *)entryDate {
    
    return entryDate;
}

- (int)firstNumber {
    
    return firstNumber; 
}

- (int)secondNumber {
    
    return secondNumber; 
}

- (NSString *)description {
    
    // Change date format.  Ref Hillegass pg 51, 54, 63.
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];            
    [outputFormatter setDateFormat:@"HH:mm 'on' EEEE MMMM d"];
    NSString *myDateString = [outputFormatter stringFromDate:[self entryDate]];
    [outputFormatter release];

    return [NSString stringWithFormat:@"%@, %d, %d",
            myDateString, [self firstNumber], [self secondNumber]];
}

- (void)dealloc {
    
    NSLog(@"deallocing %@", self);
    [entryDate release];
    [super dealloc];
}

@end
