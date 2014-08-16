//
//  MoreInfoWebVC.m
//  USA
//
//  Created by Rene Candelier on 8/16/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "MoreInfoWebVC.h"

@interface MoreInfoWebVC ()

@end

@implementation MoreInfoWebVC{
    UIWebView * webView;
    
    //Back Button
    UIButton * backButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-70)];
        UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        
        [self.view addSubview:headerView];
        headerView.backgroundColor = [UIColor darkGrayColor];
        
        
        backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
        
        UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
        [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
         ];
        backButton.layer.cornerRadius = 40.0/2.0;
        
        
        [self.view addSubview:webView];
        [self.view addSubview:backButton];
        
        self.view.backgroundColor = [UIColor whiteColor];

        
    }
    return self;
}


- (void)setLink:(NSString *)link{
    _link = link;
    
    NSURL * url = [NSURL URLWithString:link];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];

}

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
-(void)backButtonClicked{[self dismissViewControllerAnimated:NO completion:nil];}

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
