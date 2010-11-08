//
//  KeyPadViewController.m
//  KeyPad
//
//  Created by Manuel on 03.08.10.
//  Copyright vikingosegundo 2010. All rights reserved.
//

#import "KeyPadViewController.h"
#import "KeypadConfig.h"


@implementation KeyPadViewController



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
	[self.view setBackgroundColor:[UIColor whiteColor]];
	[amountButton removeFromSuperview];
	keypadView = [[[VSKeypadView keypadViewWithFrame:CGRectMake(0, 30, 320, 274)] retain] retain];
	keypadView.delegate = self;	
	[keypadView setOpaque:!NO];
	enteredAmountString = @"";
	[self.view addSubview:amountButton];
	[self.view addSubview:keypadView];
    
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[keypadView release];
	keypadView = nil;
    [super dealloc];
}



#pragma mark -
#pragma mark actions


-(IBAction)okAction:(id)sender
{
	[amountButton setTitle:@"" forState:UIControlStateNormal];
	enteredAmountString =@"";
	
}

-(int) numberOfRows
{
	return 4;
}

-(int) numberOfColumns
{
	return 3;
}

-(CGSize) sizeForButtonOnRow:(int)row andColumn:(int)column
{
	return CGSizeMake(85, 50);
}


-(NSString *) titleForButtonOnRow:(int)row andColumn:(int)column
{
	if (REVERSE_KEYPAD) {		
		if (row == 0) {
			if (column == 0) return @"7";
			if (column == 1) return @"8";
			if (column == 2) return @"9";
		}
		if (row == 1) {
			if (column == 0) return @"4";
			if (column == 1) return @"5";
			if (column == 2) return @"6";
		}
		if (row == 2) {
			if (column == 0) return @"1";
			if (column == 1) return @"2";
			if (column == 2) return @"3";
		}
		if (column == 1)
			return @"0";
		return @"";
	} else {
		if (row == 3) {
			if (column == 1)
				return @"0";
			return @"";
		}
		return [NSString stringWithFormat:@"%d", row*[keypadView.delegate numberOfColumns]+column+1];
	}
	return nil;
}

-(id) valueForButtonOnRow:(int)row andColumn:(int)column
{
	NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
	NSNumber *number = [f numberFromString:[self titleForButtonOnRow:row andColumn:column]];
	
	[f release];
	return number ;
}

-(void) receivedValue:(id)value
{
	enteredAmountString = [enteredAmountString stringByAppendingFormat:@"%@", value];
	if ([enteredAmountString isEqualToString:@"0"]) {
		enteredAmountString =@"";
	}
	[amountButton setTitle:enteredAmountString forState:UIControlStateNormal];
}

-(UIImage *) backgroundImageForState:(UIControlState)state forKeyAtRow:(int)row andColumn:(int)column
{
	if (KeyBackgroundStyle == 0) {
		
		if (state != UIControlStateHighlighted) {
			if (row == 0 && column == 0)
				return [UIImage imageNamed:@"keyNW_BG.png"];
			if (row == 0 && column == [self numberOfColumns]-1)
				return [UIImage imageNamed:@"keyNE_BG.png"];
			if (row == [self numberOfRows]-1 && column == 0)
				return [UIImage imageNamed:@"keySW_BG.png"];
			if (row == [self numberOfRows]-1 && column == [self numberOfColumns]-1)
				return [UIImage imageNamed:@"keySE_BG.png"];
			return [UIImage imageNamed:@"keyBG.png"];
		} else {
			if (row == 0 && column == 0)
				return [UIImage imageNamed:@"keyNW_BG_touched.png"];
			if (row == 0 && column == [self numberOfColumns]-1)
				return [UIImage imageNamed:@"keyNE_BG_touched.png"];
			if (row == [self numberOfRows]-1 && column == 0)
				return [UIImage imageNamed:@"keySW_BG_touched.png"];
			if (row == [self numberOfRows]-1 && column == [self numberOfColumns]-1)
				return [UIImage imageNamed:@"keySE_BG_touched.png"];
			return [UIImage imageNamed:@"keyBG_touched.png"];
		}
	} else if (KeyBackgroundStyle == 1) {
		if (state != UIControlStateHighlighted) 
			return [UIImage imageNamed:[NSString stringWithFormat:@"numpad-bg_%d.png", row*[self numberOfColumns]+column ]];
		return [UIImage imageNamed:[NSString stringWithFormat:@"numpad-bg_%d_h.png", row*[self numberOfColumns]+column ]];
	}
	
	
	
	return nil;
}

-(CGPoint) keypadOrigin
{
	return CGPointMake(32, 20);
}

-(BOOL)isButtonEnabledAtRow:(int)row andColumn:(int)column
{
	//return YES;
	return ![[self titleForButtonOnRow:row andColumn:column] isEqualToString:@""];
}

@end
