//
//  StatesGameVC.m
//  USA
//
//  Created by Rene Candelier on 8/17/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "StatesGameVC.h"
#import "StateClass.h"
#import "DataStore.h"
#import "NSArray+RandomSort.h"

@interface StatesGameVC ()
@property NSMutableArray *stateArray;
@property NSMutableArray *RandomStates;



@end

@implementation StatesGameVC{
    
    //TOP ITEMS
    UIButton * backButton;
    UILabel * headerLabel;
    
    //MAIN ITEMS
    UILabel * questionLable;
    UILabel * answerLabel;
    
    
    UILabel * lableforAnswerA;
    UILabel * lableforAnswerB;
    UILabel * lableforAnswerC;
    UILabel * lableforAnswerD;
    
    
    UIView * optionC;
    UIView * optionD;
    UIView *optionA;
    
    UIView * optionB;
    //Bottom ITEMS
    UIButton * nextButton;
    
    
    UIImageView *swipeImageView;
    
    int x;
    int y;
    
    int falseOption1;
    int falseOption2;
    int falseOption3;
    
    int currentQuestion;

    NSArray*  randomStatesArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //ARRAY!!!!!!!!!!!!!!!
       /*
        //Build a new Array with the random objects
        NSMutableArray * resultArray = [[NSMutableArray alloc] init];
        
        // Build temporary array - we will randomly remove one element from here
        // and add it to our resultArray
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        
        NSMutableArray *varArray;
    
            varArray = [NSMutableArray arrayWithArray:self.RandomStates];
        
        
        
        for(int currentAnswer = 0; currentAnswer < [varArray count]; currentAnswer++)
        {
            [tempArray addObject:varArray[currentAnswer]];
        }
        
        for(int currentAnswer = 0; currentAnswer < [varArray count]; currentAnswer++)
        {
            // Get Random element from tempArray
            NSInteger n = (arc4random() % [tempArray count]);
            id arrayElement = tempArray[n];
            
            // Add Random element to Result
            [resultArray addObject:arrayElement];
            // Remove from tempArray (as we added the object to the result array)
            [tempArray removeObjectAtIndex:n];
        }
        
        tempArray =  [[DataStore sharedInstance] getStates];*/
        
        randomStatesArray = [[[DataStore sharedInstance] getStates]shuffle];

        
        
        //self.RandomStates = [[DataStore sharedInstance] getStates ];
        StateClass *currentState = randomStatesArray[0];
        
        
    //StateClass *currentState = self.RandomStates[currentQuestion];

        
        NSLog(@"%@",currentState.StateAbbreviation);
        
      //  self.CategoryLabel.text =self.resultArray[0];

        
        //**************************************************
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
        
        headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, headerView.frame.size.height/2-15, 180, 60)];
        [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
       headerLabel.textColor = [UIColor whiteColor];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.text = @"States";
        
        [self.view addSubview:backButton];
        [self.view addSubview:headerLabel];

    
        //--------------------------------Question
        //------Question Label
        
        
        questionLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 100, 300, 40)];
        
        lableforAnswerA = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 230, 250, 40)];
        lableforAnswerB = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 300, 250, 40)];
        lableforAnswerC = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 370, 250, 40)];
        lableforAnswerD = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 440, 250, 40)];
        
        
        [lableforAnswerA setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

        [lableforAnswerB setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

        [lableforAnswerC setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

        [lableforAnswerD setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];

        
        [self.view addSubview:lableforAnswerA];
        [self.view addSubview:lableforAnswerB];
        [self.view addSubview:lableforAnswerC];
        [self.view addSubview:lableforAnswerD];

//        [questionLable sizeToFit];
        
        [questionLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];
        //questionLable.textColor = [UIColor darkGrayColor];
        questionLable.textAlignment = NSTextAlignmentCenter;
        
        
        
        [self getStateName];
        //questionLable.text = @"State of Atlanta?";
        
        [self.view addSubview:questionLable];

        nextButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-20,SCREEN_HEIGHT-70 , 40, 40)];
        [nextButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
        [nextButton addTarget:self action:@selector(nextButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        nextButton.backgroundColor = [UIColor blackColor];
        
        nextButton.layer.cornerRadius = 40.0/2.0;

       // [self.view addSubview:nextButton];
        
        
        //--------------BUTTONS fo ASWERS
        
        
        UIImage *swipeImage = [UIImage imageNamed:@"select3.png"];
        
        swipeImageView =[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30,150,60,60)];
        [swipeImageView setImage:swipeImage];
        
        
        
        
        //Make the Green View a Circle
        optionA = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 60, 60)];
        optionA.layer.masksToBounds = YES;
        optionA.layer.cornerRadius = optionA.bounds.size.width/2;
        optionA.backgroundColor = [UIColor darkGrayColor];
        

        [self.view addSubview:optionA];

        //Make the Red View a Circle
        optionB = [[UIView alloc] initWithFrame:CGRectMake(20, 290, 60, 60)];
        optionB.layer.masksToBounds = YES;
        optionB.layer.cornerRadius = optionB.bounds.size.width/2;
        optionB.backgroundColor = [UIColor darkGrayColor];
        
        [self.view addSubview:optionB];
        
        
        //Make the Green View a Circle
        optionC = [[UIView alloc] initWithFrame:CGRectMake(20, 360, 60, 60)];
        optionC.layer.masksToBounds = YES;
        optionC.layer.cornerRadius = optionC.bounds.size.width/2;
        optionC.backgroundColor = [UIColor darkGrayColor];
        
        
        [self.view addSubview:optionC];
        
        //Make the Red View a Circle
        optionD = [[UIView alloc] initWithFrame:CGRectMake(20, 430, 60, 60)];
        optionD.layer.masksToBounds = YES;
        optionD.layer.cornerRadius = optionD.bounds.size.width/2;
        optionD.backgroundColor = [UIColor darkGrayColor];
        
        [self.view addSubview:optionD];
        
        [self.view addSubview:swipeImageView];

        x =swipeImageView.center.x;
        y =swipeImageView.center.y;
    }
    return self;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    UITouch *touch = [touches allObjects] [0];
    swipeImageView.center = [touch locationInView:self.view];
    
	//[self touchesBegan:touches withEvent:event];
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


