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

@interface USAViewStateVC ()<UIScrollViewDelegate>{
    UILabel * stateNameLabel;
    int intrNum;
    NSArray *RandomStates;
    UIButton * backButton;
    UITextView *textView;
    
    UIView * stateContentView;
}

@end

@implementation USAViewStateVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        [stateNameLabel sizeToFit];
        
        stateNameLabel= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-75, 15, 150, 40)];
        [stateNameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        
        stateNameLabel.textColor = [UIColor whiteColor];
        stateNameLabel.textAlignment = NSTextAlignmentCenter;
        
        //stateNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 50)];
        
        [self.view addSubview:stateNameLabel];
        
        
        UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        
        headerView.backgroundColor = [UIColor colorWithRed:0.976f green:0.098f blue:0.329f alpha:1.0f];
        //[self.view addSubview:headerView];
        
        //Add image to search button
        backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
        
        UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
        [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        //Circle Radius
        backButton.layer.cornerRadius = 40.0/2.0;

        [self.view addSubview:backButton];
        
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        
        
    }
    return self;
}


//
//@property (nonatomic, strong) NSString *StateTree;
//@property (nonatomic, strong) NSString *StateCapitol;
//@property (nonatomic, strong) NSString *Statename;
//@property (nonatomic, strong) NSString *StateAbbreviation;
//@property (nonatomic, strong) NSString *StateFlower;
//@property (nonatomic, strong) NSString *StateBird;
//@property (nonatomic, strong) NSString *StateNickname;

- (void)setIndexForArray:(NSNumber *)indexForArray{
    
    _indexForArray = indexForArray;
    
 intrNum = [indexForArray intValue];
    
    RandomStates = [[[DataStore sharedInstance] getStates] shuffle];
    
    StateClass *currentState = RandomStates[intrNum];
    stateNameLabel.text = currentState.Statename;
    textView.text = stateNameLabel.text;

}
-(void)backButtonClicked{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // D any additional setup after loading the view.
    
    ///----------------PARALLAx
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"mia.jpg"];
    CGRect backgroundRect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:backgroundRect];
    backgroundImageView.image = backgroundImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [backgroundImageView addGestureRecognizer:tapGesture];
    
   
    stateContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-200)];
    stateContentView.backgroundColor = [UIColor blueColor];
    //    textView.text = NSLocalizedString(@"Permission is hereby granted, free of charge, to any "
    //                                      @"person obtaining a copy of this software and associated "
    //                                      @"documentation files (the \"Software\"), to deal in the "
    //                                      @"Software without restriction, including without limitation "
    //                                      @"the rights to use, copy, modify, merge, publish, "
    //                                      @"distribute, sublicense, and/or sell copies of the "
    //                                      @"Software, and to permit persons to whom the Software is "
    //                                      @"furnished to do so, subject to the following "
    //                                      @"conditions...\"", nil);
     textView = [[UITextView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, 0, 80, 40)];
    textView.textAlignment = NSTextAlignmentCenter;
    textView.font = [UIFont systemFontOfSize:14.0f];
    textView.textColor = [UIColor darkTextColor];
    textView.scrollsToTop = NO;
    textView.editable = NO;
    
    [stateContentView addSubview:textView];
    
    MDCParallaxView *parallaxView = [[MDCParallaxView alloc] initWithBackgroundView:backgroundImageView
                                                                     foregroundView:stateContentView];
    parallaxView.frame = self.view.bounds;
    parallaxView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    parallaxView.backgroundHeight = 250.0f;
    parallaxView.scrollView.scrollsToTop = YES;
    parallaxView.backgroundInteractionEnabled = YES;
    parallaxView.scrollViewDelegate = self;
    [self.view addSubview:parallaxView];
    
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
