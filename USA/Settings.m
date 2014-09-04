//
//  Settings.m
//  USA
//
//  Created by Rene Candelier on 9/3/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "Settings.h"
#import "USAimagesViewController.h"
#import <MessageUI/MessageUI.h> 

@interface Settings ()<UITextFieldDelegate, UITextViewDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Custom initialization
    
    //--------------------------------TOP CONTENT
    
    
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
    
    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    backButton.layer.cornerRadius = 40.0/2.0;
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor colorWithRed:0.180f green:0.835f blue:0.725f alpha:1.0f];
    
    
    UILabel * letsPlayLable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 15, 160, headerView.frame.size.height/2)];
    [letsPlayLable setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:30]];
    
    letsPlayLable.textColor = [UIColor whiteColor];
    letsPlayLable.textAlignment = NSTextAlignmentCenter;
    letsPlayLable.text = @"Settings";
    
    [headerView addSubview:letsPlayLable];
    [self.view addSubview:backButton];
    
    
    UIButton * Feedback = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT-120, 200, 45)];
    
    [Feedback setTitle: @"Feedback" forState: UIControlStateNormal];
    
    [Feedback.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0]];
    
    [Feedback setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    Feedback.layer.cornerRadius = 5;
    Feedback.backgroundColor = [UIColor colorWithRed:0.694f green:0.243f blue:0.953f alpha:1.0f];
    
    [Feedback addTarget:self action:@selector(feedbackButton) forControlEvents:UIControlEventTouchUpInside
     ];
    
    
    [self.view addSubview:Feedback];

    
    UILabel * versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT-70, 180, 60)];
    [versionLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:25]];
    versionLabel.textColor = [UIColor darkGrayColor];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.text = @"Version 1.0";
    [self.view addSubview:versionLabel];
    

}


-(void) backButtonClicked{
    USAimagesViewController *goToMenu= [[USAimagesViewController alloc] init];
    [self presentViewController:goToMenu animated:NO completion:nil];
}

- (void)feedbackButton{
    // Email Subject
    NSString *emailTitle = @"Feedback - USA";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"info@NovusMobile.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    if ([UIMenuController sharedMenuController]) {
        
        [UIMenuController sharedMenuController].menuVisible = NO;
        
    }
    
    return NO;
}


@end
