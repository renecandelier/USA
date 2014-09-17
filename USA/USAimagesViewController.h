//
//  USAimagesViewController.h
//  USA
//
//  Created by Rene Candelier on 8/7/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAModalSheet.h"
#import "SampleSheetViewController.h"

@interface USAimagesViewController : UIViewController
@property (nonatomic)  NSArray * welcomePhotos;
@property (nonatomic)  NSArray * citiesArray;

@property (nonatomic) NAModalSheet *modalSheet;

@property (nonatomic) SampleSheetViewController *PopUpForScore;

@end
