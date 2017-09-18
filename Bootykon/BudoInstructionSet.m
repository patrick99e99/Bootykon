#import "BudoInstructionSet.h"
#import "Instruction.h"

@implementation BudoInstructionSet

+(NSArray *)instructions {
    return @[
             [Instruction playMusicGenre:BUDO],
             [Instruction setDialogPath:@"Audio/Dialog/Budo"],
             [Instruction delay:2],
             [Instruction choices:@[
                 @[
                     [Instruction dialog:@"pivotpunches"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"pivotpunches-continued"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"frontkick"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"frontkick-continued"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"catstance"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"catstance-continued"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"pivotingroundkick"],
                     [self tenWithDelayMin:1.5f max:2.5f],
                     [Instruction dialog:@"pivotingroundkick-continued"],
                     [self tenWithDelayMin:1.5f max:2.5f],
                     [Instruction dialog:@"combination"],
                     [Instruction dialog:@"leapingleopard"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                 ],
                 @[
                     [Instruction dialog:@"centerpunches"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"centerpunchdoubles"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"centerpunchdoublescontinued"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"lungepunch"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"lungepunch-continued"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"brazillionkick"],
                     [self tenWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"brazillionkick-continued"],
                     [self tenWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"catstance"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"catstance-continued"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"fightingcrocodile"],
                     [self twentyWithDelayMin:2.5f max:3.5f],
                     ],
                 @[
                     [Instruction dialog:@"centerpunches"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"catstance"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"catstance-continued"],
                     [self twentyWithDelayMin:1.0f max:1.5f],
                     [Instruction dialog:@"assworkoutpart1"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"assworkoutpart2"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"assworkoutpart3"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"assworkoutpart4"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"assworkoutpart5"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                     [Instruction dialog:@"assworkoutpart6"],
                     [self twentyWithDelayMin:0.25f max:1.0f],
                ]
            ]],
            [Instruction fadeOutMusic],
    ];
}

+(NSArray *)tenWithDelayMin:(NSTimeInterval)min max:(NSTimeInterval)max {
    return @[
             [Instruction delay:2],
             [self hereWeGo],
             [Instruction delay:1],
             [Instruction choices:@[
                                    [Instruction dialog:@"one-1" skip:YES],
                                    [Instruction dialog:@"one-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"two-1" skip:YES],
                                    [Instruction dialog:@"two-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"three-1" skip:YES],
                                    [Instruction dialog:@"three-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"four-1" skip:YES],
                                    [Instruction dialog:@"four-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"five-1" skip:YES],
                                    [Instruction dialog:@"five-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"six-1" skip:YES],
                                    [Instruction dialog:@"six-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"seven-1" skip:YES],
                                    [Instruction dialog:@"seven-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"eight-1" skip:YES],
                                    [Instruction dialog:@"eight-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"nine-1" skip:YES],
                                    [Instruction dialog:@"nine-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"ten-1" skip:YES],
                                    [Instruction dialog:@"ten-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction delay:2],
             [Instruction setDialogPath:@"Audio/Dialog/Budo"],
             ];
}

+(NSArray *)twentyWithDelayMin:(NSTimeInterval)min max:(NSTimeInterval)max {
    return @[
             [Instruction delay:2],
             [self hereWeGo],
             [Instruction delay:1],
             [Instruction choices:@[
                                    [Instruction dialog:@"one-1" skip:YES],
                                    [Instruction dialog:@"one-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"two-1" skip:YES],
                                    [Instruction dialog:@"two-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"three-1" skip:YES],
                                    [Instruction dialog:@"three-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"four-1" skip:YES],
                                    [Instruction dialog:@"four-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"five-1" skip:YES],
                                    [Instruction dialog:@"five-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"six-1" skip:YES],
                                    [Instruction dialog:@"six-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"seven-1" skip:YES],
                                    [Instruction dialog:@"seven-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"eight-1" skip:YES],
                                    [Instruction dialog:@"eight-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"nine-1" skip:YES],
                                    [Instruction dialog:@"nine-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"ten-1" skip:YES],
                                    [Instruction dialog:@"ten-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"ten-1" skip:YES],
                                    [Instruction dialog:@"ten-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"nine-1" skip:YES],
                                    [Instruction dialog:@"nine-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"eight-1" skip:YES],
                                    [Instruction dialog:@"eight-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"seven-1" skip:YES],
                                    [Instruction dialog:@"seven-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"six-1" skip:YES],
                                    [Instruction dialog:@"six-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"five-1" skip:YES],
                                    [Instruction dialog:@"five-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"four-1" skip:YES],
                                    [Instruction dialog:@"four-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"three-1" skip:YES],
                                    [Instruction dialog:@"three-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction choices:@[
                                    [Instruction dialog:@"two-1" skip:YES],
                                    [Instruction dialog:@"two-2" skip:YES],
                                    ]],
             [Instruction delayWithMin:min max:max],
             [Instruction dialog:@"final-one" skip:YES],
             [Instruction delay:2],
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
