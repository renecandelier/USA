//
//  ScorePopUp.m
//  USA
//
//  Created by Rene Candelier on 9/2/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "ScorePopUp.h"
#import "NAModalSheet.h"
#import "USATBV.h"
#import "USATBV.h"
#import "GamePlayVC.h"

@interface ScorePopUp ()

@end

@implementation ScorePopUp
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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.opaque)
    {
        self.view.backgroundColor = [UIColor whiteColor];
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

- (IBAction)homeButton:(id)sender {
    
    GamePlayVC *searchViewController = [[GamePlayVC alloc] init];
    [self presentViewController:searchViewController animated:YES completion:nil];
}
@end

