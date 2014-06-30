//
//  AccessoryView.h
//  WeDeliver
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 We Deliver. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AccessoryView_Base.h"

/**
 *  This class represents an InputAccessoryView for a UITextField. Derives from AccessoryView_Base and 
 */
@interface AccessoryView_TextField : AccessoryView_Base


/**
 *  The UITextField this is an InputAccessoryView to
 */
@property (nonatomic, retain) UITextField *textField;

/**
 *  Init method which sets the ownerView and textField pointers to pTextField
 *
 *  @param pTextField A UITextField which is passed in and sets this object as its inputAccessoryView
 *
 *  @return (id) self
 */
-(id)initWithTextField:(UITextField*)pTextField;

/**
 *  Init method which sets the ownerView and textField pointers to pTextField and sets up the accessoryView ith the passed options
 *
 *  @param pTextField A UITextVField which is passed in and sets this object as its inputAccessoryView
 *  @param buttonOptions Options passed which represent customization options for the accessoryView
 *
 *  @return (id) self
 */
-(id)initWithTextField:(UITextField*)pTextField andOptions:(AVButtonOptions)buttonOptions;


@end
