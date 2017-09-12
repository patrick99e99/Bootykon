#import <Cocoa/Cocoa.h>
#import "McpDelegate.h"

@interface ViewController : NSViewController <McpDelegate>

@property (weak) IBOutlet NSTextField *musicStatus;
@property (weak) IBOutlet NSTextField *dialogStatus;

@end

