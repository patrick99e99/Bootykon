#import "ViewController.h"
#import "Section.h"

@interface ViewController ()

@property (nonatomic, strong) Section *section;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CountingInstructionSet *instructionSet = [[CountingInstructionSet alloc] initWithMinDelay:0.5f maxDelay:5.0f];
    self.section = [[Section alloc] init];
    [self.section start];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)button:(id)sender {
}

@end
