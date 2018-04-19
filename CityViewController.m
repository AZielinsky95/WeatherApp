//
//  CityViewController.m
//  Weather
//
//  Created by Alejandro Zielinsky on 2018-04-18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "CityViewController.h"
#import "DetailedViewController.h"
#import "NewCityViewController.h"
#import "Animator.h"

@interface CityViewController () <UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *cityTemp;
@property Animator *anim;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@property UIPanGestureRecognizer* panRecognizer;
@end

@implementation CityViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cityName.text = self.city.name;
    self.cityTemp.text = [NSString stringWithFormat:@"%d",self.city.temperature];
    

    UIBarButtonItem *addCity = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self
                                action:@selector(addCity)];
    
   self.navigationItem.rightBarButtonItem = addCity;
    
    self.anim = [[Animator alloc]init];
    
    
}

-(void)addCity
{
    UIViewController *addCityVC = [[NewCityViewController alloc]initWithNibName:@"NewCityViewController" bundle:nil];
    
    [self.navigationController presentViewController:addCityVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDetails:(UIButton *)sender
{
    DetailedViewController *detailedViewController = [[DetailedViewController alloc] initWithNibName:@"DetailedViewController" bundle:nil];
    
    //set properties
    detailedViewController.city = self.city;
    self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navigationController.view addGestureRecognizer:self.panRecognizer];
    self.navigationController.delegate = self;

    [self.navigationController pushViewController:detailedViewController animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.anim;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}

- (void)pan:(UIPanGestureRecognizer*)recognizer
{
    UIView* view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [recognizer locationInView:view];
        if (location.x >  CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) { // left half
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    
//}


@end
