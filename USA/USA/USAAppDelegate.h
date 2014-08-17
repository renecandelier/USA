//
//  USAAppDelegate.h
//  USA
//
//  Created by Rene Candelier on 8/7/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NAModalSheet;

@interface USAAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, weak) NAModalSheet *modalSheet;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
