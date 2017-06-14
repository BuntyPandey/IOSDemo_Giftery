//
//  ViewController.m
//  GifteryDemo
//
//  Created by Amit Pandey on 13/06/17.
//  Copyright © 2017 Amit Pandey. All rights reserved.
//

#import "ViewController.h"
#import "GiftTableViewCell.h"
#import "Gift.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource> {
    
}
@property (weak, nonatomic) IBOutlet UITableView *giftTableView;
@property (strong, nonatomic) NSMutableArray *giftDataList;
@property (weak, nonatomic) IBOutlet UIView *toggleView;
@end

@implementation ViewController

#pragma mark -
#pragma mark - View Lify Cycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Events";
    [self doInitialSetUp];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - General Method
#pragma mark -

- (void)doInitialSetUp {
    self.toggleView.layer.cornerRadius = 30.0;
    self.toggleView.layer.masksToBounds = YES;
    [self getDataFromLocalPath];
}

-(void)getDataFromLocalPath {
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"jsonresponse" ofType:@"txt"];
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    NSArray *data = (NSArray *)[NSJSONSerialization
                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                options:0 error:NULL];
    [self setUsersData:data];
}

-(void)setUsersData:(NSArray *)rawData
{
    if(!self.giftDataList)
        self.giftDataList = [[NSMutableArray alloc] init];
    
    [self.giftDataList removeAllObjects];
    
    for (NSDictionary *data in rawData) {
        Gift *giftObj = [[Gift alloc] initWithData:data];
        [self.giftDataList addObject:giftObj];
    }
    [self.giftTableView reloadData];
}

#pragma mark -
#pragma mark - TableView Methods
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.giftDataList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GiftTableViewCell *cell = (GiftTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"GiftTableViewCell"];
    if (cell == nil) {
        cell = [[GiftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GiftTableViewCell"];
    }
    Gift *giftObj = [self.giftDataList objectAtIndex:indexPath.row];
    [cell configureCellData:giftObj];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0f;
}



@end
