//
//  AccessoryView_Base.h
//  Rohan Panchal
//
//  Created by Rohan on 1/21/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {

    AVButtonOptionsNone = 0,
    AVButtonOptionsDone = 1,
    AVButtonOptionsIter = 2,
    AVButtonOptionsNext = 3,
    AVButtonOptionsPrev = 4,
    AVButtonOptionsDoneAndIter = 5,
    AVButtonOptionsDoneAndNext = 6,
    AVButtonOptionsDoneAndPrev = 7,
    AVButtonOptionsTextField = 8,
    AVButtonOptionsTextFieldAndDone = 9,
    AVButtonOptionsTextFieldAndIter = 10,
    AVButtonOptionsTextFieldAndNext = 11,
    AVButtonOptionsTextFieldAndPrev = 12

} AVButtonOptions;

@class AccessoryView_Base;

@protocol AccessoryView_Delegate <NSObject>

/**
 *  Delegate method called when the prev button is tapped
 *
 *  @param accessoryView The AccessoryView which is calling the delegate method
 *  @param segCtl        The UISegmentedControl which contains this button
 *  @param view          The ownerView
 */
-(void)AccessoryView:(AccessoryView_Base*)accessoryView tappedPrevSegmentedControl:(UISegmentedControl*)segCtl fromView:(UIView*)ownerView;

/**
 *  Delegate method called when the next button is tapped
 *
 *  @param accessoryView The AccessoryView which is calling the delegate method
 *  @param segCtl        The UISegmentedControl which contains this button
 *  @param view          The ownerView
 */
-(void)AccessoryView:(AccessoryView_Base*)accessoryView tappedNextSegmentedControl:(UISegmentedControl*)segCtl fromView:(UIView*)ownerView;

/**
 *  Delegate method called when the done button is tapped
 *
 *  @param accessoryView The AccessoryView which is calling the delegate method
 *  @param btnDone       The UIBarButtonItem which was tapped
 *  @param view          The ownerView
 */
-(void)AccessoryView:(AccessoryView_Base*)accessoryView tappedDone:(UIBarButtonItem*)btnDone fromView:(UIView*)ownerView;



@end

/**
 *  This class represents the base class for an InputAccessoryView for UITextFields (AccessoryView_TextField) and UITextViews (AccessoryView_TextView). The objects are instantiated with AVButtonOptions which specify which buttons the view will contain.
 */
@interface AccessoryView_Base : UIInputView

/**
 *  Delegate for the AccessoryView_Base which conforms to protocol: AccessoryView_Delegate
 */
@property id<AccessoryView_Delegate>delegate;

/**
 *  A UIView which uses this AccessoryView_Base as its inputAccessoryView
 */
@property (nonatomic, retain) UIView *ownerView;

/**
 *  A UIToolbar which holds all the buttons
 */
@property (nonatomic, retain) UIToolbar *toolbar;

/**
 *  A UIBarButtonItem which when pressed triggers the AccessoryView:tappedDone:fromView delegate metho
 */
@property (nonatomic, retain) UIBarButtonItem *btnDone;

/**
 *  A UIBarButtonItem which will contain the segCtlIter
 */
@property (nonatomic, retain) UIBarButtonItem *segCtlBarButton;

/**
 *  UISegmentedControl which contains the prev/next buttons. For UIControlEvent:UIControlEventValueChanged the appropriate delegate method is triggered for prev/next: AccessoryView:tappedNextSegmentedControl:fromView | AccessoryView:tappedPrevSegmentedControl:fromView
 */
@property (nonatomic, retain) UISegmentedControl *segCtlIter;


/**
 * A UIBarButtonItem which contains a UITextField
 
 */
@property (nonatomic, retain) UIBarButtonItem *textFieldBarButton;

/**
 * A UITextField which will handles text input
 
 */
@property (nonatomic, retain) UITextField *textField;




/**
 *  Init method which takes AVButtonOptions as parameters for how the InputAccessoryView will look
 *
 *  @param buttonOptions AVButtonOptions which represent as to how the InputAccessoryView will look
 *
 *  @return (id) self
 */
-(id)initWithOptions:(AVButtonOptions)buttonOptions;


-(id)initWithOptions:(AVButtonOptions)buttonOptions andDoneButtonName:(NSString*)btnName;




@end
