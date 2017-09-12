#import "BootykonView.h"

@implementation BootykonView

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor blackColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
    [super drawRect:dirtyRect];
}

@end
