//
//  GamePlayVC.m
//  USA
//
//  Created by Rene Candelier on 8/17/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "GamePlayVC.h"

#import "StatesGameVC.h"
#import "CapitalGame.h"
#import "ViewController.h"

#import "USAimagesViewController.h"

@interface GamePlayVC ()

@end

@implementation GamePlayVC{
    UILabel * letsPlayLable;
    
    UIButton * backButton;
    
    UIButton * randomGame;
    
    UIButton * statesGame;
    
    UIButton * mapGame;
    
    UIButton * capitalGame;
    
    UIButton * rateButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        // Custom initialization
       
        //--------------------------------TOP CONTENT
        
        
        backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
        
        UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
        [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        backButton.layer.cornerRadius = 40.0/2.0;
        
        UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        
        [self.view addSubview:headerView];
        headerView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
        
        
        letsPlayLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 15, 160, headerView.frame.size.height/2)];
        [letsPlayLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        
        letsPlayLable.textColor = [UIColor whiteColor];
        letsPlayLable.textAlignment = NSTextAlignmentCenter;
        letsPlayLable.text = @"Let's Play!";
        
        [headerView addSubview:letsPlayLable];
        [self.view addSubview:backButton];
        
        //--------------------------------Main Content
        //------States Game Button
        
        statesGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-120, 200, 45)];
        
        [statesGame setTitle: @"States" forState: UIControlStateNormal];
        
        [statesGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]];
        
        [statesGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        statesGame.layer.cornerRadius = 5;
        statesGame.backgroundColor = [UIColor colorWithRed:0.694f green:0.243f blue:0.953f alpha:1.0f];

        [statesGame addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:statesGame];
        
        //------Capital Game Button

        capitalGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-40, 200, 45)];
        
        [capitalGame setTitle: @"Capitals" forState: UIControlStateNormal];
        
        [capitalGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]];
        
        [capitalGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        capitalGame.backgroundColor = [UIColor colorWithRed:0.694f green:0.243f blue:0.953f alpha:1.0f];

        capitalGame.layer.cornerRadius = 5;
        
        
        [capitalGame addTarget:self action:@selector(capitalGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:capitalGame];

        
        //------Map Game Button

        
        mapGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2+40, 200, 45)];
        
        [mapGame setTitle: @"Map" forState: UIControlStateNormal];
        
        [mapGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]];
        
        [mapGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        mapGame.layer.cornerRadius = 5;
        mapGame.backgroundColor = [UIColor colorWithRed:0.694f green:0.243f blue:0.953f alpha:1.0f];
        
        
        [mapGame addTarget:self action:@selector(mapGameButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:mapGame];
        
        
        //------Top Score Button
        
        
        randomGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2+60, 200, 45)];
        
        [randomGame setTitle: @"Random" forState: UIControlStateNormal];
        
        [randomGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]];
        
        [randomGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        randomGame.layer.cornerRadius = 5;
        
        
        [randomGame addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
       // [self.view addSubview:randomGame];
        
        
        //------Top Score Button
        
        
        rateButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-80, 200, 45)];
        
        [rateButton setTitle: @"Rate" forState: UIControlStateNormal];
        
        [rateButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30.0]];
        
        rateButton.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
        
        [rateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        //rateButton.layer.borderWidth = 2.0f;
        //rateButton.layer.borderColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f].CGColor;

        rateButton.layer.cornerRadius = 5;
        
        
        [rateButton addTarget:self action:@selector(rateButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:rateButton];

        
        
    }
    return self;
}

-(void) mapGameButtonClicked{
    
  
ViewController *mapVC= [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    [self presentViewController:mapVC animated:NO completion:nil];
}

-(void) capitalGamePlay{
    CapitalGame *capitalGameViewController = [[CapitalGame alloc] init];
    
    [self presentViewController:capitalGameViewController animated:NO completion:nil];
}


-(void) statesGamePlay{
    StatesGameVC *stateGameViewController = [[StatesGameVC alloc] init];

    [self presentViewController:stateGameViewController animated:NO completion:nil];
}

-(void) rateButtonClicked{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id836781461"]];
}

-(void)backButtonClicked{
    USAimagesViewController *goToMenu= [[USAimagesViewController alloc] init];
    [self presentViewController:goToMenu animated:NO completion:nil];

}


@end
