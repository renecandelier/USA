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
    }
    return self;
}

- (void) menuButtonclicked{
    USAimagesViewController *mainMenu= [[USAimagesViewController alloc] init];
    
    [self presentViewController:mainMenu animated:YES completion:nil];
}

- (void) retryButtonclicked{
GamePlayVC *gameMenu= [[GamePlayVC alloc] init];

[self presentViewController:gameMenu animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];

}


-(void)setScore:(NSString *)score{
    _score = score;
    //Score Label
    
    
    
    int theScore = [score intValue];
    
    UIView * scoreView = [[UIView alloc]initWithFrame:CGRectMake(15, 130, SCREEN_WIDTH-30, SCREEN_HEIGHT -260)];
    
    
    scoreView.backgroundColor = [UIColor whiteColor];
    
    
    scoreView.layer.cornerRadius = 15;
    scoreView.layer.masksToBounds = YES;
    
    [self.view addSubview:scoreView];
    
    //--------------------
    
    UILabel * inspiringLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreView.bounds.size.width/2-100, 5, 200, 100)];
    
    [inspiringLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:40]];
    inspiringLabel.textAlignment = NSTextAlignmentCenter;
    inspiringLabel.text =[NSString stringWithFormat:@"%@",self.score];
    
    inspiringLabel.textColor = [UIColor colorWithRed:0.694f green:0.243f blue:0.953f alpha:1.0f];

   
    
    [scoreView addSubview:inspiringLabel];
    
    
    
    UIButton * goHomeButton = [[UIButton alloc]initWithFrame:CGRectMake(30,scoreView.bounds.size.height-70,60,60)];
    
    [goHomeButton setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    
    [goHomeButton addTarget:self action:@selector(menuButtonclicked) forControlEvents:UIControlEventTouchUpInside];
    
    [scoreView addSubview:goHomeButton];
    
    
    UIButton * retryButton = [[UIButton alloc]initWithFrame:CGRectMake(scoreView.bounds.size.width-90,scoreView.bounds.size.height-70,60,60)];
    
    [retryButton setBackgroundImage:[UIImage imageNamed:@"retry.png"] forState:UIControlStateNormal];
    
    [retryButton addTarget:self action:@selector(retryButtonclicked) forControlEvents:UIControlEventTouchUpInside];
    
    [scoreView addSubview:retryButton];
    
        
    //SCORE

    scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreView.bounds.size.width/2-65, 100, 130, 130)];
    
    [scoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:65]];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    scoreLabel.text =[NSString stringWithFormat:@"%@",self.score];
    

    scoreLabel.layer.cornerRadius = 65.0;
    scoreLabel.layer.masksToBounds = YES;
    scoreLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    scoreLabel.layer.borderWidth = 2.0;

    [scoreView addSubview:scoreLabel];
    
    if (theScore>=70) {
        inspiringLabel.text = @"Great Job!";
        scoreLabel.textColor = [UIColor colorWithRed:0.361f green:0.902f blue:0.361f alpha:1.0f];
        

        
    } else{
        inspiringLabel.text = @"Oh No!";
        scoreLabel.textColor = [UIColor redColor];

        
    }

}




@end
