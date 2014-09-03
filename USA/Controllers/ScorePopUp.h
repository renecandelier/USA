//
//  ScorePopUp.h
//  USA
//
//  Created by Rene Candelier on 9/2/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NAModalSheet;

@interface ScorePopUp : UIViewController
- (IBAction)learnButton:(id)sender;

- (IBAction)homeButton:(id)sender;
@property (nonatomic, weak) NAModalSheet *modalSheet;
@property (nonatomic, assign) BOOL opaque;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic, weak) NSString *imagename;
@property (weak, nonatomic) IBOutlet UILabel *imageslabel;
@end