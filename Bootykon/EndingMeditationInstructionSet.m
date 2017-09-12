#import "EndingMeditationInstructionSet.h"
#import "Instruction.h"

@implementation EndingMeditationInstructionSet

+(NSArray *)instructions {
    return @[
             [Instruction playMusicGenre:MEDITATION],
             [Instruction delay:10],
             [Instruction setDialogPath:@"Audio/Dialog/Meditation"],
             [Instruction dialog:@"cooldown"],
             [Instruction choices:@[
                 [Instruction dialog:@"outro-1"],
                 [Instruction dialog:@"outro-2"],
                 [Instruction dialog:@"outro-3"],
             ]],
             [Instruction delay:60],
             [Instruction fadeOutMusic],
    ];
}

@end
