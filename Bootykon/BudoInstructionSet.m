#import "BudoInstructionSet.h"
#import "Instruction.h"

@implementation BudoInstructionSet

+(NSArray *)instructions {
    return @[
             [Instruction playMusicGenre:BUDO],
             [Instruction setDialogPath:@"Audio/Dialog/Budo"],
             [Instruction delay:10],
             [Instruction choices:@[
                 @[
                     [Instruction dialog:@"centerpunches"],
                     [self twenty],
                     [Instruction dialog:@"centerpunchdoubles"],
                     [self twenty],
                     [Instruction dialog:@"centerpunchdoubles-continued"],
                     [self twenty],
                 ],
                 @[
                     [Instruction dialog:@"pivotpunches"],
                     [self twenty],
                     [Instruction dialog:@"pivotpunches-continued"],
                     [self twenty],
                     [Instruction dialog:@"frontkick"],
                     [self twenty],
                     [Instruction dialog:@"frontkick-continued"],
                     [self twenty],
                 ],
            ]],
            [Instruction fadeOutMusic],
    ];
}

+(NSArray *)twenty {
    return @[
             [self hereWeGo],
             [Instruction choices:@[
                                    [Instruction dialog:@"one-1" skip:YES],
                                    [Instruction dialog:@"one-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"two-1" skip:YES],
                                    [Instruction dialog:@"two-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"three-1" skip:YES],
                                    [Instruction dialog:@"three-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"four-1" skip:YES],
                                    [Instruction dialog:@"four-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"five-1" skip:YES],
                                    [Instruction dialog:@"five-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"six-1" skip:YES],
                                    [Instruction dialog:@"six-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"seven-1" skip:YES],
                                    [Instruction dialog:@"seven-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"eight-1" skip:YES],
                                    [Instruction dialog:@"eight-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"nine-1" skip:YES],
                                    [Instruction dialog:@"nine-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"ten-1" skip:YES],
                                    [Instruction dialog:@"ten-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"ten-1" skip:YES],
                                    [Instruction dialog:@"ten-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"nine-1" skip:YES],
                                    [Instruction dialog:@"nine-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"eight-1" skip:YES],
                                    [Instruction dialog:@"eight-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"seven-1" skip:YES],
                                    [Instruction dialog:@"seven-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"six-1" skip:YES],
                                    [Instruction dialog:@"six-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"five-1" skip:YES],
                                    [Instruction dialog:@"five-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"four-1" skip:YES],
                                    [Instruction dialog:@"four-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"three-1" skip:YES],
                                    [Instruction dialog:@"three-2" skip:YES],
                                    ]],
             [Instruction choices:@[
                                    [Instruction dialog:@"two-1" skip:YES],
                                    [Instruction dialog:@"two-2" skip:YES],
                                    ]],
             [Instruction dialog:@"final-one" skip:YES],
             [Instruction setDialogPath:@"Audio/Dialog/Budo"],
             ];
}

+(NSArray *)hereWeGo {
    return @[
             [Instruction setDialogPath:@"Audio/Dialog/Budo/Counting"],
             [Instruction choices:@[
                 [Instruction dialog:@"herewego-1" skip:YES],
                 [Instruction dialog:@"herewego-2" skip:YES],
                 [Instruction dialog:@"herewego-3" skip:YES],
                 [Instruction dialog:@"herewego-4" skip:YES],
            ]]
    ];
}

@end
