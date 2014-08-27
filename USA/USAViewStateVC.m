//
//  USAViewStateVC.m
//  USA
//
//  Created by Rene Candelier on 8/15/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "USAViewStateVC.h"
#import "StateClass.h"
#import "MDCParallaxView.h"
#import "StateClass.h"
#import "DataStore.h"
#import "NSArray+RandomSort.h"
#import "MoreInfoWebVC.h"

#import "USATBV.h"


@interface USAViewStateVC ()<UIScrollViewDelegate>{
    
    //Labels for the State Information TOP
    UILabel * stateNameLabel;
    
    
    //Lavbels for the State Information
    UILabel *StateTree;
    UILabel *StateCapitol;
    UILabel *StateAbbreviation;
    UILabel *StateFlower;
    UILabel *StateBird;
    UILabel *StateNickname;
    
    UIImage *backgroundImage;
    
    UIButton * moreInfoButton;
    
    
    //Integer for the Specific state in the Array
    int intrNum;
    
    //Array that has all the state information
    NSArray *RandomStates;
    //Back Button
    UIButton * backButton;
    
    //View for STATE FACTS Information
    UIView * stateContentView;



    MDCParallaxView *parallaxView;
    UIImageView *backgroundImageView;
}




@end

@implementation USAViewStateVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
        
        
        self.view.backgroundColor = [UIColor whiteColor];
        USATBV * state = [[USATBV alloc]init];
       NSLog(@"%@",[NSString stringWithFormat:@"%@.jpg",state.stateName]);


    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)setIndexForArray:(NSNumber *)indexForArray{
    
    _indexForArray = indexForArray;
    
     intrNum = [indexForArray intValue];
    
    RandomStates = [[DataStore sharedInstance] getStates] ;
    
    StateClass *currentState = RandomStates[intrNum];
    
    
    //******************** SET THE TEXT FOR THE STATE FACTS ****************************************
    
    //backgroundImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",stateNameLabel.text]];

    
    StateAbbreviation.text = [NSString stringWithFormat:@"Abbreviation: %@", currentState.StateAbbreviation];
    StateBird.text = [NSString stringWithFormat:@"Bird: %@", currentState.StateBird];
    StateCapitol.text = [NSString stringWithFormat:@"Capital: %@", currentState.StateCapitol];
    StateFlower.text = [NSString stringWithFormat:@"Flower: %@", currentState.StateFlower];
    StateNickname.text = [NSString stringWithFormat:@"Nickname: %@", currentState.StateNickname];
    StateTree.text = [NSString stringWithFormat:@"Tree: %@", currentState.StateTree];

//Load Image

    

}

-(void)setStateName:(NSString *)stateName{
    _stateName = stateName;
    NSLog(@"%@",[NSString stringWithFormat:@"%@.jpg",self.stateName]);
    
    backgroundImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.stateName]];
    
    CGRect backgroundRect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    backgroundImageView = [[UIImageView alloc] initWithFrame:backgroundRect];
    backgroundImageView.image = backgroundImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [backgroundImageView addGestureRecognizer:tapGesture];
    
    parallaxView = [[MDCParallaxView alloc] initWithBackgroundView:backgroundImageView
                                                    foregroundView:stateContentView];
    parallaxView.frame = self.view.bounds;
    parallaxView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    parallaxView.backgroundHeight = 250.0f;
    parallaxView.scrollView.scrollsToTop = YES;
    parallaxView.backgroundInteractionEnabled = YES;
    parallaxView.scrollViewDelegate = self;
    parallaxView.scrollView.showsHorizontalScrollIndicator = NO;
    parallaxView.scrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:parallaxView];
    
    
    


    //----------------------Back button
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
    
    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    backButton.layer.cornerRadius = 40.0/2.0;
    
    [self.view addSubview:backButton];

    //----------------------Top Label for the State Name
    [stateNameLabel sizeToFit];
    
    stateNameLabel= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-125, 15, 250, 40)];
    [stateNameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
    
    stateNameLabel.textColor = [UIColor whiteColor];
    stateNameLabel.textAlignment = NSTextAlignmentCenter;
    stateNameLabel.text = self.stateName;

    [self.view addSubview:stateNameLabel];

}

