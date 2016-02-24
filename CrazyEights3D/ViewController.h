//
//  ViewController.h
//  CrazyEights3D
//
//  Created by 佐藤麻央 on 2016/02/15.
//  Copyright © 2016年 Mao Sato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *NPCTextView;

@property (strong, nonatomic) IBOutlet UITextView *PlayerTextView;

@property (strong, nonatomic) IBOutlet UILabel *TopCardLabel;

@property (strong, nonatomic) IBOutlet UITextView *SelectionTextVeiw;

@property (strong, nonatomic) IBOutlet UITextField *SelectionTextField;
@property (strong, nonatomic) IBOutlet UILabel *ResultLabel;

@end

