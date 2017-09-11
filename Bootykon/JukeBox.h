#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class InstructionSet;

@interface JukeBox : NSObject <AVAudioPlayerDelegate>

-(instancetype)initWithInstructionSet:(InstructionSet *)instructionSet;
-(void)start;
-(void)stop;
-(void)fadeOut;
-(void)setVolume:(float)volume;

@end
