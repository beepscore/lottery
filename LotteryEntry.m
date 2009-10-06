//
// LotteryEntry.m
//

#import "LotteryEntry.h"

@implementation LotteryEntry

// Override the superclass' designated initializer init.
// If someone calls init by accident, this method will run and call
// LotteryEntry's designated initializer initWithEntryDate:
// Ref Hillegass pg 57
- (id)init {
    // NSDate class method +date returns current date and time.
    return [self initWithEntryDate:[NSDate date]];
}

// designated initializer.  Ref Hillegass pg 57
- (id)initWithEntryDate:(NSDate *)theDate {
    
    // call super's designated initializer init
    if (![super init])
        return nil;
    
    NSAssert(theDate != nil, @"Argument must be non-nil");
    // best practice- use setter accessor methods within init methods,
    // don't assign instance variable directly
    [self setEntryDate:theDate];
    firstNumber = (random() % 100) + 1;
    secondNumber = (random() % 100) + 1;
    return self;
}

// accessor methods
// setter
- (void)setEntryDate:(NSDate *)aDate {
    
    // ref Hillegass pg 75-77
    [aDate retain];
    [entryDate release];
    entryDate = aDate;
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

// Override description method.
// Standard practice is not to declare it in header,
// but to use declaration from super class or NSObject.
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
