//
//  USATBV.m
//  USA
//
//  Created by Rene Candelier on 8/15/14.
//  Copyright (c) 2014 Novus Mobile. All rights reserved.
//

#import "USATBV.h"
#import "StateClass.h"
#import "DataStore.h"
#import "NSArray+RandomSort.h"
#import "USAViewStateVC.h"

@interface USATBV ()
@property NSMutableArray *stateArray;
@property NSArray *RandomStates;

@end

@implementation USATBV{
    UITextField * searchTextbox;
    UIButton * backButton;
   
    UIButton * searchButton;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        // Get current question
        
         //NSString * state =[NSString stringWithFormat:@"What is the capital of %@?",currentState.Statename];
       // NSLog(@"%@", state);

        
        self.statesArray = [@[
                    [@{@"state":@"Florida",
                       @"nickname":@"The Sunshine State",
                       @"abbreviation":@"FL"
                       } mutableCopy],


                    [@{@"state":@"Georgia",
                       @"nickname":@"The Peach State",
                       @"abbreviation":@"GA"
                       } mutableCopy]


                    
                        ]mutableCopy];
    }
    

        
        
    
    
    return self;
}

//-(NSDictionary *)getStateDictionary
//{
//    if (self.stateDictionary == nil)
//    {
//        self.stateDictionary = [[NSMutableDictionary alloc] init];
//        
//        for (int i=0; i < [self.stateArray count]; i++)
//        {
//            StateClass *state = self.stateArray[i];
//            [self.stateDictionary setObject:state forKey:state.StateAbbreviation];
//        }
//    }
//    
//    return self.stateDictionary;
//}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    


    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];

    self.tableView.tableHeaderView = headerView;
    headerView.backgroundColor = [UIColor darkGrayColor];

    
    //headerView.backgroundColor = [UIColor colorWithRed:0.976f green:0.098f blue:0.329f alpha:1.0f];
    //Setting the search box
    searchTextbox = [[UITextField alloc]initWithFrame:CGRectMake(60, 15, 200, 40)];
    [searchTextbox setBorderStyle:UITextBorderStyleNone];
    searchTextbox.backgroundColor = [UIColor whiteColor];
    searchTextbox.layer.cornerRadius = 10;
    
    
    //adding search button
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 15, 40, 40.0)];
    //searchButton.backgroundColor = [UIColor colorWithRed:0.667f green:0.655f blue:0.639f alpha:1.0f];
    
    
    
    //Add image to search button
    searchButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 15, 40, 40.0)];
    UIImage *searchbuttonImage = [UIImage imageNamed:@"searchButton.png"];
    [searchButton setBackgroundImage:searchbuttonImage forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    //Circle Radius
    searchButton.layer.cornerRadius = 40.0/2.0;
    //[searchButton addTarget:self action:@selector(fillin) forControlEvents:UIControlEventTouchUpInside];
    
    
    //Back Button
    
    
    //searchButton.backgroundColor = [UIColor colorWithRed:0.667f green:0.655f blue:0.639f alpha:1.0f];
    
    
    
    //Add image to search button
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];

    UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside
     ];
    //Circle Radius
    backButton.layer.cornerRadius = 40.0/2.0;

    
    
    
    
    
    
    //Setting the separators to color Black
    [self.tableView setSeparatorColor:[UIColor darkGrayColor]];
    
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Adding the Objects to the View
    [headerView addSubview:searchTextbox];
    [headerView addSubview:searchButton];
    [headerView addSubview:backButton];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void)backButtonClicked{
    [self dismissViewControllerAnimated:NO completion:nil];

}

-(void)searchButtonClicked{
    
    NSLog(@"Search Button has been clicked");
    
    [self.tableView reloadData];
    
    
    [searchTextbox resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

 
    self.RandomStates = [[DataStore sharedInstance] getStates];
    StateClass *currentState = self.RandomStates[indexPath.row];
 
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.text = currentState.Statename;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@",currentState.StateCapitol, currentState.StateAbbreviation];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    
    
    
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    USAViewStateVC * stateViewDetails = [[USAViewStateVC alloc] init];
    self.RandomStates = [[[DataStore sharedInstance] getStates] shuffle];
    
   // stateViewDetails.indexForArray = [[indexPath.row]intValue];
    NSNumber *selRow = [[NSNumber alloc] initWithInteger:indexPath.row];
    stateViewDetails.indexForArray = selRow;
    
    stateViewDetails.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:stateViewDetails animated:YES completion:nil];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
