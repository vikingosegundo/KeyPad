//
//  VSKeypad.h
//  KeyPad
//
//  Created by Manuel on 03.08.10.
//  Copyright 2010 vikingosegundo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VSKeypadViewDelegate
@required
-(int)numberOfRows;
-(int)numberOfColumns;

-(NSString*)titleForButtonOnRow:(int)row andColumn:(int)column;
-(id)valueForButtonOnRow:(int)row andColumn:(int)column;
-(CGSize)sizeForButtonOnRow:(int)row andColumn:(int)column;
-(void)receivedValue:(id)value;
-(CGPoint)keypadOrigin;

@optional
-(NSArray *)additionalButtonsForKeypad;
//-(UIColor *)keypadBackgroundColor;
//-(UIColor *)keyBackgroundColorForRow:(int)row andColumn:(int)Column;
-(UIImage *)backgroundImageForState:(UIControlState)state forKeyAtRow:(int)row andColumn:(int)column;
-(BOOL)isButtonEnabledAtRow:(int)row andColumn:(int)column;

@end


@interface VSKeypadView : UIView {
	id<VSKeypadViewDelegate> delegate;
	NSArray *keypadButtons;
}

+ (VSKeypadView *)keypadViewWithFrame:(CGRect)r;

- (id)initWithFrame:(CGRect)r ;
-(void)fireKeypadButton:(id)sender;

@property(nonatomic, retain) id<VSKeypadViewDelegate> delegate;

@end

