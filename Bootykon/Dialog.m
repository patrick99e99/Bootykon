#import "Dialog.h"
#import "CompletableDelegate.h"

@interface Dialog ()

@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, weak) id<CompletableDelegate> delegate;

@end

@implementation Dialog

-(instancetype)initWithDelegate:(id<CompletableDelegate>)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
     }
    return self;
}

-(void)speak:(NSString *)fileName path:(NSString *)path {
    [self stop];
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self urlFor:fileName path:path] error:&error];
    if (error) {
        NSLog(@"error: %@", [error description]);
    }
    self.player.delegate = self;
    self.player.volume   = 1.0f;
    [self.player play];
}

-(void)stop {
    [self.player stop];
}

-(NSURL *)urlFor:(NSString *)fileName path:(NSString *)path {
    NSString *fullPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path];
    return [NSURL URLWithString:[fullPath stringByAppendingPathComponent:[fileName stringByAppendingPathExtension:@"m4a"]]];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.delegate didComplete];
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    NSLog(@"error! %@ ", [error description]);
}

@end
