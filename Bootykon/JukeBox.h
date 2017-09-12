#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol CompletableDelegate;
@class DisasterInstructionSet;

typedef NS_ENUM(NSUInteger, bootyGenre) {
    MEDITATION = 0,
    YOGA,
    BUDO,
    COUNTING,
};

@interface JukeBox : NSObject <AVAudioPlayerDelegate>

@property (nonatomic) bootyGenre genre;

-(instancetype)initWithVolume:(float)volume delegate:(id<CompletableDelegate>)delegate;
-(void)play;
-(void)stop;
-(void)fadeOut;
-(NSString *)currentTrackDisplayName;

@end
