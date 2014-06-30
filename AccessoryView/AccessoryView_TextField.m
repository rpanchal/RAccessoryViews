//
//  AccessoryView_Base.h
//  Rohan Panchal
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import "AccessoryView_TextField.h"

@implementation AccessoryView_TextField



-(id)initWithTextField:(UITextField*)pTextField {

    self = [super initWithOptions:AVButtonOptionsNone];
    if (self) {

        self.ownerView = pTextField;
        self.textField = pTextField;



    }
    return self;
}

-(id)initWithTextField:(UITextField*)pTextField andOptions:(AVButtonOptions)buttonOptions {

    self = [super initWithOptions:buttonOptions];
    if (self) {

        self.ownerView = pTextField;
        self.textField = pTextField;

    }
    return self;
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
