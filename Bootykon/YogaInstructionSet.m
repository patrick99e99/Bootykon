#import "YogaInstructionSet.h"
#import "Instruction.h"

@implementation YogaInstructionSet

+(NSArray *)instructions {
    return @[
                [Instruction playMusicGenre:YOGA],
                [Instruction setDialogPath:@"Audio/Dialog/Yoga"],
                [Instruction delay:2],
                [Instruction choices:@[
                                       [Instruction dialog:@"catcow-1"],
                                       [Instruction dialog:@"catcow-2"],
                                     ]],
                [Instruction delay:60],
                [Instruction choices:@[
                    [Instruction dialog:@"plank-1"],
                    [Instruction dialog:@"plank-2"],
                    [Instruction dialog:@"plank-3"],
                    [Instruction dialog:@"plank-4"],
                ]],
                [Instruction delay:10],
                [Instruction dialog:@"downdog"],
                [Instruction delay:45],
                [Instruction choices:@[
                    @[
                        [Instruction dialog:@"vinyasa-1"],
                        [Instruction delay:2],
                        [Instruction dialog:@"vinyasa-1-continued"],
                    ],
                    @[
                        [Instruction dialog:@"vinyasa-2"],
                        [Instruction delay:2],
                        [Instruction dialog:@"vinyasa-2-continued"],
                    ],
                ]],
                [Instruction delay:60],
                [Instruction choices:@[
                    @[
                        [Instruction dialog:@"rollingknee"],
                        [Instruction delay:15],
                        [Instruction dialog:@"rollingwavefromchildspose"],
                    ],
                    @[
                        [Instruction dialog:@"tabletop"],
                        [Instruction delay:10],
                        [Instruction choices:@[
                            [Instruction dialog:@"tabletop-continued-1"],
                            [Instruction delay:15],
                            [Instruction dialog:@"tabletop-continued-2"],
                            [Instruction delay:20],
                            [Instruction dialog:@"rollingwave"],
                        ]],
                    ],
                ]],
                [Instruction delay:45],
                [Instruction dialog:@"rollinglunges"],
                [Instruction delay:120],
                [Instruction dialog:@"floatinglunges"],
                [Instruction delay:15],
                [Instruction choices:@[
                    [Instruction dialog:@"backbend"],
                    [Instruction dialog:@"prayertwist"],
                ]],
                [Instruction delay:15],
                [Instruction dialog:@"forwardbend"],
                [Instruction delay:70],
                [Instruction choices:@[
                    [Instruction dialog:@"tree"],
                    [Instruction dialog:@"chair"],
                    [Instruction dialog:@"warriorthree"],
                ]],
                [Instruction delay:10],
                [Instruction dialog:@"floatingfrog"],
                [Instruction delay:90],
                [Instruction dialog:@"dancingdog"],
                [Instruction delay:90],
                [Instruction choices:@[
                    [Instruction dialog:@"exaltedwarrior"],
                    [Instruction dialog:@"highblocklowblock"],
                ]],
                [Instruction delay:15],
                [Instruction choices:@[
                    [Instruction dialog:@"floatingbrazilians"],
                    [Instruction delay:15],
                    @[
                        [Instruction dialog:@"kungfustretches"],
                        [Instruction delay:15],
                        [Instruction dialog:@"kungfustretches-continued"],
                        [Instruction delay:15],
                    ]
                ]],
                [Instruction dialog:@"theend"],
                [Instruction fadeOutMusic],
    ];
}

@end
