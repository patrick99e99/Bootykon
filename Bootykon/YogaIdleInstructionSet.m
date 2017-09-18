#import "YogaIdleInstructionSet.h"
#import "Instruction.h"

@implementation YogaIdleInstructionSet

+(Instruction *)instruction {
    return [Instruction choices:@[
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
                       ]];
}

+(NSString *)path {
    return @"Audio/Dialog/Idle";
}

@end
