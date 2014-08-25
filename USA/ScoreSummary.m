//
//  ScoreSummary.m
//  USA
//
//  Created by Rene Candelier on 8/22/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "ScoreSummary.h"
#import "StatesGameVC.h"
#import "GamePlayVC.h"
#import "USAimagesViewController.h"
@interface ScoreSummary ()

@end

@implementation ScoreSummary{
    UILabel * scoreLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        //------Retry Button
        
        UIButton * retryButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-260, 200, 40)];
        
        //moreInfoButton.backgroundColor = [UIColor blueColor];
        [retryButton setTitle: @"RETRY" forState: UIControlStateNormal];
        
        [retryButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [retryButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        retryButton.layer.borderWidth = 0.5f;
        retryButton.layer.cornerRadius = 5;
        
        
        [retryButton addTarget:self action:@selector(retryButtonclicked) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:retryButton];
        
        //-------------Main Menu
        UIButton * mainMenuButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-160, 200, 40)];
        
        //moreInfoButton.backgroundColor = [UIColor blueColor];
        [mainMenuButton setTitle: @"HOME" forState: UIControlStateNormal];
        
        [mainMenuButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [mainMenuButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        mainMenuButton.layer.borderWidth = 0.5f;
        mainMenuButton.layer.cornerRadius = 5;
        
        
        [mainMenuButton addTarget:self action:@selector(menuButtonclicked) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:mainMenuButton];
    }
    return self;
}

- (void) menuButtonclicked{
    USAimagesViewController *mainMenu= [[USAimagesViewController alloc] init];
    
    [self presentViewController:mainMenu animated:YES completion:nil];
}

- (void) retryButtonclicked{
    //StatesGameVC *startGameAgain= [[StatesGameVC alloc] init];
    
    //[self presentViewController:startGameAgain animated:YES completion:nil];

GamePlayVC *gameMenu= [[GamePlayVC alloc] init];

[self presentViewController:gameMenu animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    

}


-(void)setScore:(NSString *)score{
    _score = score;
    //Score Label

    scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 100, 300, 40)];
    
    [scoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:scoreLabel];
    scoreLabel.text =[NSString stringWithFormat:@"Score: %@",self.score];



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
