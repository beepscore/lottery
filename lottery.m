// lottery.m
//
// Steve Baker 
// UW CP-120 Certificate in iPhone and Cocoa Development
// Q1 Intro to Programming in Objective-C and the Cocoa Framework.
// Homework assignment 28 Sep 09 part 2.
// Ref Hillegass Ch 03 including challenge pg 63, Ch 04.

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main (int argc, const char * argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    //Create the date object
    NSCalendarDate *now = [[NSCalendarDate alloc] init];
    
    // Seed the random number generator
    srandom(time(NULL));
    NSMutableArray *array;
    array = [[NSMutableArray alloc] init];
    
    int i;
    for (i = 0; i < 10; i++) {
        
        // Create a date/time object that is 'i' weeks from now
        NSCalendarDate *iWeeksFromNow;
        iWeeksFromNow = [now dateByAddingYears:0
                                        months:0
                                          days:(i * 7)
                                         hours:0 
                                       minutes:0 
                                       seconds:0];
        
        // Create a new instance of LotteryEntry
        LotteryEntry *newEntry = [[LotteryEntry alloc]
                                  initWithEntryDate:iWeeksFromNow];
        
        // Add the LotteryEntry object to the array
        [array addObject:newEntry];
        [newEntry release];
    }
    // Ref Hillegass Ch 04 pg 68
    // Done with 'now'
    [now release];
    now = nil;

    // Fast enumerate loop print each entry
    for (LotteryEntry *entryToPrint in array) {
        NSLog(@"%@", entryToPrint);
    }
    // Done with 'array'
    [array release];
    array = nil;
    [pool drain];
    NSLog(@"GC = %@", [NSGarbageCollector defaultCollector]);
    return 0;
}
