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


@interface SampleSheetViewController ()
{
  __weak IBOutlet UISwitch *sizeSwitch;
  __weak IBOutlet UILabel *sizeLabel;
}
@end

@implementation SampleSheetViewController
@synthesize imagename;
- (instancetype)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self)
    {
        CGSize s = self.view.bounds.size;
        
        s.height = 100;
        s.width = 70;
        
        
        [self.modalSheet adjustContentSize:s animated:YES];
        self.imageslabel.text= self.imagename;
        
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
    [self presentViewController:searchViewController animated:YES completion:nil];
}

- (IBAction)playButton:(id)sender {
    
    GamePlayVC *searchViewController = [[GamePlayVC alloc] init];
    [self presentViewController:searchViewController animated:YES completion:nil];
}
@end
