//
//  AppDelegate.m
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import "AppDelegate.h"
#import "ListaDeTimesViewController.h"
#import "WikipediaTimeViewController.h"
#import "GaleriaDoTimeViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
	
	//criando a lista de times
	ListaDeTimesViewController *listaDeTimesVC = [[ListaDeTimesViewController alloc] init];
	listaDeTimesVC.title = @"Times";
	
	//adicionando a lista em um navigation controller e adicionando na window
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:listaDeTimesVC];
	
    // Temos que iniciar sem time caso o usuário esteja usando um iPad
    if (isIpadDevice)
    {
        WikipediaTimeViewController *wikipediaViewController = [[WikipediaTimeViewController alloc] init];
        GaleriaDoTimeViewController *galeriaViewController = [[GaleriaDoTimeViewController alloc] init];
        
        NSArray *controllers = [NSArray arrayWithObjects:wikipediaViewController, galeriaViewController, nil];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = controllers;
        
        UINavigationController *tabNavigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
        
        UISplitViewController *splitVC = [[UISplitViewController alloc] init];
        splitVC.viewControllers = [NSArray arrayWithObjects:navController, tabNavigationController, nil];
        self.window.rootViewController = splitVC;
        
        [wikipediaViewController release];
        [galeriaViewController release];
        [tabBarController release];
        [tabNavigationController release];
       
    }
    // Caso seja um iPhone
    else 
    {
        self.window.rootViewController = navController;
    }
    
    [self.window makeKeyAndVisible];
	[listaDeTimesVC release];
	[navController release];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
