#import "JukeBox.h"
#import "CompletableDelegate.h"

@interface JukeBox ()

@property (nonatomic, copy) NSArray *fileList;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, getter=isFading) BOOL fading;
@property (nonatomic) NSUInteger index;
@property (nonatomic) float volume;
@property (nonatomic, weak) id<CompletableDelegate> delegate;

@end

@implementation JukeBox

-(instancetype)initWithVolume:(float)volume delegate:(id<CompletableDelegate>)delegate {
    if (self = [super init]) {
        self.volume   = volume;
        self.delegate = delegate;
    }
    return self;
}

-(void)setGenre:(bootyGenre)genre {
    _genre = genre;
    [self.player stop];
    self.fileList = [self fetchFileList];
    if (genre == YOGA) {
        if (arc4random_uniform(2)) {
            self.index = 22;
        } else {
            self.index = 1;
        }
    } else {
        [self chooseRandomTrack];
    }
}

-(BOOL)isPlaying {
    return [self.player isPlaying];
}

-(void)play {
    if (self.isFading || self.isPlaying) {
        NSLog(@"already playing!");
        return;
    }
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self url] error:&error];
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
        [self.delegate didComplete];
    }
}

-(void)chooseRandomTrack {
    NSUInteger index = self.index;
    do {
        self.index = arc4random_uniform((int)[self.fileList count]);
    } while (self.index == index);
}

-(NSString *)path {
    switch (self.genre) {
        case MEDITATION:
            return @"Audio/Music/Meditation";
        case YOGA:
            return @"Audio/Music/Yoga";
        case BUDO:
            return @"Audio/Music/Budo";
        default:
            return nil;
    }
}

-(NSArray *)fetchFileList {
    NSError *error;
    NSArray *fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self fullPath] error:&error];
    if (error) { NSLog(@"%@", [error description]); }
    return fileList;
}

-(NSString *)currentTrack {
    return [self.fileList objectAtIndex:self.index];
}

-(NSString *)currentTrackDisplayName {
    NSString *genre = [[[self path] componentsSeparatedByString:@"/"] lastObject];
    return [NSString stringWithFormat:@"%@ Track %@", genre, [[self currentTrack] stringByDeletingPathExtension]];
}

-(NSURL *)url {
    return [NSURL URLWithString:[[self fullPath] stringByAppendingPathComponent:[self currentTrack]]];
}

-(NSString *)fullPath {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[self path]];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self chooseRandomTrack];
    [self play];
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    NSLog(@"error! %@ ", [error description]);
}

@end
