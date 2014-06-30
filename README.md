RAccessoryView
=========

RAccessoryView is a collection of InputAccessoryViews used for UITextField and UITextView with traversal methods.

The inputAccessoryView will have two controls/three buttons.

It has a UISegmentedControl with next/prev buttons.
And it has a UIBarButtonITem for done.

Version
----

1.0



Usage
--------------

First you must instantiate the text field/view and then create an AccessoryView object corresponding to whichever you chose:

-UITextField -> AccessoryView_TextField
-UITextView  -> AccessoryView_TextView

Examples
--------------
UITextField
```sh
    UITextField *TF_Tag1 = [[UITextField alloc] init];
    TF_Tag1.tag = 1;

    AccessoryView_TextView *accessoryView_TextField = [[AccessoryView_TextField alloc] initWithTextField:TF_Tag1 andOptions:AVButtonOptionsIter];
    
    self.accessoryView_TextField.delegate = self;
    self.TF_Tag1.inputAccessoryView = accessoryView_TextField;
    
```

UITextView
```sh
    UITextView *TV_Tag2 = [[UITextView alloc] init];
    TV_Tag2.tag = 2;

    AccessoryView_TextView *accessoryView_TextView = [[AccessoryView_TextView alloc] initWithTextView:TV_Tag2 andOptions:AVButtonOptionsIter];
    
    self.accessoryView_TextView.delegate = self;
    self.TV_Tag2.inputAccessoryView = accessoryView_TextView;
    
```

Delegation
--------------

These methods handle what happens when one of the buttons are tapped in the accessory view

```sh

-(void)AccessoryView:(AccessoryView_Base*)accessoryView tappedPrevSegmentedControl:(UISegmentedControl*)segCtl fromView:(UIView*)ownerView {

    if (ownerView.tag == 1) {
        //Do nothing
    }
    else if (ownerView.tag == 2) {
        [self.TF_Tag1 becomeFirstResponder];
    }
}


-(void)AccessoryView:(AccessoryView_Base*)accessoryView tappedNextSegmentedControl:(UISegmentedControl*)segCtl fromView:(UIView*)ownerView {

    if (ownerView.tag == 1) {
        [self.TV_Tag2 becomeFirstResponder];
    }
    else if (ownerView.tag == 2) {
        //Do nothing
    }

}


-(void)AccessoryView:(AccessoryView_Base*)accessoryView tappedDone:(UIBarButtonItem*)btnDone fromView:(UIView*)ownerView {

    [ownerView resignFirstResponder];

}
    
    
    
    
```




License
----

MIT

**Free Software, Hell Yeah!**

