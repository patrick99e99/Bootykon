#import "MasterControlProgram.h"
#import "JukeBox.h"
#import "MeditationInstructionSet.h"
#import "YogaInstructionSet.h"
#import "BudoInstructionSet.h"
#import "EndingMeditationInstructionSet.h"
#import "Instruction.h"
#import "Dialog.h"
#import "McpDelegate.h"

@interface MasterControlProgram ()

@property (nonatomic, strong) JukeBox *jukeBox;
@property (nonatomic, strong) Dialog *dialog;
@property (nonatomic, strong) NSArray *instructions;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) int delay;
@property (nonatomic) NSUInteger index;
@property (nonatomic, copy) NSString *dialogPath;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, weak) id<McpDelegate> delegate;
@property (nonatomic, getter=isActive) BOOL active;

@end

@implementation MasterControlProgram

-(instancetype)initWithDelegate:(id<McpDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
        NSMutableArray *flattened = [NSMutableArray array];
        [self flattenInstructionsFor:@[
                                       [MeditationInstructionSet instructions],
                                       [YogaInstructionSet instructions],
                                       [BudoInstructionSet instructions],
                                       [EndingMeditationInstructionSet instructions],
                                       ] flattenedInstructions:flattened];
        self.instructions = [flattened copy];
    }
    return self;
}

-(void)start {
    self.active = YES;
    self.index = 0;
    [self executeCurrentInstruction];
}

-(void)stop {
    [self.dialog stop];
    [self.jukeBox stop];
    [self.timer invalidate];
    self.active = NO;
}

-(void)flattenInstructionsFor:(NSArray *)instructions flattenedInstructions:(NSMutableArray *)flattenedInstructions {
    for (Instruction *instruction in instructions) {
        if ([instruction isKindOfClass:[NSArray class]]) {
            [self flattenInstructionsFor:(NSArray *)instruction flattenedInstructions:flattenedInstructions];
        } else {
            [flattenedInstructions addObject:instruction];
        }
    }
}

-(void)previous {
    if (self.index <= 1) return;
    [self.timer invalidate];
    Instruction *instruction;
    NSUInteger index = self.index;
    int targetIndex = -1;

    Instruction *musicInstruction;
    Instruction *dialogPathInstruction;

    while (index > 0) {
        index -= 1;
        Instruction *instruction = [self.instructions objectAtIndex:index];
        bootyInstructionType instructionType = [instruction instructionType];
        if (instructionType == DIALOG_INSTRUCTION && ![instruction skip]) {
            targetIndex = (int)index;
            break;
        }
    }

    if (targetIndex < 0) return;
    
    while (!musicInstruction || !dialogPathInstruction) {
        index -= 1;
        instruction = [self.instructions objectAtIndex:index];
        bootyInstructionType instructionType = [instruction instructionType];
        if (!musicInstruction && instructionType == MUSIC_INSTRUCTION) {
            musicInstruction = instruction;
        } else if (!dialogPathInstruction && instructionType == SET_DIALOG_PATH_INSTRUCTION) {
            dialogPathInstruction = instruction;
        }
    }
    
    if (musicInstruction.genre != self.jukeBox.genre) {
        self.jukeBox.genre = instruction.genre;
        [self playJukeBox];
    }

    self.dialogPath = dialogPathInstruction.dialogPath;
    
    self.index = targetIndex;
    [self executeCurrentInstruction];
}

-(void)next {
    NSUInteger limit = [self.instructions count] - 1;
    Instruction *instruction;
    [self.timer invalidate];
    int index = (int)self.index;
    while (index < limit) {
        index += 1;
        instruction = [self.instructions objectAtIndex:index];
        bootyInstructionType instructionType = [instruction instructionType];
        if (instructionType == DELAY_INSTRUCTION || instructionType == FADE_OUT_MUSIC_INSTRUCTION || [instruction skip]) continue;
        [self executeCurrentInstruction:NO];
        if ([instruction instructionType] == DIALOG_INSTRUCTION) {
            self.index = index;
            return;
        }
    }
}

-(void)executeCurrentInstruction {
    [self executeCurrentInstruction:YES];
}

-(void)playJukeBox {
    [self.delegate shouldUpdateMusicStatus:[NSString stringWithFormat:@"Playing song: %@", [self.jukeBox currentTrackDisplayName]]];
    [self.jukeBox play];
}

-(void)executeCurrentInstruction:(BOOL)autoAdvance {
    if (self.index >= [self.instructions count]) return;
    Instruction *instruction = [self.instructions objectAtIndex:self.index];
    
    switch ([instruction instructionType]) {
        case MUSIC_INSTRUCTION:
            [self.jukeBox setGenre:[instruction genre]];
            [self playJukeBox];
            if (autoAdvance) [self executeNextInstruction];
            break;
        case DELAY_INSTRUCTION:
            self.delay = (int)[instruction numberOfSeconds];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                          target:self
                                                        selector:@selector(timerDidTick)
                                                        userInfo:nil
                                                         repeats:YES];
            break;
        case DIALOG_INSTRUCTION:
            [self.dialog stop];
            self.dialog = [[Dialog alloc] initWithDelegate:self];
            [self.delegate shouldUpdateDialogStatus:[NSString stringWithFormat:@"Nathan is speaking: %@", [instruction fileName]]];
            [self.dialog speak:[instruction fileName] path:self.dialogPath];
            break;
        case SET_DIALOG_PATH_INSTRUCTION:
            [self.delegate shouldUpdateDialogStatus:[NSString stringWithFormat:@"Setting dialog path to %@", [instruction dialogPath]]];
            self.dialogPath = [instruction dialogPath];
            if (autoAdvance) [self executeNextInstruction];
            break;
        case FADE_OUT_MUSIC_INSTRUCTION:
            [self.delegate shouldUpdateMusicStatus:[NSString stringWithFormat:@"Fading out music"]];
            [self.jukeBox fadeOut];
            break;
        default:
            NSLog(@"unknown instruction!");
            break;
    }
}

-(void)executeNextInstruction {
    self.index += 1;
    [self executeCurrentInstruction];
}

-(JukeBox *)jukeBox {
    if (!_jukeBox) {
        _jukeBox = [[JukeBox alloc] initWithVolume:0.3f delegate:self];
    }
    return _jukeBox;
}

-(void)timerDidTick {
    self.delay -= 1;
    [self.delegate shouldUpdateDialogStatus:[NSString stringWithFormat:@"Delaying for %i...", self.delay]];
    if (self.delay <= 0) {
        [self.timer invalidate];
        [self executeNextInstruction];
    }
}

# pragma mark - CompletableDelegate

-(void)didComplete {
    [self executeNextInstruction];
}

@end
