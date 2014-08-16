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


@interface USAimagesViewController (){

    
    int photoCount;
    
    UIImageView * imageView;
    
    UILabel * citiesLable;
}

@end

@implementation USAimagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
        self.welcomePhotos = [NSArray arrayWithObjects:@"Cali.jpg",@"mia.jpg", @"seattle.jpg",@"nyc.jpg", @"chicago.jpg",@"atl.jpg",  nil];
        
        
        self.citiesArray = [NSArray arrayWithObjects:@"California",@"Miami", @"Seattle",@"New York", @"Chicago",@"Atlanta",  nil];
        imageView.image = [UIImage imageNamed:[self.welcomePhotos objectAtIndex:0]];
        [NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(transitionPhotos) userInfo:nil repeats:YES];
        [citiesLable sizeToFit];

        citiesLable= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-75, SCREEN_HEIGHT- 70, 150, 80)];
       // [citiesLable setCenter:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT- 120)];
        [citiesLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
        
        citiesLable.textColor = [UIColor whiteColor];
        citiesLable.textAlignment = NSTextAlignmentCenter;
        citiesLable.text = self.citiesArray [photoCount];

        
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
    
    if (photoCount < [self.welcomePhotos count] - 1){
        photoCount ++;
    }else{
        photoCount = 0;
    }
    
    
    [UIView transitionWithView:imageView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        citiesLable.text = self.citiesArray [photoCount];
                        
                        imageView.image = [UIImage imageNamed:[self.welcomePhotos objectAtIndex:photoCount]]; }
                    completion:NULL];
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
