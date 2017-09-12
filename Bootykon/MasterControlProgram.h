#import <Foundation/Foundation.h>
#import "McpDelegate.h"
#import "CompletableDelegate.h"

@protocol McpDelegate;

@interface MasterControlProgram : NSObject <CompletableDelegate>

-(instancetype)initWithDelegate:(id<McpDelegate>)delegate;
-(void)start;
-(void)stop;
-(void)next;
-(void)previous;
-(BOOL)isActive;

@end
