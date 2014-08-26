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
#import "ScoreSummary.h"

@interface StatesGameVC ()
@property NSMutableArray *stateArray;


@end

@implementation StatesGameVC{
    
    //TOP ITEMS
    UIButton * backButton;
    UILabel * headerLabel;
    
    //MAIN ITEMS
    UILabel * questionLable;
    UILabel * answerLabel;
    
    //Labels for Answers
    UILabel * lableforAnswerA;
    UILabel * lableforAnswerB;
    UILabel * lableforAnswerC;
    UILabel * lableforAnswerD;
  
    //Score Label
    UILabel * scoreLabel;
    
    //Number of Score
    
    int score;
    
    //Cirlces for Options
    UIView * optionA;
    UIView * optionB;
    UIView * optionC;
    UIView * optionD;
    
    
    UIImageView *swipeImageView;
    
    //Get X Y for the Swipe
    int x;
    int y;
    
    //Random numbers for false Answers
    
    int falseOption1;
    int falseOption2;
    int falseOption3;
    
    //Right Answer
    
    NSString * rightAnswer;
   
    
    int currentQuestion;

    //Array for random states
    NSArray*  randomStatesArray;
    
    //Position for Right Answer
    int randomLabel;
    
    //Class to get the array
    StateClass *currentState;
    
    
 
}


-(void)viewDidLoad{
    
    [super viewDidLoad];
    

}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
      
        
        
        
        
        randomStatesArray = [[[DataStore sharedInstance] getStates]shuffle];
        //Setting the Question
        //Get the current
        currentState = randomStatesArray[currentQuestion];
        
        
        
        
        
        //Getting the array

        //--------------------------------TOP CONTENT
        
        
        
       
   
        //Adding the Swipe view
        
        swipeImageView =[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-30,150,60,60)];
        [swipeImageView setImage:[UIImage imageNamed:@"select3.png"]];
        //Getting the X Y for the Swipe Button
        x =swipeImageView.center.x;
        y =swipeImageView.center.y;
        
        
        //Top header View
        
        UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        headerView.backgroundColor = [UIColor darkGrayColor];
       // headerView = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 15, 160, headerView.frame.size.height/2)];
        [self.view addSubview:headerView];
        
        // Add top label for Title
        
        headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, headerView.frame.size.height/2-30, 180, 60)];
        [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.text = @"States";
        [self.view addSubview:headerLabel];
        
        
        
        //Button To go Back
        backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
        
        UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
        [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        backButton.layer.cornerRadius = 40.0/2.0;
        
        [self.view addSubview:backButton];
        
        //--------------------------------Question
        //------Question Label
        
        //Question Label
        questionLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-150, 100, 300, 40)];
        
        //Random Answers.
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

        [questionLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:20]];
         questionLable.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:questionLable];

        
       
        
       
        
        //--------------BUTTONS fo ANSWERS
        
        //Make the Option A Circle
        optionA = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 60, 60)];
        optionA.layer.masksToBounds = YES;
        optionA.layer.cornerRadius = optionA.bounds.size.width/2;
        optionA.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:optionA];

        //Make the Option B Circle
        optionB = [[UIView alloc] initWithFrame:CGRectMake(20, 290, 60, 60)];
        optionB.layer.masksToBounds = YES;
        optionB.layer.cornerRadius = optionB.bounds.size.width/2;
        optionB.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:optionB];
        
        
        //Make the Option C Circle
        optionC = [[UIView alloc] initWithFrame:CGRectMake(20, 360, 60, 60)];
        optionC.layer.masksToBounds = YES;
        optionC.layer.cornerRadius = optionC.bounds.size.width/2;
        optionC.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:optionC];
        
        //Make the Option D Circle
        optionD = [[UIView alloc] initWithFrame:CGRectMake(20, 430, 60, 60)];
        optionD.layer.masksToBounds = YES;
        optionD.layer.cornerRadius = optionD.bounds.size.width/2;
        optionD.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:optionD];
        
        [self.view addSubview:swipeImageView];

        
        
        //Score Label
        
        
        scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, SCREEN_HEIGHT-60, 180, 60)];
        [scoreLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25]];
        scoreLabel.textColor = [UIColor darkGrayColor];
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        scoreLabel.text = @"Score: 0";
        [self.view addSubview:scoreLabel];
        
        self.view.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects] [0];
    swipeImageView.center = [touch locationInView:self.view];
    }




