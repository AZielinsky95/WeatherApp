//
//  DetailedViewController.m
//  Weather
//
//  Created by Alejandro Zielinsky on 2018-04-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *cityTime;
@property (weak, nonatomic) IBOutlet UILabel *cityChanceOfPrecipitation;

@end

@implementation DetailedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cityName.text = self.city.name;
    self.cityTime.text = self.city.currentTime;
    self.cityChanceOfPrecipitation.text = [NSString stringWithFormat:@"%.2f",self.city.chanceOfPrecipitation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
