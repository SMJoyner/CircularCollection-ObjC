//
//  DetailViewController.h
//  CircularCollection-ObjC
//
//  Created by Shana Joyner on 4/21/16.
//  Copyright © 2016 Mind Activation Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *currentMenuName;
@property (strong, nonatomic) NSString *currentNameDescr;


@property (strong, nonatomic) IBOutlet UILabel *itemTitleLbl;

@property (strong, nonatomic) IBOutlet UILabel *itemDescrLbl;


@end
