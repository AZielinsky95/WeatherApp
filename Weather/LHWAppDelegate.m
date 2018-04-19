//
//  LHWAppDelegate.m
//  Weather
//
//  Created by Steven Masuch on 2014-07-30.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHWAppDelegate.h"
#import "CityViewController.h"

@implementation LHWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    
    self.vancouver = [[City alloc] initWithName:@"Vancouver" andTime:@"4:30" andTemp:6 andChanceOfPrecipitation:80.0];
    self.toronto = [[City alloc] initWithName:@"Toronto" andTime:@"1:30" andTemp:2 andChanceOfPrecipitation:20.0];
    self.berlin = [[City alloc] initWithName:@"Berlin" andTime:@"7:30" andTemp:15 andChanceOfPrecipitation:40.0];
    self.miami = [[City alloc] initWithName:@"Miami" andTime:@"11:30" andTemp:28 andChanceOfPrecipitation:15.0];
    self.newyork = [[City alloc] initWithName:@"New York" andTime:@"1:30" andTemp:12 andChanceOfPrecipitation:65.0];
    // Don't forget to assign the window a rootViewController
    
    CityViewController *vancouverViewController = [[CityViewController alloc] initWithNibName:@"CityViewController" bundle:nil];
    
    CityViewController *torontoViewController = [[CityViewController alloc]initWithNibName:@"CityViewController" bundle:nil];
    CityViewController *berlinViewController = [[CityViewController alloc] initWithNibName:@"CityViewController" bundle:nil];
    CityViewController *miamiViewController = [[CityViewController alloc] initWithNibName:@"CityViewController" bundle:nil];
     CityViewController *newYorkController = [[CityViewController alloc] initWithNibName:@"CityViewController" bundle:nil];

    [vancouverViewController setCity:self.vancouver];
    [torontoViewController setCity:self.toronto];
    [berlinViewController setCity:self.berlin];
    [miamiViewController setCity:self.miami];
    [newYorkController setCity:self.newyork];
    
    vancouverViewController.view.tintColor = [UIColor redColor];
     torontoViewController.view.tintColor = [UIColor blueColor];
     berlinViewController.view.tintColor = [UIColor purpleColor];
     miamiViewController.view.tintColor = [UIColor greenColor];
     newYorkController.view.tintColor = [UIColor blackColor ];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:vancouverViewController];

     UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:torontoViewController];

     UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:berlinViewController];
    
     UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:miamiViewController];
    
     UINavigationController *navigationController5 = [[UINavigationController alloc] initWithRootViewController:newYorkController];
    
    
    UITabBarItem *vancouverBar = [[UITabBarItem alloc] initWithTitle:@"Vancouver" image:[UIImage imageNamed:(@"fog")] tag:0];
    UITabBarItem *torontoBar = [[UITabBarItem alloc] initWithTitle:@"Toronto" image:[UIImage imageNamed:(@"fog")] tag:1];
    UITabBarItem *berlinBar = [[UITabBarItem alloc] initWithTitle:@"Berlin" image:[UIImage imageNamed:(@"fog")] tag:2];
    UITabBarItem *miamiBar = [[UITabBarItem alloc] initWithTitle:@"Miami" image:[UIImage imageNamed:(@"fog")] tag:3];
    UITabBarItem *newYorkBar = [[UITabBarItem alloc] initWithTitle:@"New York" image:[UIImage imageNamed:(@"fog")] tag:3];
    
    navigationController1.tabBarItem = vancouverBar;
    navigationController2.tabBarItem = torontoBar;
    navigationController3.tabBarItem = berlinBar;
    navigationController4.tabBarItem = miamiBar;
    navigationController5.tabBarItem = newYorkBar;
    
    NSMutableArray *tabs = [[NSMutableArray alloc] init];
    [tabs addObject:navigationController1];
    [tabs addObject:navigationController2];
    [tabs addObject:navigationController3];
    [tabs addObject:navigationController4];
    [tabs addObject:navigationController5];
    [tabBarController setViewControllers:tabs];


    
    [self.window setRootViewController:tabBarController];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end
