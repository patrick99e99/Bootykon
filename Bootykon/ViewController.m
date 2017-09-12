#import "ViewController.h"
#import "MasterControlProgram.h"

@interface ViewController ()

@property (nonatomic, strong) MasterControlProgram *mcp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)didTapStart:(NSButton *)sender {
    if ([self.mcp isActive]) {
        [self.mcp stop];
        sender.title = @"Start";
        self.musicStatus.stringValue = @"";
        self.dialogStatus.stringValue = @"";
    } else {
        sender.title = @"Stop";
        [self.mcp start];
    }
}

- (IBAction)didTapNext:(id)sender {
    [self.mcp next];
}

- (IBAction)didTapPrevious:(id)sender {
    [self.mcp previous];
}

-(MasterControlProgram *)mcp {
    if (!_mcp) {
        self.mcp = [[MasterControlProgram alloc] initWithDelegate:self];
    }
    return _mcp;
}

# pragma mark - McpDelegate

-(void)shouldUpdateDialogStatus:(NSString *)status {
    if (!status) status = @"";
    self.dialogStatus.stringValue = status;
}

-(void)shouldUpdateMusicStatus:(NSString *)status {
    if (!status) status = @"";
    self.musicStatus.stringValue = status;
}

@end
