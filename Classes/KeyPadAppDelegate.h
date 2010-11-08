//
//  KeyPadAppDelegate.h
//  KeyPad
//
//  Created by Manuel on 03.08.10.
//  Copyright vikingosegundo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyPadViewController;

@interface KeyPadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KeyPadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KeyPadViewController *viewController;

@end

