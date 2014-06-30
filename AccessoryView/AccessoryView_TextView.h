//
//  AccessoryView_Base.h
//  Rohan Panchal
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AccessoryView_Base.h"

@interface AccessoryView_TextView : AccessoryView_Base

/**
 *  The UITextView this is an InputAccessoryView to
 */
@property (nonatomic, retain) UITextView *textView;

/**
 *  Init method which sets the ownerView and textField pointers to pTextField
 *
 *  @param pTextView A UITextView which is passed in and sets this object as its inputAccessoryView
 *
 *  @return (id) self
 */
-(id)initWithTextView:(UITextView*)pTextView;

/**
 *  Init method which sets the ownerView and textField pointers to pTextField and sets up the accessoryView ith the passed options
 *
 *  @param pTextView A UITextView which is passed in and sets this object as its inputAccessoryView
 *  @param buttonOptions Options passed which represent customization options for the accessoryView

 *
 *  @return (id) self
 */
-(id)initWithTextView:(UITextView*)pTextView andOptions:(AVButtonOptions)buttonOptions;

@end
