//
//  ViewController.h
//  RAccessoryView-Test
//
//  Created by Rohan Panchal on 6/30/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AccessoryView_TextField.h"
#import "AccessoryView_TextView.h"

@interface ViewController : UIViewController <AccessoryView_Delegate>

@property IBOutlet UITextField *TF_Tag1;
@property IBOutlet UITextField *TF_Tag2;
@property IBOutlet UITextView *TV_Tag3;

@end
