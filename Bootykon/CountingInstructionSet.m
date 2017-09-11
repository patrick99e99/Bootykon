#import "CountingInstructionSet.h"

@interface CountingInstructionSet ()

@end

@implementation CountingInstructionSet

-(NSString *)path {
    return @"Audio/Dialog/Counting";
}

-(NSArray *)instructions {
    return @[
          @"one",
          @"two",
          @"three",
          @"four",
          @"five",
          @"six",
          @"seven",
          @"eight",
          @"nine",
          @"ten",
          @"ten",
          @"nine",
          @"eight",
          @"seven",
          @"six",
          @"five",
          @"four",
          @"three",
          @"two",
          @"final-one",
    ];
}

@end
