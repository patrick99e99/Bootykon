#import "MusicInstructionSet.h"

@interface MusicInstructionSet ()
@property (nonatomic) bootyGenre genre;
@end

@implementation MusicInstructionSet

-(instancetype)initWithGenre:(bootyGenre)genre {
    if (self = [super init]) {
        self.genre = genre;
        [self selectFile];
    }
    return self;
}

-(void)advance {
    NSUInteger index = self.index;
    do {
        [self selectFile];
    } while (self.index == index);
}

-(void)selectFile {
    self.index = arc4random_uniform((int)[self.fileList count]);
    self.file  = [self.fileList objectAtIndex:self.index];
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

@end
