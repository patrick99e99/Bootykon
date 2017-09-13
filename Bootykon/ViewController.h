#import <Cocoa/Cocoa.h>
#import "McpDelegate.h"

@interface ViewController : NSViewController <McpDelegate>

@property (weak) IBOutlet NSTextField *musicStatus;
@property (weak) IBOutlet NSTextField *dialogStatus;
@property (weak) IBOutlet NSButton *backButton;
@property (weak) IBOutlet NSButton *nextButton;
@property (weak) IBOutlet NSButton *startButton;

@end

