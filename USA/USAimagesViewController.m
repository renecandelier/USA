//
//  USAimagesViewController.m
//  USA
//
//  Created by Rene Candelier on 8/7/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "USAimagesViewController.h"
#import "SampleSheetViewController.h"
#import "NAModalSheet.h"
#import "USATBV.h"
#import "USAViewStateVC.h"

//Get Random States
#import "StateClass.h"
#import "DataStore.h"
#import "NSArray+RandomSort.h"


@interface USAimagesViewController (){

    
    int photoCount;
    
    UIImageView * imageView;
    
    UILabel * citiesLable;
    
    //Class to get the array
    StateClass *currentState;
    
    //Array for random states
    NSArray*  randomStatesArray;
    

    
}

@end

@implementation USAimagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        randomStatesArray = [[[DataStore sharedInstance] getStates]shuffle];
       
        
        // Custom initialization
        self.view.backgroundColor = [UIColor blackColor];
        // Do any additional setup after loading the view.
       // UIButton * menuButton = [[UIButton alloc]initWithFrame:CGRectMake(20,20, 60, 60)];
        UIButton * menuButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 70, SCREEN_HEIGHT- 70, 80, 80)];
        
        [menuButton setBackgroundImage:[UIImage imageNamed:@"Row.png"] forState:UIControlStateNormal];
        
        [menuButton addTarget:self action:@selector(menuButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        UIButton * searchButton = [[UIButton alloc]initWithFrame:CGRectMake(-10, SCREEN_HEIGHT- 70, 80, 80)];
        
        [searchButton setBackgroundImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
        
        [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];

        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        imageView.contentMode  = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:imageView];
        //Photo Array
      
        imageView.image = [UIImage imageNamed:[self.welcomePhotos objectAtIndex:0]];
        
        [self transitionPhotos];
        [NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(transitionPhotos) userInfo:nil repeats:YES];
        [citiesLable sizeToFit];

        citiesLable= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT- 70, 200, 80)];
        [citiesLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        
        citiesLable.textColor = [UIColor whiteColor];
        citiesLable.textAlignment = NSTextAlignmentCenter;
        citiesLable.text = currentState.Statename;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",citiesLable.text]];
        [self.view addSubview:menuButton];
        [self.view addSubview:citiesLable];
        [self.view addSubview:searchButton];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     }

-(void)transitionPhotos{
    
    if (photoCount < [randomStatesArray count] - 1){
        photoCount ++;
    }else{
        photoCount = 0;
    }
    
    //Get the current
    currentState = randomStatesArray[photoCount];

    [UIView transitionWithView:imageView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        //citiesLable.text = self.citiesArray [photoCount];
                        citiesLable.text = currentState.Statename;
                        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",citiesLable.text]]; }
     
     
                    completion:NULL];
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self transitionPhotos];
    
}

-(void) searchButtonClicked{
    
  //  USATBV* USASearchStates = [[USATBV alloc]init];
    //itemsTVC.groupInfo = self.groups[indexPath.row];
    
  //  [self.navigationController presentViewController:USASearchStates animated:YES completion:nil];
    
    
    
    
    USATBV *searchViewController = [[USATBV alloc] init];
    [self presentViewController:searchViewController animated:YES completion:nil];
    
}


-(void) menuButtonClicked{
    
    
    
    SampleSheetViewController *svc = [[SampleSheetViewController alloc] init];

 self.PopUpForScore =svc;

NAModalSheet *sheet = [[NAModalSheet alloc] initWithViewController:svc presentationStyle:NAModalSheetPresentationStyleFadeInCentered];
sheet.cornerRadiusWhenCentered = 24.0;
sheet.delegate = self;
svc.modalSheet = sheet;

[sheet presentWithCompletion:^{
    
}];
}

- (void)modalSheetTouchedOutsideContent:(NAModalSheet *)sheet
{
    
    [sheet dismissWithCompletion:^{
        
    }];
    
}


@end
