//
//  AccessoryView_Base.h
//  Rohan Panchal
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import "AccessoryView_Base.h"

@implementation AccessoryView_Base

@synthesize delegate;

@synthesize ownerView;

@synthesize toolbar;
@synthesize btnDone;
@synthesize segCtlBarButton;
@synthesize segCtlIter;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithOptions:(AVButtonOptions)buttonOptions {

    self = [super initWithFrame:CGRectMake(0, 0, 320, 40)];
    if (self) {

        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];

        toolbar.barStyle = UIBarStyleDefault;

        [self setupWithOptions:buttonOptions];
        
    }
    return self;
}

-(void)setupWithOptions:(AVButtonOptions)buttonOptions {

    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];


    switch (buttonOptions) {
        case 0:

            break;

        case 1:

            self.btnDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(btnDone_Clicked:)];

            [self.toolbar setItems:[NSArray arrayWithObjects:flexSpace, self.btnDone, nil] animated:NO];
            [self addSubview:self.toolbar];

            break;

        case 2:


            self.segCtlIter = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Prev", @"Next", nil]];
            [self.segCtlIter setMomentary:YES];

            [self.segCtlIter addTarget:self action:@selector(segCtl_ValueChanged:) forControlEvents:UIControlEventValueChanged];

            self.segCtlBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.segCtlIter];

            [self.toolbar setItems:[NSArray arrayWithObjects:segCtlBarButton, flexSpace, nil] animated:NO];
            [self addSubview:self.toolbar];

            break;

        case 3:

            self.segCtlIter = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Prev", @"Next", nil]];
            [self.segCtlIter setMomentary:YES];

            [self.segCtlIter addTarget:self action:@selector(segCtl_ValueChanged:) forControlEvents:UIControlEventValueChanged];

            self.segCtlBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.segCtlIter];

            self.btnDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(btnDone_Clicked:)];

            [self.toolbar setItems:[NSArray arrayWithObjects:self.segCtlBarButton, flexSpace, self.btnDone, nil]];
            [self addSubview:self.toolbar];
            
            break;
            
        default:
            break;
    }
    
    
}


-(IBAction)segCtl_ValueChanged:(UISegmentedControl*)control {

    if (self.delegate == nil) {
        return;
    }

    switch ([control selectedSegmentIndex]) {
        case 0:
            [self.delegate AccessoryView:self tappedPrevSegmentedControl:control fromView:self.ownerView];
            break;

        case 1:
            [self.delegate AccessoryView:self tappedNextSegmentedControl:control fromView:self.ownerView];
            break;

        default:
            break;
    }

}

-(IBAction)btnDone_Clicked:(id)sender {
    [self.delegate AccessoryView:self tappedDone:self.btnDone fromView:self.ownerView];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