-(void)backButtonClicked{[self dismissViewControllerAnimated:NO completion:nil];}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    ///----------------PARALLAx
    
   //------------View for the State Information
    stateContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-200)];
    stateContentView.backgroundColor = [UIColor whiteColor];
    
    
    //------More INFO BUTTON
    
    moreInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-260, 200, 40)];
    
    //moreInfoButton.backgroundColor = [UIColor blueColor];
    [moreInfoButton setTitle: @"MORE INFO" forState: UIControlStateNormal];
    
    [moreInfoButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    
    [moreInfoButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];

    moreInfoButton.layer.borderWidth = 0.5f;
    moreInfoButton.layer.cornerRadius = 5;
    
    
    [moreInfoButton addTarget:self action:@selector(moreInfoButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    
    
    [stateContentView addSubview:moreInfoButton];

    
    //------------------- State FACTS
    
    StateAbbreviation = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, SCREEN_WIDTH, 20)];
    StateAbbreviation.textAlignment = NSTextAlignmentLeft;
    StateAbbreviation.font = [UIFont systemFontOfSize:14.0f];
    StateAbbreviation.textColor = [UIColor darkGrayColor];
    [StateAbbreviation setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];

    
    [stateContentView addSubview:StateAbbreviation];
    
    //BIRD
    StateBird = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, SCREEN_WIDTH, 20)];
    StateBird.textAlignment = NSTextAlignmentLeft;
    StateBird.font = [UIFont systemFontOfSize:14.0f];
    StateBird.textColor = [UIColor darkGrayColor];
    [StateBird setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    
    
    [stateContentView addSubview:StateBird];
    
    //Capitol
    StateCapitol = [[UILabel alloc] initWithFrame:CGRectMake(5, 90, SCREEN_WIDTH, 20)];
    StateCapitol.textAlignment = NSTextAlignmentLeft;
    StateCapitol.font = [UIFont systemFontOfSize:14.0f];
    StateCapitol.textColor = [UIColor darkGrayColor];
    [StateCapitol setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    
    
    [stateContentView addSubview:StateCapitol];
    
    
    //Nickname
    StateNickname = [[UILabel alloc] initWithFrame:CGRectMake(5, 120, SCREEN_WIDTH, 20)];
    StateNickname.textAlignment = NSTextAlignmentLeft;
    StateNickname.font = [UIFont systemFontOfSize:14.0f];
    StateNickname.textColor = [UIColor darkGrayColor];
    [StateNickname setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    
    
    [stateContentView addSubview:StateNickname];
    
    //TREE
    StateTree = [[UILabel alloc] initWithFrame:CGRectMake(5, 150, SCREEN_WIDTH, 20)];
    StateTree.textAlignment = NSTextAlignmentLeft;
    StateTree.font = [UIFont systemFontOfSize:14.0f];
    StateTree.textColor = [UIColor darkGrayColor];
    [StateTree setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    
    
    [stateContentView addSubview:StateTree];
    
    //FLOWER
    StateFlower = [[UILabel alloc] initWithFrame:CGRectMake(5, 180, SCREEN_WIDTH, 20)];
    StateFlower.textAlignment = NSTextAlignmentLeft;
    StateFlower.font = [UIFont systemFontOfSize:14.0f];
    StateFlower.textColor = [UIColor darkGrayColor];
    [StateFlower setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    
    [stateContentView addSubview:StateFlower];
    
   
    

}

- (void) moreInfoButtonClicked{
    
    MoreInfoWebVC * sendLink = [[MoreInfoWebVC alloc]init];
    
    sendLink.link = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@",stateNameLabel.text];
    
    sendLink.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:sendLink animated:YES completion:nil];

}


#pragma mark - UIScrollViewDelegate Protocol Methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%@:%@", [self class], NSStringFromSelector(_cmd));
}


#pragma mark - Internal Methods

- (void)handleTap:(UIGestureRecognizer *)gesture {
    NSLog(@"TAP!!!!%@:%@", [self class], NSStringFromSelector(_cmd));
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
