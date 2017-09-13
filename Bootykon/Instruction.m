#import "Instruction.h"

@interface Instruction ()

@property (nonatomic) bootyInstructionType instructionType;
@property (nonatomic) NSTimeInterval minDelay;
@property (nonatomic) NSTimeInterval maxDelay;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *dialogPath;
@property (nonatomic) bootyGenre genre;
@property (nonatomic) BOOL skip;

@end

@implementation Instruction

+(instancetype)playMusicGenre:(bootyGenre)genre {
    Instruction *instruction = [[Instruction alloc] initWithInstructionType:MUSIC_INSTRUCTION];
    instruction.genre = genre;
    return instruction;
}

+(instancetype)delay:(NSTimeInterval)delay {
    return [self delayWithMin:delay max:delay];
}

+(instancetype)delayWithMin:(NSTimeInterval)min max:(NSTimeInterval)max {
    Instruction *instruction = [[Instruction alloc] initWithInstructionType:DELAY_INSTRUCTION];
    instruction.minDelay = min;
    instruction.maxDelay = max;
    return instruction;
}

+(instancetype)setDialogPath:(NSString *)path {
    Instruction *instruction = [[Instruction alloc] initWithInstructionType:SET_DIALOG_PATH_INSTRUCTION];
    instruction.dialogPath = path;
    return instruction;
}

+(instancetype)dialog:(NSString *)fileName {
    return [self dialog:fileName skip:NO];
}

+(instancetype)dialog:(NSString *)fileName skip:(BOOL)skip {
    Instruction *instruction = [[Instruction alloc] initWithInstructionType:DIALOG_INSTRUCTION];
    instruction.skip = skip;
    instruction.fileName = fileName;
    return instruction;
}

+(instancetype)fadeOutMusic {
    Instruction *instruction = [[Instruction alloc] initWithInstructionType:FADE_OUT_MUSIC_INSTRUCTION];
    return instruction;
}

+(instancetype)choices:(NSArray *)choices {
    return [choices objectAtIndex:arc4random_uniform((int)[choices count])];
}

-(instancetype)initWithInstructionType:(bootyInstructionType)instructionType {
    if (self = [super init]) {
        self.instructionType = instructionType;
    }
    return self;
}

-(NSTimeInterval)delay {
    return self.minDelay + ((self.maxDelay - self.minDelay) * arc4random_uniform(11) * 0.1f);
}

@end
