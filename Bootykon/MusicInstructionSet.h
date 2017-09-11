#import "InstructionSet.h"

typedef NS_ENUM(NSUInteger, bootyGenre) {
    MEDITATION = 0,
    YOGA,
    BUDO,
    COUNTING,
};

@interface MusicInstructionSet : InstructionSet

-(instancetype)initWithGenre:(bootyGenre)genre;

@end
