//
//  AppDelegate.m
//  whitebar
//
//  Created by George Nachman on 11/5/20.
//

#import "AppDelegate.h"

@interface MyAccessory: NSTitlebarAccessoryViewController
@end

@implementation MyAccessory

- (instancetype)init {
    self = [super init];
    if (self) {
        self.layoutAttribute = NSLayoutAttributeRight;
    }
    return self;
}

- (void)loadView {
    NSTextField *result = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 0, 0)];
        result.font = [NSFont systemFontOfSize:12];
        result.bezeled = NO;
        result.editable = NO;
        result.selectable = NO;
        result.drawsBackground = NO;
        result.usesSingleLineMode = YES;
    result.stringValue = @"Hi";
    [result sizeToFit];
    self.view = result;


}

@end
@interface MyView: NSView
@end

@implementation MyView

- (instancetype)init {
    self = [super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:0.17 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self setNeedsDisplay:YES];
        }];
    }
    return self;
}
- (void)drawRect:(NSRect)rect {
    [[NSColor colorWithRed:arc4random_uniform(255) / 2550.0 green:arc4random_uniform(255) / 2550.0 blue:arc4random_uniform(255) / 2550.0 alpha:1] set];
    NSRectFill(rect);
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)becomeFirstResponder {
    return YES;
}

- (void)keyDown:(NSEvent *)event {
    NSLog(@"%@", event);
}
@end
@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.window.contentView = [[MyView alloc] init];
    [self.window addTitlebarAccessoryViewController:[[MyAccessory alloc] init]];
    [self.window makeFirstResponder:self.window.contentView];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
