#import "IdleInstructionSet.h"
#import "Instruction.h"

@implementation IdleInstructionSet

+(NSString *)dialogPath {
    return @"Audio/Dialog/Idle";
}

+(NSArray *)instructions {
    return @[
             [Instruction choices:@[
                                    [Instruction dialog:@"awesome"],
                                    [Instruction dialog:@"canyoufeelyourassyet"],
                                    [Instruction dialog:@"comeonpatches"],
                                    [Instruction dialog:@"good"],
                                    [Instruction dialog:@"great"],
                                    [Instruction dialog:@"mmmm"],
                                    [Instruction dialog:@"patrickstopscreaming"],
                                    [Instruction dialog:@"pussies"],
                                    [Instruction dialog:@"rockitout"],
                                    [Instruction dialog:@"yeah"],
                                    ]],
             ];
}

@end
