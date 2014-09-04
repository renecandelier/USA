//
//  Settings.m
//  USA
//
//  Created by Rene Candelier on 9/3/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "Settings.h"
#import "USAimagesViewController.h"

@interface Settings ()

@end

@implementation Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Custom initialization
    
    //--------------------------------TOP CONTENT
    
    
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
    
    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    backButton.layer.cornerRadius = 40.0/2.0;
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    
    
    UILabel * letsPlayLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 15, 160, headerView.frame.size.height/2)];
    [letsPlayLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
    
    letsPlayLable.textColor = [UIColor whiteColor];
    letsPlayLable.textAlignment = NSTextAlignmentCenter;
    letsPlayLable.text = @"Settings";
    
    [headerView addSubview:letsPlayLable];
    [self.view addSubview:backButton];
    

}


-(void) backButtonClicked{
    USAimagesViewController *goToMenu= [[USAimagesViewController alloc] init];
    [self presentViewController:goToMenu animated:NO completion:nil];
}

@end
