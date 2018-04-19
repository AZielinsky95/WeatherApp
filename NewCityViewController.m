//
//  NewCityViewController.m
//  Weather
//
//  Created by Alejandro Zielinsky on 2018-04-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "NewCityViewController.h"
#import "City.h"

@interface NewCityViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *cityTemperatureTextField;


@end

@implementation NewCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addCity
{
    City *city = [[City alloc]
                  initWithName:self.cityNameTextField.text andTime:nil andTemp:[self.cityTemperatureTextField.text intValue] andChanceOfPrecipitation:0];
    
    NSLog(@"ADDED %@",city.name);
    
}
- (IBAction)addCityButton:(id)sender
{
    [self addCity];
    [self dismissViewControllerAnimated:YES completion:nil];
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
