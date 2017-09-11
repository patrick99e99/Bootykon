#import "JukeBox.h"
#import "InstructionSet.h"

@interface JukeBox ()

@property (nonatomic, copy) NSArray *songs;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSString *genrePath;
@property (nonatomic, strong) InstructionSet *instructionSet;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, getter=isFading) BOOL fading;
@property (nonatomic) float volume;

@end

@implementation JukeBox

-(instancetype)initWithInstructionSet:(InstructionSet *)instructionSet {
    if (self = [super init]) {
        self.instructionSet = instructionSet;
        self.volume         = 1.0f;
    }
    return self;
}

-(void)start {
    if (self.isFading) return;
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self.instructionSet url] error:&error];
    if (error) {
        NSLog(@"error: %@", [error description]);
    }
    self.player.delegate = self;
    self.player.volume   = self.volume;
    [self.player play];
}

-(void)stop {
    [self.player stop];
}

-(void)fadeOut {
    self.fading = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                                  target:self
                                                selector:@selector(decrementVolume)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)decrementVolume {
    self.player.volume -= 0.01f;
    if (self.player.volume <= 0.0f) {
        self.player.volume = 0.0f;
        self.fading = NO;
        [self.timer invalidate];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.instructionSet advance];
    if (![self.instructionSet isComplete]) {
        NSTimeInterval delay = [self.instructionSet delay];
        [self performSelector:@selector(start) withObject:nil afterDelay:delay];
    }
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    NSLog(@"error! %@ ", [error description]);
}

@end
