//
//  ViewController.m
//  P2A
//
//  Created by Aaron Wojnowski on 2015-11-07.
//  Copyright © 2015 CS Boys. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController () <ViewDelegate>

@property (nonatomic, weak) IBOutlet NSView *colorView;
@property (weak) IBOutlet NSTextField *textLabel;

@end

@implementation ViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self colorView] setWantsLayer:YES];
    [[[self colorView] layer] setBackgroundColor:[[NSColor orangeColor] CGColor]];
    
    [(View *)[self view] setDelegate:self];
    
}

#pragma mark - ViewDelegate

-(void)viewChangedInputString:(NSString *)inputString {
    
    [[self textLabel] setStringValue:inputString];
    
}

-(void)viewMovedOffset:(CGFloat)offset {
    
    [[[self view] constraints] enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([constraint firstAttribute] == NSLayoutAttributeLeading && [constraint firstItem] == [self colorView]) {
            
            [constraint setConstant:[constraint constant] + offset];
            *stop = YES;
            
        }
        
    }];
    
}

@end
