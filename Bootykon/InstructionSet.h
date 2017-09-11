#import <Foundation/Foundation.h>

@interface InstructionSet : NSObject

@property (nonatomic) int index;
@property (nonatomic, strong) NSString *file;

-(instancetype)initWithMinDelay:(NSTimeInterval)minDelay maxDelay:(NSTimeInterval)maxDelay;
-(instancetype)initWithDelay:(NSTimeInterval)delay;
-(NSTimeInterval)delay;
-(NSURL *)url;
-(NSString *)path;
-(NSString *)file;
-(NSArray *)fileList;
-(void)advance;
-(BOOL)isComplete;

@end
