//
//  HomeViewController.m
//  homework1
//
//  Created by Cao Wei on 14-2-18.
//  Copyright (c) 2014年 Cao Wei. All rights reserved.
//

#import "HomeViewController.h"
#import "MapViewController.h"

@interface HomeViewController ()
@property(nonatomic, strong) NSString *query;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSString *radius;
@end

@implementation HomeViewController
@synthesize nextView,field1,field2,field3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)done:(id)sender {
    // Get text fields contents and save them by press the button
    // "Press this to save info"
    self.query = [NSString stringWithString:field1.text];
    self.type = [NSString stringWithString:field2.text];;
    self.radius = [NSString stringWithString:field3.text];;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Set background color as yellow
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Realize the segue and pass the data to the next viewcontroller.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"go"]) {
        MapViewController *receiver = segue.destinationViewController;
        receiver.queryname = self.query;
        receiver.type = self.type;
        receiver.radius = self.radius;
    }
}

@end
