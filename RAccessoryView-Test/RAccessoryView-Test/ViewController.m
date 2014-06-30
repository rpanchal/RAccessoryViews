//
//  ViewController.m
//  RAccessoryView-Test
//
//  Created by Rohan Panchal on 6/30/14.
//  Copyright (c) 2014 Rohan Panchal. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property AccessoryView_TextField *TF_AccessoryView_1;
@property AccessoryView_TextField *TF_AccessoryView_2;

@property AccessoryView_TextView *TV_AccessoryView;

@end

@implementation ViewController

@synthesize TF_AccessoryView_1;
@synthesize TF_AccessoryView_2;

@synthesize TV_AccessoryView;


@synthesize TF_Tag1;
@synthesize TF_Tag2;
@synthesize TV_Tag3;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.TF_AccessoryView_1 = [[AccessoryView_TextField alloc] initWithTextField:TF_Tag1 andOptions:AVButtonOptionsIter];
    self.TF_AccessoryView_1.delegate = self;
    self.TF_Tag1.inputAccessoryView = TF_AccessoryView_1;
    
    self.TF_AccessoryView_2 = [[AccessoryView_TextField alloc] initWithTextField:TF_Tag2 andOptions:AVButtonOptionsIter];
    TF_AccessoryView_2.delegate = self;
    self.TF_Tag2.inputAccessoryView = TF_AccessoryView_2;
    
    TV_AccessoryView = [[AccessoryView_TextView alloc] initWithTextView:TV_Tag3 andOptions:AVButtonOptionsDoneAndIter];
    TV_AccessoryView.delegate = self;
    self.TV_Tag3.inputAccessoryView = TV_AccessoryView;
    

    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AccessoryView:(AccessoryView_Base *)accessoryView tappedDone:(UIBarButtonItem *)btnDone fromView:(UIView *)ownerView {
    
    NSLog(@"accessoryView tappedDone");
    
    [ownerView resignFirstResponder];
    
}

-(void)AccessoryView:(AccessoryView_Base *)accessoryView tappedNextSegmentedControl:(UISegmentedControl *)segCtl fromView:(UIView *)ownerView {

    NSLog(@"accessoryView tappedNextSegmentedControl ownerView.tag == %i", ownerView.tag);
    
    
    
    //Assign the next responder
    if (ownerView.tag == 1) {
        
        [self.TF_Tag2 becomeFirstResponder];
        
    }
    else if (ownerView.tag == 2) {

        [self.TV_Tag3 becomeFirstResponder];
        
    }
    else if (ownerView.tag == 3) {
        
        //Nothing
        
    }
}

-(void)AccessoryView:(AccessoryView_Base *)accessoryView tappedPrevSegmentedControl:(UISegmentedControl *)segCtl fromView:(UIView *)ownerView {
    
    NSLog(@"accessoryView tappedPrevSegmentedControl ownerView.tag == %i", ownerView.tag);
    
    //Assign the next responder
    if (ownerView.tag == 1) {
        
        //Nothing
        
    }
    else if (ownerView.tag == 2) {
        
        [self.TF_Tag1 becomeFirstResponder];
        
    }
    else if (ownerView.tag == 3) {
        
        [self.TF_Tag2 becomeFirstResponder];
        
    }
}


@end
