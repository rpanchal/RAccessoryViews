//
//  AccessoryView_Base.h
//  Rohan Panchal
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import "AccessoryView_Base.h"

@interface AccessoryView_Base ()

@property int optionIndex;

@property NSString *doneBtnName;

@end

@implementation AccessoryView_Base

@synthesize delegate;

@synthesize ownerView;

@synthesize toolbar;
@synthesize btnDone;

@synthesize segCtlBarButton;
@synthesize segCtlIter;

@synthesize textFieldBarButton;
@synthesize textField;

@synthesize optionIndex;

@synthesize doneBtnName;

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
        
        self.optionIndex = buttonOptions;

        [self setupWithOptions:buttonOptions];
        
    }
    return self;
}

-(id)initWithOptions:(AVButtonOptions)buttonOptions andDoneButtonName:(NSString*)btnName {
    
    self = [super initWithFrame:CGRectMake(0, 0, 320, 40)];
    if (self) {
        
        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        
        toolbar.barStyle = UIBarStyleDefault;
        
        self.optionIndex = buttonOptions;
        
        [self setupWithOptions:buttonOptions];
        
    }
    return self;
    
}

-(void)setupWithOptions:(AVButtonOptions)buttonOptions {

    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];


    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    
    switch (buttonOptions) {
        case 0:

            break;

        case 1:
            
            [itemsArray addObject:flexSpace];
            [itemsArray addObject:[self generateDoneButton]];
            
            [self.toolbar setItems:itemsArray animated:NO];
            
            [self addSubview:self.toolbar];

            break;

        case 2:

            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Prev", @"Next", nil]]];

            [self.toolbar setItems:itemsArray animated:NO];
            
            [self addSubview:self.toolbar];

            break;
            
        case 3:
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Next", nil]]];
            
            [self.toolbar setItems:itemsArray animated:NO];
            
            [self addSubview:self.toolbar];
            
            break;
            
        case 4:
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Prev", nil]]];
            
            [self.toolbar setItems:itemsArray animated:NO];
            
            [self addSubview:self.toolbar];
            
            break;

        case 5:
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Prev", @"Next", nil]]];
            
            [itemsArray addObject:flexSpace];
            
            [itemsArray addObject:[self generateDoneButton]];
            
            [self.toolbar setItems:itemsArray];

            [self addSubview:self.toolbar];
            
            break;
            
        case 6:
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Next", nil]]];
            
            [itemsArray addObject:flexSpace];
            
            [itemsArray addObject:[self generateDoneButton]];
            
            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
            
            
        case 7:
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Prev", nil]]];
            
            [itemsArray addObject:flexSpace];
            
            [itemsArray addObject:[self generateDoneButton]];
            
            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
            
        case 8:
        {
            
            [itemsArray addObject:[self generateBarButtonWithTextFieldWithWidth:290]];
           
            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
        }
        case 9:
        {
            
            [itemsArray addObject:[self generateBarButtonWithTextFieldWithWidth:240]];
            
            [itemsArray addObject:[self generateDoneButton]];
            
            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
        }
        case 10:
        {
            
            [itemsArray addObject:[self generateBarButtonWithTextFieldWithWidth:200]];
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Prev", @"Next", nil]]];

            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
        }
            
        case 11:
        {
            
            [itemsArray addObject:[self generateBarButtonWithTextFieldWithWidth:240]];
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Next", nil]]];
            
            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
            
        }
        case 12:
        {
            [itemsArray addObject:[self generateBarButtonWithTextFieldWithWidth:200]];
            
            [itemsArray addObject:[self generateBarButtonWithSegmentedControl:[NSArray arrayWithObjects:@"Prev", nil]]];
            
            [self.toolbar setItems:itemsArray];
            
            [self addSubview:self.toolbar];
            
            break;
        }
            
        default:
            break;
    }
    
    
}


-(UIBarButtonItem*)generateBarButtonWithTextFieldWithWidth:(CGFloat)width {
    
    self.textFieldBarButton = [[UIBarButtonItem alloc] initWithCustomView:[self generateTextFieldWithWidth:width]];
    
    return self.textFieldBarButton;
}

-(UITextField*)generateTextFieldWithWidth:(CGFloat)width {
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width, 40)];
    
    self.textField.placeholder = @"text";
    
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.ownerView = self.textField;
    
    return self.textField;
}

-(UIBarButtonItem*)generateBarButtonWithSegmentedControl:(NSArray*)items {
    
    self.segCtlBarButton = [[UIBarButtonItem alloc] initWithCustomView:[self generateSegmentedControlWithItems:items]];
    
    return self.segCtlBarButton;
}

-(UISegmentedControl*)generateSegmentedControlWithItems:(NSArray*)items {
    
    self.segCtlIter = [[UISegmentedControl alloc] initWithItems:items];
    [self.segCtlIter setMomentary:YES];
    
    [self.segCtlIter addTarget:self action:@selector(segCtl_ValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return self.segCtlIter;
}

-(UIBarButtonItem*)generateDoneButton {
    
    self.btnDone = [[UIBarButtonItem alloc] initWithTitle:self.doneBtnName style:UIBarButtonItemStyleDone target:self action:@selector(btnDone_Clicked:)];
    
    return self.btnDone;
}

-(CGSize)calculateSizeForDoneButton {
    
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
    NSDictionary *userAttributes = @{NSFontAttributeName: font,
                                     NSForegroundColorAttributeName: [UIColor blackColor]};
    CGSize textSize = [doneBtnName sizeWithAttributes: userAttributes];
    
    return textSize;
}

-(CGFloat)getWidthForTextField {
    
    if (self.doneBtnName == nil) {
        return 290;
    }

    
    CGSize doneSize = [self calculateSizeForDoneButton];

    CGFloat textFieldSize = 320;
    
    textFieldSize = textFieldSize - 15;
    
    textFieldSize = textFieldSize - doneSize.width;
    
    return textFieldSize;
}

-(IBAction)segCtl_ValueChanged:(UISegmentedControl*)control {

    if (self.delegate == nil) {
        return;
    }
    
    switch (self.optionIndex) {
        case 0:
            
            break;
            
        case 1:
            
            break;
            
        case 2:
            
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
            
            break;
            
        case 3:
            
            [self.delegate AccessoryView:self tappedNextSegmentedControl:control fromView:self.ownerView];
            
            break;
            
        case 4:

            [self.delegate AccessoryView:self tappedPrevSegmentedControl:control fromView:self.ownerView];
            
            break;
            
        case 5:
            
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
            
            break;
            
            
        case 6:
            
            [self.delegate AccessoryView:self tappedNextSegmentedControl:control fromView:self.ownerView];
            
            break;
            
        case 7:
            
            [self.delegate AccessoryView:self tappedPrevSegmentedControl:control fromView:self.ownerView];
            
            break;
            
        case 8:
            
            break;
            
        case 9:
            
            break;
            
        case 10:
            
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
            
            break;
            
        case 11:
            [self.delegate AccessoryView:self tappedNextSegmentedControl:control fromView:self.ownerView];
            break;
            
        case 12:
            [self.delegate AccessoryView:self tappedPrevSegmentedControl:control fromView:self.ownerView];
            
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
