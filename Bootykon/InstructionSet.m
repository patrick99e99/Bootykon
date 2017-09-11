#import "InstructionSet.h"

@interface InstructionSet ()
@property (nonatomic, strong) NSArray *fileList;
@property (nonatomic) NSTimeInterval minDelay;
@property (nonatomic) NSTimeInterval maxDelay;
@end

@implementation InstructionSet

-(instancetype)initWithMinDelay:(NSTimeInterval)minDelay maxDelay:(NSTimeInterval)maxDelay {
    if (self = [super init]) {
        self.minDelay = minDelay;
        self.maxDelay = maxDelay;
        [self selectFile];
    }
    return self;
}

-(instancetype)initWithDelay:(NSTimeInterval)delay {
    return [self initWithMinDelay:delay maxDelay:delay];
}

-(NSTimeInterval)delay {
    NSTimeInterval offset = (self.maxDelay - self.minDelay) * (arc4random_uniform(10) * 0.1f);
    return self.minDelay + offset;
}

-(NSURL *)url {
    return [NSURL URLWithString:[[self fullPath] stringByAppendingPathComponent:self.file]];
}

-(NSString *)path {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(NSString *)fullPath {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[self path]];
}

-(void)advance {
    self.index += 1;
    [self selectFile];
}

-(void)selectFile {
    NSArray *instructions = [self instructions];
    if (self.index < [instructions count]) {
        NSArray *collection = [self filteredFor:[instructions objectAtIndex:self.index]];
        self.file = [collection objectAtIndex:arc4random_uniform((int)[collection count])];
    } else {
        self.file = nil;
    }
}

-(BOOL)isComplete {
    return !self.file;
}

-(NSArray *)filteredFor:(NSString *)filter {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] %@", filter];
    return [self.fileList filteredArrayUsingPredicate:predicate];
}

-(NSArray *)instructions {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(NSArray *)fileList {
    if (!_fileList) {
        NSError *error;
        _fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self fullPath] error:&error];
        if (error) { NSLog(@"%@", [error description]); }
    }
    return _fileList;
}

@end
