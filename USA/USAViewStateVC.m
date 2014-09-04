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
    
    StateAbbreviation.text = [NSString stringWithFormat:@"Abbreviation  %@", currentState.StateAbbreviation];
    StateBird.text =         [NSString stringWithFormat:@"Bird              %@", currentState.StateBird];
    StateCapitol.text =      [NSString stringWithFormat:@"Capital          %@", currentState.StateCapitol];
    StateFlower.text =       [NSString stringWithFormat:@"Flower           %@", currentState.StateFlower];
    StateNickname.text =     [NSString stringWithFormat:@"Nickname     %@", currentState.StateNickname];
    StateTree.text =         [NSString stringWithFormat:@"Tree              %@", currentState.StateTree];

}

-(void)setStateName:(NSString *)stateName{
    _stateName = stateName;
    
    
    
    
    
    
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
    
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    
    headerView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:0.9f];
    [self.view addSubview:headerView];
   
    
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
    int space;
    
    space =20;
    
    //------More INFO BUTTON
    
    moreInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-250, 200, 40)];
    
    //moreInfoButton.backgroundColor = [UIColor blueColor];
    [moreInfoButton setTitle: @"MORE INFO" forState: UIControlStateNormal];
    
    [moreInfoButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0]];
    
    [moreInfoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    moreInfoButton.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    //moreInfoButton.layer.borderWidth = 0.5f;
    moreInfoButton.layer.cornerRadius = 5;
    
    
    [moreInfoButton addTarget:self action:@selector(moreInfoButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    
    [stateContentView addSubview:moreInfoButton];

    
    //------------------- State FACTS
    

    
    StateAbbreviation = [[UILabel alloc] initWithFrame:CGRectMake(20, 30-space, SCREEN_WIDTH, 25)];
    StateAbbreviation.textAlignment = NSTextAlignmentLeft;
    StateAbbreviation.font = [UIFont systemFontOfSize:14.0f];
    StateAbbreviation.textColor = [UIColor darkGrayColor];
    [StateAbbreviation setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];

    
    [stateContentView addSubview:StateAbbreviation];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20,70-space, 260, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:0.3f];
    [stateContentView addSubview:lineView];
    
    //Capitol
    StateCapitol = [[UILabel alloc] initWithFrame:CGRectMake(20, 80-space, SCREEN_WIDTH, 25)];
    StateCapitol.textAlignment = NSTextAlignmentLeft;
    StateCapitol.font = [UIFont systemFontOfSize:14.0f];
    StateCapitol.textColor = [UIColor darkGrayColor];
    [StateCapitol setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];
    
    
    [stateContentView addSubview:StateCapitol];
    
    [stateContentView addSubview:StateAbbreviation];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(20,120-space, 260, 1)];
    lineView2.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:0.3f];
    [stateContentView addSubview:lineView2];
    
    
    //Nickname
    StateNickname = [[UILabel alloc] initWithFrame:CGRectMake(20, 130-space, SCREEN_WIDTH, 25)];
    StateNickname.textAlignment = NSTextAlignmentLeft;
    StateNickname.font = [UIFont systemFontOfSize:14.0f];
    StateNickname.textColor = [UIColor darkGrayColor];
    [StateNickname setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];
    
    
    [stateContentView addSubview:StateNickname];
    
    [stateContentView addSubview:StateAbbreviation];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(20,170-space, 260, 1)];
    lineView3.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:0.3f];
    [stateContentView addSubview:lineView3];
    
    
    
    //TREE
    StateTree = [[UILabel alloc] initWithFrame:CGRectMake(20, 180-space, SCREEN_WIDTH, 25)];
    StateTree.textAlignment = NSTextAlignmentLeft;
    StateTree.font = [UIFont systemFontOfSize:14.0f];
    StateTree.textColor = [UIColor darkGrayColor];
    [StateTree setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];
    
    
    [stateContentView addSubview:StateTree];
    
    [stateContentView addSubview:StateAbbreviation];
    
    UIView *lineView4 = [[UIView alloc] initWithFrame:CGRectMake(20,220-space, 260, 1)];
    lineView4.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:0.3f];
    [stateContentView addSubview:lineView4];
    
    
    
    //FLOWER
    StateFlower = [[UILabel alloc] initWithFrame:CGRectMake(20, 230-space, SCREEN_WIDTH, 25)];
    StateFlower.textAlignment = NSTextAlignmentLeft;
    StateFlower.font = [UIFont systemFontOfSize:14.0f];
    StateFlower.textColor = [UIColor darkGrayColor];
    [StateFlower setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];
    
    [stateContentView addSubview:StateFlower];
    
    [stateContentView addSubview:StateAbbreviation];
    
    UIView *lineView5 = [[UIView alloc] initWithFrame:CGRectMake(20,270-space, 260, 1)];
    lineView5.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:0.3f];
    [stateContentView addSubview:lineView5];
    
   
    //BIRD
    StateBird = [[UILabel alloc] initWithFrame:CGRectMake(20, 280-space, SCREEN_WIDTH, 25)];
    StateBird.textAlignment = NSTextAlignmentLeft;
    StateBird.font = [UIFont systemFontOfSize:14.0f];
    StateBird.textColor = [UIColor darkGrayColor];
    [StateBird setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];
    
    
    [stateContentView addSubview:StateBird];

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


@end
