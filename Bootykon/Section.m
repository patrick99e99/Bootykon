#import "Section.h"
#import "JukeBox.h"
#import "MusicInstructionSet.h"
#import "MeditationInstructionSet.h"

@interface Section ()
@property (nonatomic, strong) JukeBox *musicBox;
@property (nonatomic, strong) JukeBox *dialogBox;
@end

@implementation Section

-(void)start {
    MusicInstructionSet *musicInstructionSet = [[MusicInstructionSet alloc] initWithGenre:MEDITATION];
    self.musicBox = [[JukeBox alloc] initWithInstructionSet:musicInstructionSet];
    [self.musicBox setVolume:0.7f];
    [self.musicBox start];

    MeditationInstructionSet *meditationInstructionSet = [[MeditationInstructionSet alloc] initWithDelay:0.0f];
    self.dialogBox = [[JukeBox alloc] initWithInstructionSet:meditationInstructionSet];
    [self.dialogBox start];
}

@end
