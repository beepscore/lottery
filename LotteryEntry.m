//
// LotteryEntry.m
//

#import "LotteryEntry.h"

@implementation LotteryEntry

// Override the superclass' designated initializer init.
// If someone calls init by accident, that won't call only superclass.
// Instead init will call 
// LotteryEntry's designated initializer initWithEntryDate:
// Ref Hillegass pg 57
- (id)init {
    // init doesn't accept a date argument. Default to current date and time.
    // NSDate class method +date returns current date and time.
    return [self initWithEntryDate:[NSDate date]];
}

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSDate *)theDate {
    
    // call super's designated initializer init
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
    // Use NSDateFormatter -setDateFormat: 
    // instead of deprecated NSCalendarDate -descriptionWithCalendarFormat:
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];            
    [myDateFormatter setDateFormat:@"EEEE dd MMMM yyyy"];
    NSString *myDateString = [myDateFormatter stringFromDate:[self entryDate]];
    [myDateFormatter release];

    return [NSString stringWithFormat:@"%@ = %d and %d",
            myDateString, [self firstNumber], [self secondNumber]];
}

// ref Hillegass pg 71
- (void)dealloc {
    
    NSLog(@"deallocing %@", self);
    [entryDate release];
    [super dealloc];
}

@end
