//
//  HomeViewController.h
//  homework1
//
//  Created by Cao Wei on 14-2-18.
//  Copyright (c) 2014年 Cao Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface HomeViewController : UIViewController<UITextFieldDelegate>{
}

@property (nonatomic) MapViewController *nextView;


@property (strong, nonatomic) IBOutlet UITextField *field1;

@property (strong, nonatomic) IBOutlet UITextField *field2;

@property (strong, nonatomic) IBOutlet UITextField *field3;

- (IBAction)done:(id)sender;


@end
