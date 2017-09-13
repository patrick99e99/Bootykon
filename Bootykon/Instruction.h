#import <Foundation/Foundation.h>
#import "JukeBox.h"

typedef NS_ENUM(NSUInteger, bootyInstructionType) {
    DELAY_INSTRUCTION = 0,
    MUSIC_INSTRUCTION,
    DIALOG_INSTRUCTION,
    SET_DIALOG_PATH_INSTRUCTION,
    FADE_OUT_MUSIC_INSTRUCTION,
    SET_INSTRUCTION,
};

@interface Instruction : NSObject

+(instancetype)playMusicGenre:(bootyGenre)genre;
+(instancetype)delay:(NSTimeInterval)delay;
+(instancetype)delayWithMin:(NSTimeInterval)min max:(NSTimeInterval)max;
+(instancetype)setDialogPath:(NSString *)path;
+(instancetype)dialog:(NSString *)fileName;
+(instancetype)dialog:(NSString *)fileName skip:(BOOL)skip;
+(instancetype)fadeOutMusic;
+(instancetype)choices:(NSArray *)choices;
-(instancetype)initWithInstructionType:(bootyInstructionType)instructionType;

@property (nonatomic, weak) Instruction *next;
@property (nonatomic, weak) Instruction *previous;

-(bootyInstructionType)instructionType;
-(NSTimeInterval)delay;
-(NSString *)fileName;
-(NSString *)dialogPath;
-(bootyGenre)genre;
-(BOOL)skip;

@end
