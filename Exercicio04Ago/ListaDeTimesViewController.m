//
//  ListaDeTimesViewController.m
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import "ListaDeTimesViewController.h"
#import "Time.h"
#import "WikipediaTimeViewController.h"
#import "GaleriaDoTimeViewController.h"

@interface ListaDeTimesViewController ()

@end

@implementation ListaDeTimesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	times = [Time timesDoArquivo];
	[times retain];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (isIpadDevice)
    {
        return YES;
    }
    else
    {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[times allKeys] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[times allKeys] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSString *estado = [[times allKeys] objectAtIndex:section];
    return [[times objectForKey:estado] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    
	NSString *estado = [[times allKeys] objectAtIndex:indexPath.section];
	NSArray *timesDoEstado = [times objectForKey:estado];
	
	Time *time = [timesDoEstado objectAtIndex:indexPath.row];
	cell.textLabel.text = time.nome;
	
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *estado = [[times allKeys] objectAtIndex:indexPath.section];
	Time *time = [[times objectForKey:estado] objectAtIndex:indexPath.row];
    
    if (isIphoneDevice)
    {
        WikipediaTimeViewController *wikipediaViewController = [[WikipediaTimeViewController alloc] initWithTime:time];
        GaleriaDoTimeViewController *galeriaViewController = [[GaleriaDoTimeViewController alloc] initWithTime:time];
        
        NSArray *controllers = [NSArray arrayWithObjects:wikipediaViewController, galeriaViewController, nil];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = controllers;
        tabBarController.title = time.nome;
        
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:tabBarController animated:YES];
        
        [wikipediaViewController release];
        [galeriaViewController release];
        [tabBarController release];
    } 
    else // É um iPad
    {
        UINavigationController *navigationControllerDaDireita = (UINavigationController *) [self.navigationController.splitViewController.viewControllers objectAtIndex:1];
        UITabBarController *tabBarTimes = (UITabBarController *) [navigationControllerDaDireita.viewControllers objectAtIndex:0];
        tabBarTimes.title = time.nome;
        
        WikipediaTimeViewController *wikipediaVC = [tabBarTimes.viewControllers objectAtIndex:0];
        GaleriaDoTimeViewController *galeriaVC = [tabBarTimes.viewControllers objectAtIndex:1];
        
        wikipediaVC.time = time;
        galeriaVC.time = time;
    }
    

}

#pragma mark -

- (void)dealloc {
    [times release];
    [super dealloc];
}

@end









