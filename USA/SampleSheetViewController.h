//
//  SampleSheetViewController.h
//  NAModalSheet
//
//  Created by Ken Worley on 11/22/13.
//  Copyright (c) 2013 Ken Worley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NAModalSheet;

@interface SampleSheetViewController : UIViewController
- (IBAction)learnButton:(id)sender;

- (IBAction)playButton:(id)sender;
@property (nonatomic, weak) NAModalSheet *modalSheet;
@property (nonatomic, assign) BOOL opaque;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic, weak) NSString *imagename;
@property (weak, nonatomic) IBOutlet UILabel *imageslabel;
@end
