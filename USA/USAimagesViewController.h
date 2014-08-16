//
//  USAimagesViewController.h
//  USA
//
//  Created by Rene Candelier on 8/7/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SampleSheetViewController;
@interface USAimagesViewController : UIViewController
@property (nonatomic)  NSArray * welcomePhotos;
@property (nonatomic)  NSArray * citiesArray;


@property (weak, nonatomic) SampleSheetViewController *PopUpForScore;

@end
