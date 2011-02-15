//
//  KeyPadViewController.h
//  KeyPad
//
//  Created by Manuel on 03.08.10.
//  Copyright vikingosegundo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSKeypadView.h"
@interface KeyPadViewController : UIViewController <VSKeypadViewDelegate> {
	VSKeypadView *keypadView;
	UIButton *okButton;
	IBOutlet UIButton *amountButton;
	
	NSString *enteredAmountString;

}

-(IBAction)okAction:(id)sender;
@property (retain) IBOutlet UIButton *amountButton;

@end

