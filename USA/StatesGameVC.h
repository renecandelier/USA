//
//  StatesGameVC.h
//  USA
//
//  Created by Rene Candelier on 8/17/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScorePopUp;
@class NAModalSheet;
@interface StatesGameVC : UIViewController
@property (nonatomic, weak) NAModalSheet *modalSheet;

@property (weak, nonatomic) ScorePopUp *PopUpForScore;
@end