- (void) getStateName{
    self.RandomStates = [[[DataStore sharedInstance] getStates ]shuffle];
    StateClass *currentState = self.RandomStates[currentQuestion];
    questionLable.text =[NSString stringWithFormat:@"What is the capital of %@?", currentState.Statename];
    
    int randomLabel = arc4random_uniform(4);
    falseOption1 =arc4random_uniform(4);
    falseOption2 =arc4random_uniform(4);
    falseOption3 =arc4random_uniform(4);
    
    while (randomLabel!=falseOption1&&falseOption1!=falseOption2&&falseOption3!=randomLabel) {
        randomLabel = arc4random_uniform(4);
        falseOption1 =arc4random_uniform(4);
        falseOption2 =arc4random_uniform(4);
        falseOption3 =arc4random_uniform(4);
    }

    currentState = self.RandomStates[randomLabel];
    lableforAnswerA.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
    currentState = self.RandomStates[falseOption1];

    lableforAnswerB.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
    currentState = self.RandomStates[falseOption2];

    lableforAnswerC.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
    currentState = self.RandomStates[falseOption3];

    lableforAnswerD.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
    

    
    switch (randomLabel) {
        case 0:
            lableforAnswerA.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
            
            
            break;
            
        case 1:
            lableforAnswerB.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
            break;
            
            
        case 2:
            lableforAnswerC.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
            break;
            
            
        case 3:
            lableforAnswerD.text =[NSString stringWithFormat:@"%@", currentState.StateCapitol];
            break;
            
        default:
            break;
            
    }

    
    
    
}

-(void) nextButtonClicked{
    currentQuestion++;
        [self getStateName];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    int radiusOfA = optionA.frame.size.width/2;
    
    
    BOOL resultforOptionA = [self isPoint:swipeImageView.center withInRadius:radiusOfA ofPoint:optionA.center];
    
    int radiusOfB = optionB.frame.size.width/2;
    
    BOOL resultForOptionB = [self isPoint:swipeImageView.center withInRadius:radiusOfB ofPoint:optionB.center];
    
    
    int radiusOfC = optionC.frame.size.width/2;
    
    
    BOOL resultforOptionC = [self isPoint:swipeImageView.center withInRadius:radiusOfC ofPoint:optionC.center];
    
    int radiusOfD = optionD.frame.size.width/2;
    
    BOOL resultForOptionD = [self isPoint:swipeImageView.center withInRadius:radiusOfD ofPoint:optionD.center];
    
    
    
    if (resultforOptionA) {
        [self returnSwitchToOriginalLocation];

        [self nextButtonClicked];

        return;
        
        
    } else if (resultForOptionB) {

        [self returnSwitchToOriginalLocation];
        [self nextButtonClicked];

        return;
    }  else if (resultforOptionC) {
        
        [self returnSwitchToOriginalLocation];
        [self nextButtonClicked];

        return;
    } else if (resultForOptionD) {
        
        [self returnSwitchToOriginalLocation];
        [self nextButtonClicked];

        return;
    
    }
    
    else{[self returnSwitchToOriginalLocation];}
    

    
}


-(void) returnSwitchToOriginalLocation{
    [UIView animateWithDuration:0.5 animations:^{
        swipeImageView.center = CGPointMake(x, y);
    }];
}

-(BOOL) isPoint:(CGPoint)point withInRadius:(int)radius ofPoint:(CGPoint) center{
    
    CGFloat dx = center.x - point.x;
    CGFloat dy = center.y - point.y;
    CGFloat distance = sqrt(dx*dx+dy*dy);
    return (distance < radius);
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
