//
//  GamePlayVC.m
//  USA
//
//  Created by Rene Candelier on 8/17/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "GamePlayVC.h"

#import "StatesGameVC.h"

@interface GamePlayVC ()

@end

@implementation GamePlayVC{
    UILabel * letsPlayLable;
    
    UIButton * backButton;
    
    UIButton * randomGame;
    
    UIButton * statesGame;
    
    UIButton * mapGame;
    
    UIButton * capitalGame;
    
    UIButton * topScores;


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
        headerView.backgroundColor = [UIColor darkGrayColor];
        
        
        letsPlayLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 15, 160, headerView.frame.size.height/2)];
        [letsPlayLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        
        letsPlayLable.textColor = [UIColor whiteColor];
        letsPlayLable.textAlignment = NSTextAlignmentCenter;
        letsPlayLable.text = @"Let's Play!";
        
        [headerView addSubview:letsPlayLable];
        [self.view addSubview:backButton];
        
        
        
        //--------------------------------Main Content
        //------States Game Button
        
        statesGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-120, 200, 40)];
        
        [statesGame setTitle: @"States" forState: UIControlStateNormal];
        
        [statesGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [statesGame setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        statesGame.layer.borderWidth = 0.5f;
        statesGame.layer.cornerRadius = 5;
        
        
        [statesGame addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:statesGame];
        
        //------Capital Game Button

        capitalGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-60, 200, 40)];
        
        [capitalGame setTitle: @"Capitals" forState: UIControlStateNormal];
        
        [capitalGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [capitalGame setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        capitalGame.layer.borderWidth = 0.5f;
        capitalGame.layer.cornerRadius = 5;
        
        
        [capitalGame addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:capitalGame];

        
        //------Map Game Button

        
        mapGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2, 200, 40)];
        
        [mapGame setTitle: @"Map" forState: UIControlStateNormal];
        
        [mapGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [mapGame setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        mapGame.layer.borderWidth = 0.5f;
        mapGame.layer.cornerRadius = 5;
        
        
        [mapGame addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:mapGame];
        
        
        //------Top Score Button
        
        
        randomGame = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2+60, 200, 40)];
        
        [randomGame setTitle: @"Random" forState: UIControlStateNormal];
        
        [randomGame.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [randomGame setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        randomGame.layer.borderWidth = 0.5f;
        randomGame.layer.cornerRadius = 5;
        
        
        [randomGame addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:randomGame];
        
        
        //------Top Score Button
        
        
        topScores = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-80, 200, 40)];
        
        [topScores setTitle: @"Top Scores" forState: UIControlStateNormal];
        
        [topScores.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
        
        [topScores setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        topScores.layer.borderWidth = 0.5f;
        topScores.layer.cornerRadius = 5;
        
        
        [topScores addTarget:self action:@selector(statesGamePlay) forControlEvents:UIControlEventTouchUpInside
         ];
        
        
        [self.view addSubview:topScores];

        
        
    }
    return self;
}

-(void) statesGamePlay{
    StatesGameVC *stateGameViewController = [[StatesGameVC alloc] init];
    [self presentViewController:stateGameViewController animated:YES completion:nil];
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
