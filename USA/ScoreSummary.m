//
//  ScoreSummary.m
//  USA
//
//  Created by Rene Candelier on 8/22/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "ScoreSummary.h"
#import "StatesGameVC.h"
@interface ScoreSummary ()

@end

@implementation ScoreSummary{
    UILabel * questionLable;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        //------More INFO BUTTON
        
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

        
    }
    return self;
}

- (void) retryButtonclicked{
    StatesGameVC *startGameAgain= [[StatesGameVC alloc] init];
    
    [self presentViewController:startGameAgain animated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //Question Label
    questionLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 100, 300, 40)];
    
    [questionLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];
    questionLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:questionLable];
    questionLable.text =[NSString stringWithFormat:@"Score: %d",self.score];

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
