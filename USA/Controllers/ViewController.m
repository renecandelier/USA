//
//  ViewController.m
//  USStatesColorMapDemo
//
//  Created by Andrey Cherkashin on 07.05.13.
//  Copyright (c) 2013 Andrey Cherkashin. All rights reserved.
//

#import "ViewController.h"
#import "USStatesColorMap.h"
#import "MapCustomizationViewController.h"

NSInteger const NumOfStates = 51;

@interface ViewController (Private) <MapCustomizationViewControllerDelegate>

-(UIColor*)randomColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fillMapWithBlackColor];
    
    [self setRandomColorForStateByName:@"Alaska"];
    
    
    
    
    self.statesNames = [@[
                    @"Alabama",
                    @"Alaska",
                    @"Arkansas",
                    @"Arizona",
                    @"California",
                    @"Colorado",
                    @"Connecticut",
                    @"Delaware",
                    @"Florida",
                    @"Georgia",
                    @"Hawaii",
                    @"Idaho",
                    @"Illinois",
                    @"Indiana",
                    @"Iowa",
                    @"Kansas",
                    @"Kentucky",
                    @"Louisiana",
                    @"Maine",
                    @"Maryland",
                    @"Massachusetts",
                    @"Michigan",
                    @"Minnesota",
                    @"Mississippi",
                    @"Missouri",
                    @"Montana",
                    @"Nebraska",
                    @"Nevada",
                    @"New Hampshire",
                    @"New Jersey",
                    @"New Mexico",
                    @"New York",
                    @"North Carolina",
                    @"North Dakota",
                    @"Ohio",
                    @"Oklahoma",
                    @"Oregon",
                    @"Pennsylvania",
                    @"Rhode Island",
                    @"South Carolina",
                    @"South Dakota",
                    @"Tennessee",
                    @"Texas",
                    @"Utah",
                    @"Virginia",
                    @"Vermont",
                    @"Washington",
                    @"West Virginia",
                    @"Wisconsin",
                    @"Wyoming",
                    @"District of Columbia"
                    ]mutableCopy];

    
}

- (IBAction)customizeMap:(id)sender {
	MapCustomizationViewController *mapCustomizationViewController;
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    mapCustomizationViewController = [[MapCustomizationViewController alloc] initWithNibName:@"MapCustomizationViewController_iPhone" bundle:nil];
	} else {
	    mapCustomizationViewController = [[MapCustomizationViewController alloc] initWithNibName:@"MapCustomizationViewController_iPad" bundle:nil];
	}
	
	mapCustomizationViewController.delegate = self;
	
	[self.navigationController pushViewController:mapCustomizationViewController animated:YES];
}

- (IBAction)nextButton:(id)sender {
    
    int map = arc4random_uniform(50);
    
    [self setRandomColorForStateByName:self.statesNames[map]];
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];

}

@end

@implementation ViewController (Private)

-(UIColor*)randomColor {
	float R = (float)(rand() % 255)/255,
		G = (float)(rand() % 255)/255,
		B = (float)(rand() % 255)/255;
	return [UIColor colorWithRed:R green:G blue:B alpha:1.0];
}

#pragma mark - MapCustomizationViewControllerDelegate implementation

-(void)randomizeStateColors {
	__weak ViewController *safeSelf = self;
	[_statesMap performUpdates:^{
		for (long i = 0; i < NumOfStates; i++) {
			[_statesMap setColor:[safeSelf randomColor] forState:i];
		}
	}];
}

-(void)fillMapWithBlackColor {
	[_statesMap setColorForAllStates:[UIColor darkGrayColor]];
}

-(void)fillMapWithRandomColor {
	[_statesMap setColorForAllStates:[self randomColor]];
}

-(void)setBlackColorForStateByCode:(NSString*)stateCode {
	[_statesMap setColor:[UIColor darkGrayColor] forStateByCode:stateCode];
}

-(void)setRandomColorForStateByCode:(NSString*)stateCode {
	[_statesMap setColor:[self randomColor] forStateByCode:stateCode];
}

-(void)setBlackColorForStateByName:(NSString*)stateName {
	[_statesMap setColor:[UIColor darkGrayColor] forStateByName:stateName];
}

-(void)setRandomColorForStateByName:(NSString*)stateName {
	[_statesMap setColor:[self randomColor] forStateByName:stateName];
}



@end