- (void) getStateName{
    //Setting the Question
    currentState = randomStatesArray[currentQuestion];

    
        questionLable.text =[NSString stringWithFormat:@"%@ is the capital of?", currentState.StateCapitol];
        
        
       
    //right
    randomLabel = arc4random_uniform(4);
    
    //Setting the Rigt Answer with the Capitol
    rightAnswer = currentState.Statename;
    
    
    //CurrentQuestion is Right Ansewr ALL INT 0-49
    
    
    //FASLSE OPTIONS 0-49
    falseOption1 =arc4random_uniform(49);
    falseOption2 =arc4random_uniform(49);
    falseOption3 =arc4random_uniform(49);
    
    // COMPARING INTS   RIght answer to false options
    
    
    
    while (currentQuestion==falseOption1)
        
    {
        falseOption1 =arc4random_uniform(49);
        
        currentState = randomStatesArray[falseOption1];
        
    };

    
    while (falseOption2==falseOption1||falseOption2==currentQuestion)
        
    {
        falseOption2 =arc4random_uniform(49);
        
    };
    
    while (falseOption3==currentQuestion||falseOption3==falseOption1||falseOption3==falseOption2)
        
    {
        falseOption3 =arc4random_uniform(49);
        
    };
    
    
    
    
    
    switch (randomLabel) {
        case 0:
            
            //Right Answer A
            
            lableforAnswerA.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            
            currentState = randomStatesArray[falseOption1];
            lableforAnswerB.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            
            currentState = randomStatesArray[falseOption2];
            lableforAnswerC.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            
            currentState = randomStatesArray[falseOption3];
            lableforAnswerD.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            return;
            break;
            
        case 1:
            //Right Answer B

            lableforAnswerB.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            currentState = randomStatesArray[falseOption1];
            
            lableforAnswerA.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            currentState = randomStatesArray[falseOption2];
            
            lableforAnswerC.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            currentState = randomStatesArray[falseOption3];
            
            lableforAnswerD.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            return;
            break;
            
            
        case 2:
            
            //Right Answer C
            
            lableforAnswerC.text =[NSString stringWithFormat:@"%@", currentState.Statename];
           
            currentState = randomStatesArray[falseOption1];
            lableforAnswerB.text =[NSString stringWithFormat:@"%@", currentState.Statename];
           
            currentState = randomStatesArray[falseOption2];
            lableforAnswerA.text =[NSString stringWithFormat:@"%@", currentState.Statename];
           
            currentState = randomStatesArray[falseOption3];
            lableforAnswerD.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            return;
            break;
            
            
        case 3:
            
            //Right Answer D
            lableforAnswerD.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            
            currentState = randomStatesArray[falseOption1];
            lableforAnswerB.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            
            currentState = randomStatesArray[falseOption2];
            lableforAnswerC.text =[NSString stringWithFormat:@"%@", currentState.Statename];
            
            currentState = randomStatesArray[falseOption3];
            lableforAnswerA.text =[NSString stringWithFormat:@"%@", currentState.Statename];
           
            return;
            break;
            
        default:
            break;
            
    }

    
    
}

-(void) nextButtonClicked{
    currentQuestion++;
        [self getStateName];
    
    [self checkForGameOver];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //Option A
    int radiusOfA = optionA.frame.size.width/2;
    BOOL resultforOptionA = [self isPoint:swipeImageView.center withInRadius:radiusOfA ofPoint:optionA.center];
    
    //Option B
    int radiusOfB = optionB.frame.size.width/2;
    BOOL resultForOptionB = [self isPoint:swipeImageView.center withInRadius:radiusOfB ofPoint:optionB.center];
    
    //Option C
    int radiusOfC = optionC.frame.size.width/2;
    BOOL resultforOptionC = [self isPoint:swipeImageView.center withInRadius:radiusOfC ofPoint:optionC.center];
    
    //Option D
    int radiusOfD = optionD.frame.size.width/2;
    BOOL resultForOptionD = [self isPoint:swipeImageView.center withInRadius:radiusOfD ofPoint:optionD.center];
    
    
    NSLog(@"Label :%@      Right Answer: %@",lableforAnswerA.text,rightAnswer);
    if (resultforOptionA) {
        
      
        if ([lableforAnswerA.text isEqual:rightAnswer]) {
            NSLog(@"A is correct");
            
            
            [self inscreaseScore];
        }
        
        
        [self returnSwitchToOriginalLocation];

        [self nextButtonClicked];

        return;
        
        
    } else if (resultForOptionB) {
        
        if ([lableforAnswerB.text isEqual:rightAnswer]) {
            [self inscreaseScore];

            NSLog(@"B is correct");
        }
        

        [self returnSwitchToOriginalLocation];
        [self nextButtonClicked];

        return;
    }  else if (resultforOptionC) {
    
        if ([lableforAnswerC.text isEqual:rightAnswer]) {
            [self inscreaseScore];

            NSLog(@"C is correct");
        }
        
        
        [self returnSwitchToOriginalLocation];
        [self nextButtonClicked];

        return;
    } else if (resultForOptionD) {
    
        if ([lableforAnswerD.text isEqual:rightAnswer]) {
            [self inscreaseScore];
            NSLog(@"D is correct");
        }
        
        [self returnSwitchToOriginalLocation];
        [self nextButtonClicked];

        return;
    
    }
    
    else{[self returnSwitchToOriginalLocation];}
    
    [self checkForGameOver];
}


-(void) checkForGameOver{
    if (currentQuestion ==9) {
        ScoreSummary *summaryVC= [[ScoreSummary alloc] init];
        
        summaryVC.score =scoreLabel.text;
        [self presentViewController:summaryVC animated:YES completion:nil];
        
    }
}

-(void) inscreaseScore{
    
    score++;
    scoreLabel.text = [NSString stringWithFormat:@"Score: %d",score*10];

}


-(void) returnSwitchToOriginalLocation{
    [UIView animateWithDuration:0.49 animations:^{
        swipeImageView.center = CGPointMake(x, y);
    }];
}

-(BOOL) isPoint:(CGPoint)point withInRadius:(int)radius ofPoint:(CGPoint) center{
    
    CGFloat dx = center.x - point.x;
    CGFloat dy = center.y - point.y;
    CGFloat distance = sqrt(dx*dx+dy*dy);
    return (distance < radius);
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //// CODE FOR SWIPE
    
    swipeImageView.center = CGPointMake(x-200, y);
    //        [UIView animateWithDuration:3.0 animations:^{
    //            swipeImageView.center = CGPointMake(x, y);
    //        }];
    
    
    [UIView animateWithDuration:0.4 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        swipeImageView.center = CGPointMake(x, y);
    } completion:nil];
    
    //Get the first Question
    [self getStateName];
    
    score=0;
    
}

-(void)backButtonClicked{[self dismissViewControllerAnimated:NO completion:nil];}

@end
