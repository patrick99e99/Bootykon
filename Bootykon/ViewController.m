#import "ViewController.h"
#import "MasterControlProgram.h"

@interface ViewController ()

@property (nonatomic, strong) MasterControlProgram *mcp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backButton.hidden = YES;
    self.nextButton.hidden = YES;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)didTapStart:(id)sender {
    if ([self.mcp isActive]) {
        [self stop];
    } else {
        [self start];
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

-(void)stop {
    [self.mcp stop];
    self.startButton.title = @"Start";
    self.musicStatus.stringValue = @"";
    self.dialogStatus.stringValue = @"";
    self.backButton.hidden = YES;
    self.nextButton.hidden = YES;
}

-(void)start {
    self.startButton.title = @"Stop";
    [self.mcp start];
    self.backButton.hidden = NO;
    self.nextButton.hidden = NO;
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

-(void)didFinishProgram {
    [self stop];
}

@end
