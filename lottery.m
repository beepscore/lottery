//
// lottery.m
//
// Steve Baker 
// UW CP-120 Certificate in iPhone and Cocoa Development
// Q1 Intro to Programming in Objective-C and the Cocoa Framework.
// Homework assignment 28 Sep 09 part 2.
// Ref Hillegass Ch 03 including challenge pg 63, Ch 04.
// SB Replaced deprecated NSCalendarDate.
// Used NSCalendar, NSDate, and NSDateComponents instead.

#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main (int argc, const char * argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // Create the date object.
    // [[NSDate alloc] init] and [NSDate date] both return current date and time.
    NSDate *now = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    
    // Seed the random number generator
    srandom(time(NULL));
    NSMutableArray *array;
    array = [[NSMutableArray alloc] init];
    
    int i;
    for (i = 0; i < 10; i++) {
        
        // Create a NSDate object that is 'i' weeks from now
        [dateComps setWeek:i];
        NSDate *iWeeksFromNow;
        iWeeksFromNow = [gregorian dateByAddingComponents:dateComps toDate:now options:0];
        [iWeeksFromNow retain];
        
        // Create a new instance of LotteryEntry
        LotteryEntry *newEntry = [[LotteryEntry alloc]
                                  initWithEntryDate:iWeeksFromNow];
        
        // Add the LotteryEntry object to the array
        [array addObject:newEntry];
        [iWeeksFromNow release];
        [newEntry release];
    }

    // Ref Hillegass Ch 04 pg 68
    [now release];
    [gregorian release];
    [dateComps release];
    now = nil;
    gregorian = nil;
    dateComps = nil;

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
