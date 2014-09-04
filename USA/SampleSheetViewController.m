//
//  SampleSheetViewController.m
//  NAModalSheet
//
//  Created by Ken Worley on 11/22/13.
//  Copyright (c) 2013 Ken Worley. All rights reserved.
//

#import "SampleSheetViewController.h"
#import "NAModalSheet.h"
#import "USATBV.h"
#import "USATBV.h"
#import "GamePlayVC.h"
#import "Settings.h"


@interface SampleSheetViewController ()

@end

@implementation SampleSheetViewController
- (instancetype)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self)
    {
        CGSize s = self.view.bounds.size;
        
        s.height = 100;
        s.width = 70;
        
        
        [self.modalSheet adjustContentSize:s animated:YES];
        
        //[self.image setImage:[UIImage imageWithContentsOfFile:@"truck.png"]];
        //
           }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  if (self.opaque)
  {
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
  }
    
   
}



- (IBAction)dismissButtonTouched:(id)sender
{
  [self.modalSheet dismissWithCompletion:^{
    
  }];

   
}



- (IBAction)learnButton:(id)sender {
    USATBV *searchViewController = [[USATBV alloc] init];
    [self presentViewController:searchViewController animated:NO completion:nil];
    
}

- (IBAction)playButton:(id)sender {
    
    GamePlayVC *searchViewController = [[GamePlayVC alloc] init];
    [self presentViewController:searchViewController animated:NO completion:nil];
}
- (IBAction)rateButton:(id)sender {
    
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id836781461"]];
    }

- (IBAction)settingsButton:(id)sender {
    
    Settings *settingsVC = [[Settings alloc] init];
    [self presentViewController:settingsVC animated:NO completion:nil];
}
@end
