//
//  StatesGameVC.m
//  USA
//
//  Created by Rene Candelier on 8/17/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "StatesGameVC.h"

@interface StatesGameVC ()




@end

@implementation StatesGameVC{
    UIButton * backButton;
    UILabel * headerLabel;
    UILabel * questionLable;
    UILabel * answerLabel;
    UILabel * falseAnswers;



}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //--------------------------------TOP CONTENT
        self.view.backgroundColor = [UIColor whiteColor];
        
        backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
        
        UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
        [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        backButton.layer.cornerRadius = 40.0/2.0;
        
        
        UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        
        [self.view addSubview:headerView];
        headerView.backgroundColor = [UIColor darkGrayColor];
        
        
        headerView = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 15, 160, headerView.frame.size.height/2)];
        
        
        [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.text = @"States";
        
        [headerView addSubview:headerLabel];
        [self.view addSubview:backButton];
        
        //--------------------------------Question
        //------Question Label
        
        
        questionLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2, 200, 40)];
        
        
        [questionLable sizeToFit];
        
        [questionLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];
        questionLable.textColor = [UIColor darkGrayColor];
        questionLable.textAlignment = NSTextAlignmentCenter;
        questionLable.text = @"State of Atlanta?";
        
        [self.view addSubview:questionLable];



    }
    return self;
}

-(void)backButtonClicked{[self dismissViewControllerAnimated:NO completion:nil];}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
