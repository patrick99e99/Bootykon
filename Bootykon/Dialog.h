#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol CompletableDelegate;

@interface Dialog : NSObject <AVAudioPlayerDelegate>

-(instancetype)initWithDelegate:(id<CompletableDelegate>)delegate;
-(void)speak:(NSString *)fileName path:(NSString *)path;
-(void)stop;

@end
