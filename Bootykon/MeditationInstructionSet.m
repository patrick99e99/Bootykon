#import "MeditationInstructionSet.h"
#import "Instruction.h"

@implementation MeditationInstructionSet

+(NSArray *)instructions {
  return @[
    [Instruction playMusicGenre:MEDITATION],
    [Instruction delay:10],
    [Instruction setDialogPath:@"Audio/Dialog/Meditation"],
    [Instruction choices:@[
        [Instruction dialog:@"intro-1"],
        [Instruction dialog:@"intro-2"],
        [Instruction dialog:@"intro-3"],
        [Instruction dialog:@"intro-4"],
    ]],
    [Instruction delay:10],
    [Instruction fadeOutMusic],
  ];
}

@end
