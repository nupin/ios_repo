//
//  MasterViewController.m
//  Purchase Receipt
//
//  Created by Nupin Pillai on 12/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "PRViewController.h"
#import "DetailViewController.h"
#import "MenuTableViewCell.h"

@interface MasterViewController ()


@property NSMutableArray *menuArray;
@property NSMutableDictionary *tableCellImageDic ;


@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    _menuArray = [[NSMutableArray alloc] initWithObjects:@"scanmenu.png",@"pr.png", nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       // NSDate *object = self.menuArray[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
       // [controller setDetailItem:object];
      //  controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
      //  controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_menuArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    
    if (cell == nil) {
        
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
        
    }
    
    cell.tableImageView.image = [UIImage imageNamed:[_menuArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    PRViewController *orderViewController ;
    DetailViewController *detailView ;
    
    [appDelegate.splitViewController viewWillDisappear:YES];
    NSMutableArray *viewControllerArray=[[NSMutableArray alloc] initWithArray:[[appDelegate.splitViewController.viewControllers objectAtIndex:1] viewControllers]];
    [viewControllerArray removeLastObject];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    if(indexPath.row == 1)
    {
    
        if (orderViewController==nil) {
        
        orderViewController = [storyboard instantiateViewControllerWithIdentifier:@"PRViewController"];
            
        }
        [viewControllerArray addObject:orderViewController];
        appDelegate.splitViewController.delegate = orderViewController;
    }
    else
    {
        detailView = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        [viewControllerArray addObject:detailView];
        appDelegate.splitViewController.delegate = detailView;

    }
    
    
    
    
    [[appDelegate.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
    
    [appDelegate.splitViewController viewWillAppear:YES];
    [tableView reloadData];
    
}

@end
