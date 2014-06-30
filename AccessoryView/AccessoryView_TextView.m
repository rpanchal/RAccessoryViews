//
//  AccessoryView_Base.h
//  Rohan Panchal
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import "AccessoryView_TextView.h"

@implementation AccessoryView_TextView

@synthesize textView;

-(id)initWithTextView:(UITextView*)pTextView {

    self = [super initWithOptions:AVButtonOptionsNone];
    if (self) {
        self.ownerView = pTextView;
        self.textView = pTextView;

    }
    return self;
}

-(id)initWithTextView:(UITextView*)pTextView andOptions:(AVButtonOptions)buttonOptions {

    self = [super initWithOptions:buttonOptions];
    if (self) {
        self.ownerView = pTextView;
        self.textView = pTextView;
        
    }
    return self;
}






@end
